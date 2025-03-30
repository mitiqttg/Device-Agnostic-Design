import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../widgets/drawer.dart' as prefix;
import '../widgets/footer.dart';
import '../theme/theme_provider.dart';
import 'package:provider/provider.dart';
import './home.dart' as home;

class AdoptForm extends StatelessWidget {
  final int petId;

  const AdoptForm({super.key, required this.petId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _buildAppBar(context),
        drawer: const prefix.NavigationDrawer(location: 'Adopt Form'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context),
              CandidateInputWidget(petId: petId),
              CandidateListWidget(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      title: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const home.HomePage())),
        child: const Text(
          'Petlastaa',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(222, 205, 226, 248),
       
      elevation: 10.0,
      centerTitle: true,
      actions: [
        _searchField(),
        // Switch(
        //   thumbIcon: WidgetStateProperty.all(
        //     themeProvider.isDarkMode 
        //         ? const Icon(Icons.wb_sunny) 
        //         : const Icon(Icons.nightlight_round),
        //   ),
        //   focusColor: const Color.fromARGB(255, 175, 214, 238),
        //   activeColor: const Color.fromARGB(255, 68, 172, 241),
        //   value: themeProvider.isDarkMode,
        //   onChanged: (value) => themeProvider.toggleTheme(),
        // ),
        const BackButton(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Text(
        'Adoption Application for Pet #$petId',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container _searchField() {
    double appBarHeight = AppBar().preferredSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: appBarHeight / 2,
      width: appBarHeight * 4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: SearchAnchor(
        builder: (context, controller) => SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
          onTap: () => controller.openView(),
          onChanged: (_) => controller.openView(),
          leading: const Icon(Icons.search),
        ),
        suggestionsBuilder: (context, controller) => List.generate(5, 
          (index) => ListTile(title: Text('item $index'),),
      ),
    ));
  }
}

class Candidate {
  final int petId;
  final String name;
  final String address;
  final String phone;
  final String dob;
  final String job;
  final String description;

  Candidate(this.petId, this.name, this.address, this.phone, this.dob, this.job, this.description);

  Map toJson() => {
    'petId': petId,
    'name': name,
    'address': address,
    'phone': phone,
    'dob': dob,
    'job': job,
    'description': description,
  };

  factory Candidate.fromJson(Map json) => Candidate(
    json['petId'],
    json['name'],
    json['address'],
    json['phone'],
    json['dob'],
    json['job'],
    json['description'],
  );
}

class CandidateController {
  final storage = Hive.box("storage");
  RxList candidates = [].obs;

  CandidateController() {
    _initializeStorage();
  }

  void _initializeStorage() {
    if (storage.get('candidates') == null) storage.put('candidates', []);
    candidates.value = storage.get('candidates').map((c) => Candidate.fromJson(c)).toList();
  }

  void add(Candidate candidate) {
    candidates.add(candidate);
    _save();
  }

  void delete(Candidate candidate) {
    candidates.remove(candidate);
    _save();
  }

  void _save() {
    storage.put('candidates', candidates.map((c) => c.toJson()).toList());
  }

  get size => candidates.length;
}

class CandidateListWidget extends StatelessWidget {
  final candidateController = Get.find<CandidateController>();

  CandidateListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => candidateController.size == 0
          ? const Padding(
              padding: EdgeInsets.all(20),
              child: Text('No applications yet'),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: candidateController.candidates.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(candidateController.candidates[index].name),
                subtitle: Text('Pet ID: ${candidateController.candidates[index].petId}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => candidateController.delete(candidateController.candidates[index]),
                ),
              ),
            ),
    );
  }
}

class CandidateInputWidget extends StatelessWidget {
  final int petId;
  final candidateController = Get.find<CandidateController>();
  static final _formKey = GlobalKey<FormBuilderState>();

  CandidateInputWidget({super.key, required this.petId});

  void _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      final candidate = Candidate(
        petId,
        _formKey.currentState!.value['candidate'],
        _formKey.currentState!.value['address'],
        _formKey.currentState!.value['phone'],
        _formKey.currentState!.value['dob'],
        _formKey.currentState!.value['job'],
        _formKey.currentState!.value['description'],
      );
      candidateController.add(candidate);
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            _buildFormField('candidate', 'Full Name'),
            _buildFormField('address', 'Street Address'),
            _buildFormField('phone', 'Phone Number', TextInputType.phone),
            _buildFormField('dob', 'Date of Birth'),
            _buildFormField('job', 'Occupation'),
            _buildDescriptionField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Submit Application"),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String name, String label, [TextInputType? type]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: type,
        validator: FormBuilderValidators.required(),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return FormBuilderTextField(
      name: 'description',
      decoration: const InputDecoration(
        labelText: 'Why should we choose you?',
        border: OutlineInputBorder(),
        alignLabelWithHint: true,
      ),
      maxLines: 4,
      validator: FormBuilderValidators.required(),
    );
  }
}
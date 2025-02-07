import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../widgets/drawer.dart' as prefix;
import '../widgets/footer.dart';
import '../theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Adoptform extends StatelessWidget {
  const Adoptform({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            CandidateInputWidget(),
            CandidateListWidget(),
          ],
        ),
      ),
    );
  }
}

class Candidate {
  final String name;
  final String address;
  final String phone;
  final String dob;
  final String job;
  final String description;

  Candidate(this.name, this.address, this.phone, this.dob, this.job, this.description);

  Map toJson() => {
        'name': name,
        'address': address,
        'phone': phone,
        'dob': dob,
        'job': job,
        'description': description,
      };

  factory Candidate.fromJson(Map json) {
    return Candidate(json['name'], json['address'], json['phone'], json['dob'], json['job'], json['description']);
  }
}

class CandidateController {
  final storage = Hive.box("storage");

  RxList candidates;

  CandidateController() : candidates = [].obs {
    if (storage.get('candidates') == null) {
      storage.put('candidates', []);
    }

    candidates.value = storage
        .get('candidates')
        .map(
          (candidate) => Candidate.fromJson(candidate),
        )
        .toList();
  }

  void _save() {
    storage.put(
      'candidates',
      candidates.map((candidate) => candidate.toJson()).toList(),
    );
  }

  void add(Candidate candidate) {
    candidates.add(candidate);
    _save();
  }

  // void changeCompleted(Candidate candidate) {
  //   candidate.address = !candidate.address;
  //   candidates.refresh();
  //   _save();
  // }

  void delete(Candidate candidate) {
    candidates.remove(candidate);
    candidates.refresh();
    _save();
  }

  get size => candidates.length;
}

class CandidateListWidget extends StatelessWidget {
  final candidateController = Get.find<CandidateController>();

  CandidateListWidget({super.key});

  // const CandidateListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => candidateController.size == 0
          ? const Text('No candidates')
          : Column(
              children: candidateController.candidates
                  .map(
                    (candidate) => Text(candidate.name),
                  )
                  .toList(),
            ),
    );
  }
}

class CandidateInputWidget extends StatelessWidget {
  final candidateController = Get.find<CandidateController>();
  static final _formKey = GlobalKey<FormBuilderState>();

  CandidateInputWidget({super.key});

  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      Candidate candidate = Candidate(
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
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'candidate',
            decoration: const InputDecoration(
              hintText: 'Candidate name',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'address',
            decoration: const InputDecoration(
              hintText: 'Your address',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'phone',
            decoration: const InputDecoration(
              hintText: 'Your phone number',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'dob',
            decoration: const InputDecoration(
              hintText: 'Your date of birth',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'job',
            decoration: const InputDecoration(
              hintText: 'Your job',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'description',
            decoration: const InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.required(),
          ),
          
          ElevatedButton(
            onPressed: _submit,
            child: const Text("Add candidate"),
          ),
        ],
      ),
    );
  }
}

class Breakpoints {
  static const sm = 640;
  static const md = 768;
  static const lg = 1024;
  static const xl = 1280;
  static const xl2 = 1536;
}

class AdoptPage extends StatefulWidget {
  const AdoptPage({super.key});

  @override
  State<AdoptPage> createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  bool isSwitched = true;

  @override
  void initState() {
    super.initState();
  }

  //------------------------------------------------------------Search box
  Container _searchField() {
    double appBarHeight = AppBar().preferredSize.height;
    // double appBarWidth = AppBar().preferredSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: appBarHeight / 2, 
      width: appBarHeight * 4 ,

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
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 10.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {},
            );
          });
        },
      ),
    );
  }
  //------------------------------------------------------------App bar
  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        title: Text(
          'Petlastaa',
          style: TextStyle(
            color: isSwitched ? const Color.fromARGB(255, 255, 0, 153) : const Color.fromARGB(255, 241, 119, 212),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: isSwitched ? const Color.fromARGB(255, 157, 213, 231) : const Color.fromARGB(255, 98, 208, 228),
        elevation: 10.0,
        centerTitle: true,
        actions: [
          _searchField(),
          Switch(
            thumbIcon: WidgetStateProperty.all(
              isSwitched ? const Icon(Icons. wb_sunny) : const Icon(Icons.  nightlight_round),
            ),
            focusColor: const Color.fromARGB(255, 175, 214, 238),
            activeColor: const Color.fromARGB(255, 68, 172, 241),
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = !isSwitched;
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              });  
            },
          ),
          const BackButton(),
        ],
      );
    }
    
    //------------------------------------------------------------Body of Home
    Column bodyView() {
      return Column(
        children: [
          CandidateInputWidget(),
          
          // Footer section
          const Footer(),
        ],
      );
    }

    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface, 
        appBar: appBar(),
        drawer: const prefix.NavigationDrawer(location: 'Home'),
        body: bodyView(),
      ),
    );
  }
}
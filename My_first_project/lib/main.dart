import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';
import 'package:get/get.dart';
import 'pages/rescue.dart' as resq;
import 'pages/home.dart' as prefix;
import 'pages/donation.dart' as dona;
import 'pages/adoptform.dart' as adopt;
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<adopt.CandidateController>(() => adopt.CandidateController());
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () =>
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const prefix.HomePage(),
          ),
        ),
        GetPage(name: "/rescue", page: () => 
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const resq.RescuePage(),
          ),
        ),
        GetPage(name: "/donate", page: () => 
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const dona.DonationPage(),
          ),
        ),
        GetPage(name: "/adopt", page: () => 
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: adopt.Adoptform(),
          ),
        ),
      ],
    ),
  );
}


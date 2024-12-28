import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';
import 'package:get/get.dart';
import 'pages/rescue.dart' as prefix;
import 'pages/home.dart' as prefix;
import 'pages/account.dart' as prefix;

void main() {
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
            child: const prefix.RescuePage(),
          ),
        ),
        GetPage(name: "/account", page: () => 
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const prefix.AccountPage(),
          ),
        ),
      ],
    ),
  );
}


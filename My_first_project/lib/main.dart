import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footer/footer_view.dart';
import 'models/data.dart' as data;
import 'models/models.dart';
import 'components/buttonTheme.dart';
import 'theme/theme.dart';
import 'package:provider/provider.dart';
import './widgets/drawer.dart' as prefix;
import 'theme/theme_provider.dart';
import 'package:get/get.dart';
import 'pages/rescue.dart' as prefix;
import 'pages/home.dart' as prefix;
void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => ThemeProvider(),
    //   child: HomePage(),
    // ),
    GetMaterialApp(
      initialRoute: "/",
      getPages: [
        // GetPage(name: "/pelastaa", page: () =>const HomePage(),),
        // GetPage(name: "/pelastaa/rescue", page: () => const Rescue(),),
        GetPage(name: "/", page: () =>
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const prefix.HomePage(),
          ),
        ),
        GetPage(name: "/rescue", page: () => 
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const prefix.Rescue(),
          ),
        ),
      ],
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/bindings/general_bindings.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeDesinge.lightTheme,
      initialBinding: GenralBindings(),
      darkTheme: ThemeDesinge.darkTheme,
      home:const Scaffold(
        backgroundColor: TColor.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: TColor.white,
          ),
        ),
      ),
      // home:const OnBordingScreen(),
    );
  }
}
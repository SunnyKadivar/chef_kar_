import 'package:chef_kart/utils/common_import.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: GoogleFonts.openSans().fontFamily,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
              elevation: 0,
              titleTextStyle: AppFontStyle.appBarFont)),
      home: const SelectDishScreen(),
    );
  }
}

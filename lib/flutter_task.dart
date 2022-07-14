import 'package:flutter/material.dart';
import 'package:flutter_task/providers/home_page_provider.dart';
import 'package:flutter_task/providers/login_page_provider.dart';
import 'package:flutter_task/router.dart';
import 'package:flutter_task/screens/login_page.dart';
import 'package:flutter_task/utils/global_variable.dart';
import 'package:flutter_task/utils/theme.dart';
import 'package:provider/provider.dart';

class FlutterTask extends StatelessWidget {
  const FlutterTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginPageProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: MaterialApp(
          key: const Key('material_app'),
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: CustomTheme.theme(context),
          home: const LoginPage(),
          onGenerateRoute: generateRoute),
    );
  }
}

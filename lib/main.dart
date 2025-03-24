import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_flutter_app/screens/newtestscreen.dart';
import 'screens/features_screen.dart';
import 'screens/main_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/permission_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Think Sync',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewTestScreen(),
      routes: {
        "/features": (context) => const FeaturesScreen(),
        "/signin": (context) => const SignInScreen(),
        "/main": (context) => const MainScreen(),
        "/register": (context) => const RegisterScreen(),
        "/forgot_password": (context) => const ForgotPasswordScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/permission") {
          final userEmail = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => PermissionScreen(userEmail: userEmail ?? ""),
          );
        }
        return null;
      },
    );
  }
}

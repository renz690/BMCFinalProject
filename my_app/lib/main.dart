import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/auth/auth_wrapper.dart';
import 'firebase_options.dart';
import 'package:my_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

// 1. Import the native splash package
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // 1. Preserve the splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 2. Initialize Firebase (from Module 1)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. Run the app (from Module 1)
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );

  // 4. Remove the splash screen after app is ready
  // This should be called in the home screen after first frame is rendered
  // For simplicity, we'll leave it here, but in a real app, you might move it.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The splash screen is removed once the first frame is rendered
    FlutterNativeSplash.remove();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCommerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AuthWrapper(),
    );
  }
}

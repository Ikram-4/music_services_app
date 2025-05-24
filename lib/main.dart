import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import 'core/dependency_injection.dart';
import 'presentation/providers/music_services_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Setup Dependency Injection
  setupDependencyInjection();
  
  // Set status bar style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<MusicServicesProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Music Services',
        theme: ThemeData(
          primaryColor: const Color(0xFF8B1538),
          fontFamily: 'SF Pro Display',
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF8B1538),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
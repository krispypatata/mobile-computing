import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../screens/todo_page.dart';
import '../screens/user_details.dart';
import '../screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TodoListProvider())),
        ChangeNotifierProvider(create: ((context) => AuthProvider())),
        ChangeNotifierProvider(create: ((context) => UserProvider())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'exercise9_gabinete',
      initialRoute: '/',
      theme: myTheme,
      routes: {
        '/': (context) => const TodoPage(),
        '/login': (context) => const LoginPage(),
        '/todo': (context) => const LoginPage(),
        '/user_details': (context) => const UserDetailsPage(),
      },
    );
  }
}

final myTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.cyan,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  cardColor: Colors
      .black, // Change card color to black for better contrast in dark mode
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    headline1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  highlightColor: Colors.cyanAccent, // Update the highlight color (cursor)
  focusColor: Colors.cyanAccent, // Update the focus color (text selection)
  primaryColorLight: Colors.cyan, // Define primary color light
  primaryColorDark:
      Colors.cyan, // Define primary color dark with a suitable shade of cyan
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.cyan,
    selectionColor: Colors
        .transparent, // Set transparent selection color for better readability
    selectionHandleColor: Colors.cyan,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor:
        const Color.fromARGB(255, 2, 67, 73), // Set app bar background color
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor:
        const Color.fromARGB(255, 1, 55, 60), // Set drawer background color
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor:
        Color.fromARGB(255, 5, 120, 130), // Set FAB background color
  ),
);

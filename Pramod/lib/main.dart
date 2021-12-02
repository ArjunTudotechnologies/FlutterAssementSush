import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_purpose/providers/bad_character_provider.dart';
import 'package:flutter_purpose/providers/bottom_navigation_provider.dart';
import 'package:flutter_purpose/providers/map_providers.dart';
import 'package:flutter_purpose/views/home_bottom_bar.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BadCharacterProvider>(
            create: (context) => BadCharacterProvider()),
        ChangeNotifierProvider<MapProviders>(
            create: (context) => MapProviders()),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (context) => BottomNavigationBarProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Material(
          child: HomeBottomBar(),
        ),
      ),
    );
  }
}

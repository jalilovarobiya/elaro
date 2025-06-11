import 'package:elaro/core/services/dependancy_injection_instance.dart';
import 'package:elaro/features/favourite/data/model/favourite_product.dart';
import 'package:elaro/features/favourite/view/blocs/bloc/favourite_bloc.dart';
import 'package:elaro/features/main/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteProductAdapter());

  await serviceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Elaro",
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => sl<FavouriteBloc>())],
        child: MainPage(),
      ),
    );
  }
}

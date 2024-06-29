import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/core/di/locator.dart';
import 'package:github_app/features/popularRepository/ui/bloc/popular_bloc.dart';
import 'package:github_app/features/popularRepository/ui/pages/popular_repositories_page.dart';
import 'package:github_app/core/di/locator.dart' as di;

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dumbest App',
      theme: ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: const Color.fromARGB(255, 203, 185, 130)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: BlocProvider(
          create: (_) =>
              di.sl<PopularBloc>()..add(GetPopularRepositoriesEvent()),
          child: const PopularRepositoriesPage(),
        ),
      ),
    );
  }
}

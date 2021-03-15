import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profile_bloc_flutter/bloc/profile_bloc.dart';
import 'package:github_profile_bloc_flutter/data/profile_repository.dart';
import 'package:github_profile_bloc_flutter/pages/git_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => ProfileBloc(ProfileRepository()),
        child: GitView(),
      ),
    );
    //
  }
  //
}

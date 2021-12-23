import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noorikapi/auth/bloc/bloc/authbloc_bloc.dart';
import 'package:noorikapi/auth/repository/auth_repo.dart';
import 'package:noorikapi/ekran.dart';
import 'package:noorikapi/network/network_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthblocBloc(
        AuthRepo(
          dio: Dio(),
          networkInfo: NetworkInfo(),
        ),
      ),
      child: BlocConsumer<AuthblocBloc, AuthblocState>(
        listener: (context, state) {
          if (state is AuthblocMainState) {
            final AuthblocMainState mainState = state;
            if (mainState.ok) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Ekran(
                    token: mainState.token,
                  ),
                ),
              );
            }
            if (mainState.serverError) {}
          }
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Container(),
          );
        },
      ),
    );
  }
}

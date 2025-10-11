import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tktw_test_app/pages/bloc/change_store_status/change_store_status_bloc.dart';
import 'package:tktw_test_app/pages/bloc/get_prize/get_prize_bloc.dart';
import 'package:tktw_test_app/pages/bloc/get_store/get_store_bloc.dart';
import 'package:tktw_test_app/pages/bloc/get_store_by_id/get_store_by_id_bloc.dart';
import 'package:tktw_test_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetStoreBloc()),
        BlocProvider(create: (context) => GetStoreByIdBloc()),
        BlocProvider(create: (context) => GetPrizeBloc()),
        BlocProvider(create: (context) => ChangeStoreStatusBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

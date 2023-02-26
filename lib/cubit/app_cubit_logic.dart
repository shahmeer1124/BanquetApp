import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/detailpage.dart';
import '../screens/home_page.dart';
import '../screens/search_detail_screen.dart';
import '../screens/search_result_screen.dart';
import '../screens/welcomepage.dart';
import 'app_cubit.dart';
import 'app_cubit_state.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, Cubitstate>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        }
        if (state is DetailState) {
          return DetailPage();
        }

        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is searchLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchLoadedState) {
          return SearchPage();
        }
        if (state is LoadedState) {
          return HomePage();
        }
        if (state is SearchDetailState) {
          return SearchDetailPage();
        } else {
          return Container();
        }
      },
    ));
  }
}

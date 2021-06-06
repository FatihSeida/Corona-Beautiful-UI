import 'package:covid_beautiful_ui/corona_data_card.dart';
import 'package:covid_beautiful_ui/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bloc/corona_bloc.dart';
import 'cubits/cubit/navigation_cubit.dart';
import 'custom_radio.dart';
import 'enums.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoronaBloc>(
          create: (context) => CoronaBloc(DataCoronaRepository()),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: CoronaPage()),
    );
  }
}

class CoronaPage extends StatefulWidget {
  @override
  _CoronaPageState createState() => _CoronaPageState();
}

class _CoronaPageState extends State<CoronaPage> {
  late CoronaBloc bloc;
  DataMode dataMode = DataMode.world;

  void _handleLoadModeValueChange(var value) {
    BlocProvider.of<NavigationCubit>(context).changeDataMode(value);
  }

  @override
  void initState() {
    bloc = context.read<CoronaBloc>();
    bloc.add(FetchDataIndonesia());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CoronaBloc, CoronaState>(
        builder: (context, state) {
          if (state is CoronaStateLoaded) {
            return BlocBuilder<NavigationCubit, NavigationState>(
              builder: (navContext, navState) {
                return Container(
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => _handleLoadModeValueChange(
                                  DataMode.indonesia),
                              child: RadioItem(
                                buttonText: 'Data Indonesia',
                                isSelected:
                                    navState.dataMode == DataMode.indonesia
                                        ? true
                                        : false,
                              )),
                          InkWell(
                              splashColor: Colors.transparent,
                              onTap: () =>
                                  _handleLoadModeValueChange(DataMode.world),
                              child: RadioItem(
                                buttonText: 'Data Dunia',
                                isSelected: navState.dataMode == DataMode.world
                                    ? true
                                    : false,
                              )),
                        ],
                      ),
                      Text(
                        navState.dataMode == DataMode.indonesia
                            ? 'Data Covid Indonesia'
                            : 'Data Covid Dunia',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CoronaDataCard(
                              icon: FontAwesomeIcons.smileBeam,
                              title: 'Sembuh',
                              value: navState.dataMode == DataMode.indonesia
                                  ? state.dataIndonesia.sembuh
                                  : state.dataSembuhDunia,
                              color: Colors.green),
                          CoronaDataCard(
                              icon: FontAwesomeIcons.heartbeat,
                              title: 'Positif',
                              value: navState.dataMode == DataMode.indonesia
                                  ? state.dataIndonesia.positif
                                  : state.dataPositifDunia,
                              color: Colors.red),
                        ],
                      ),
                      CoronaDataCard(
                          icon: FontAwesomeIcons.skull,
                          title: 'Meninggal',
                          value: navState.dataMode == DataMode.indonesia
                              ? state.dataIndonesia.meninggal
                              : state.dataMeninggalDunia,
                          color: Colors.grey[850]),
                    ],
                  ),
                );
              },
            );
          } else if (state is CoronaStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text('error'),
            );
          }
        },
      ),
    );
  }
}

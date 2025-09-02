import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_test/bloc_test/single_page/data_part.dart';
import 'package:widget_test/bloc_test/single_page/single_bloc.dart';
import 'package:widget_test/bloc_test/single_page/single_event.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SingleBloc()..add(InitSingleEvent());
      },
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SingleBloc>(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: BlocBuilder<SingleBloc, DataPart>(builder: (context, _) {
              return Text("点击了${bloc.state.num}次");
            }),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                bloc.add(LoadSingleEvent());
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_test/provider_test/provider_page/demo_provider.dart';

class ProviderPage extends StatelessWidget {
  ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DemoProvider(),
          builder: (context,_)=>_buildPage(context),
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = Provider.of<DemoProvider>(context,listen: false);
    String name = provider.state.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('当前name为:${provider.state.name}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.updateName(name);
        },
      ),
      body: Center(
        child: TextField(
          onChanged: (value) {
            name = value;
          },
        ),
      ),
    );
  }
}

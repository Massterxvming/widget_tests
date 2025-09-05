import 'package:skeletonizer/skeletonizer.dart';

import '../../common/common_export.dart';

class SkeletonizerPage extends StatefulWidget {
  const SkeletonizerPage({super.key});

  @override
  State<SkeletonizerPage> createState() => _SkeletonizerPageState();
}

class _SkeletonizerPageState extends State<SkeletonizerPage> {
  bool loading = true;

  final int listLength = 10;

  late List fakeUsers = List.generate(listLength, (index) => '标题$index');

  late List realUsers = List.generate(listLength, (index) => '真实标题$index');

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List userList = loading ? fakeUsers : realUsers;
    return Scaffold(
      body: Skeletonizer(
        enabled: loading,
        enableSwitchAnimation: true,
        switchAnimationConfig: const SwitchAnimationConfig(),
        child: ListView(
          children: List.generate(
            listLength,
            (index) => ListTile(
              leading: const CircleAvatar(),
              title: Text(userList[index]),
              subtitle: Container(
                width: 200,
                height: 14,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            loading = !loading;
          });
        },
        child: Icon(
          loading ? Icons.stop : Icons.play_arrow,
        ),
      ),
    );
  }
}

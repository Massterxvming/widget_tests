import 'package:flutter/cupertino.dart';

import '../../common/common_export.dart';

class NormalEmpty extends StatelessWidget {
  const NormalEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              color: Theme.of(context).primaryColor,
            ),
            const Text('Is empty here'),
            FilledButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

import '../../common/common_export.dart';

class CustomPrintPage extends StatelessWidget {
  const CustomPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.star, color: Colors.yellow),
          label: const Text('print_path'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          child: const Text('渐变按钮'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (states) => null,
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          child: const Text('边框按钮'),
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue, width: 2),
            shape: StadiumBorder(),
          ),
        ),
      ],
    );
  }
}

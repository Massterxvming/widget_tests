import '../common/common_export.dart';

class SplashButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const SplashButton({
    super.key,
    required this.onTap,
    required this.text,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.red],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Get.to(() => onTap);
          },
          highlightColor: Colors.red.withValues(alpha: 0.2),
          splashColor: Colors.blue.withValues(alpha: 0.2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}

part of 'home_screen_page.dart';

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        titleProject,
        style: theme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

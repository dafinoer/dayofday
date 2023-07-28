part of 'home_screen_page.dart';

class _LargeContentWidget extends StatelessWidget {
  const _LargeContentWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: BoxContentWidget(
        height: size.height,
        width: 768.0,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: _TitleWidget()),
            const SliverToBoxAdapter(child: TextDescriptionWidget()),
            child
          ],
        ),
      ),
    );
  }
}

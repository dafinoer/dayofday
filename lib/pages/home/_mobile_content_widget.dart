part of 'home_screen_page.dart';

class _MobileContentWidget extends StatelessWidget {
  const _MobileContentWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return BoxContentWidget(
      height: sizeHeight,
      width: 375.0,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: _TitleWidget()),
          const SliverToBoxAdapter(child: TextDescriptionWidget()),
          child,
        ],
      ),
    );
  }
}

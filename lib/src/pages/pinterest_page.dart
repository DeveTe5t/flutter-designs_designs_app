import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PinterestGrid());
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> items = List.generate(200, (index) => index);

    // ********** With package
    //------- Solution 1
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: MasonryGridView.count(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 4,
    //     // padding: const EdgeInsets.all(10),
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       return _Tile(index: index, extent: (index % 5 + 1) * 100);
    //     },
    //   ),
    // );

    //------- Solution 2
    // return SingleChildScrollView(
    //   child: StaggeredGrid.count(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 4,
    //     children: List.generate(
    //       items.length,
    //       (index) => _PinterestItem2(index: index),
    //     ),
    //   ),
    // );

    // ********** Without package
    //------- Solution 3
    // return GridView.custom(
    //   padding: const EdgeInsets.symmetric(horizontal: 10),
    //   gridDelegate: SliverWovenGridDelegate.count(
    //     crossAxisCount: 2,
    //     pattern: [
    //       const WovenGridTile(1),
    //       const WovenGridTile(
    //         5 / 7,
    //         crossAxisRatio: 0.9,
    //         alignment: AlignmentDirectional.centerEnd,
    //       ),
    //     ],
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) => _PinterestItem(index: index),
    //     childCount: items.length,
    //   ),
    // );

    //------- Solution 4
    return GridView.custom(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [QuiltedGridTile(3, 2), QuiltedGridTile(2, 2)],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _PinterestItem(index: index),
        childCount: items.length,
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.index, required this.extent});
  final int index;
  final double extent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _PinterestItem2 extends StatelessWidget {
  final int index;
  const _PinterestItem2({required this.index});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: index.isEven ? 2 : 3,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}

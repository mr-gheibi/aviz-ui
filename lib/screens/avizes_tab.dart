import 'package:aviz/data/constants/avizes.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/screens/aviz_single_page_screen.dart';
import 'package:aviz/screens/view_all_avizes.dart';
import 'package:aviz/utils/numbers/number_extention.dart';
import 'package:aviz/widgets/horizontal_aviz_box.dart';
import 'package:aviz/widgets/vertical_aviz_box.dart';
import 'package:flutter/material.dart';

class AvizesTab extends StatelessWidget {
  const AvizesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/images/appbar-logo.png')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              _getTitle(context, 'آویز های داغ', 'hot'),
              _getHotAvizes(),
              _getTitle(context, 'آویز های اخیر', 'recent'),
              _getRecentAvizes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTitle(BuildContext context, String title, String type) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                title,
                style: mainTheme().textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewAllAvizesScreen(filter: type)));
                },
                child: Text(
                  'مشاهده همه',
                  style: mainTheme().textTheme.titleSmall,
                ),
              ),
            ],
          ),
          SizedBox(height: 24)
        ],
      ),
    );
  }

  Widget _getHotAvizes() {
    return SliverToBoxAdapter(
      child: Container(
        height: 267,
        width: double.infinity,
        child: ListView.builder(
          itemCount: all_avizes_list.length,
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VerticalAvizBox(
              name: all_avizes_list[index].name,
              description: all_avizes_list[index].description,
              photoPath: all_avizes_list[index].photoAddress,
              price: all_avizes_list[index].price.convertToPrice(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AvizSinglePageScreen(aviz: all_avizes_list[index])));
              },
            );
          },
        ),
      ),
    );
  }

  Widget _getRecentAvizes() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HorizontalAvizBox(
            name: all_avizes_list[index].name,
            description: all_avizes_list[index].description,
            photoPath: all_avizes_list[index].photoAddress,
            price: all_avizes_list[index].price.convertToPrice(),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AvizSinglePageScreen(aviz: all_avizes_list[index])));
            },
          );
        },
        childCount: all_avizes_list.length,
      ),
    );
  }
}

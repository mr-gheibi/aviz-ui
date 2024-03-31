import 'package:aviz/data/constants/avizes.dart';
import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/screens/aviz_single_page_screen.dart';
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
              _getTitle('آویز های داغ'),
              _getHotAvizes(),
              _getTitle('آویز های اخیر'),
              _getRecentAvizes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTitle(String title) {
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
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: grey700Color,
                ),
              ),
              Text(
                'مشاهده همه',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: grey500Color,
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
              price: all_avizes_list[index].price,
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
            price: all_avizes_list[index].price,
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

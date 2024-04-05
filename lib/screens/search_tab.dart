import 'package:aviz/data/constants/avizes.dart';
import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/data/models/Aviz.dart';
import 'package:aviz/screens/aviz_single_page_screen.dart';
import 'package:aviz/utils/numbers/number_extention.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<Aviz> filteredAvizes = [];

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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          filteredAvizes = value != ''
                              ? all_avizes_list
                                  .where((aviz) => aviz.name.contains(value))
                                  .toList()
                              : [];
                          print(filteredAvizes);
                        });
                      },
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      cursorColor: grey400Color,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        suffixIcon: ImageIcon(
                          AssetImage('assets/images/bnb-search.png'),
                          color: grey400Color,
                        ),
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'جستجو...',
                        hintStyle: mainTheme().textTheme.titleMedium,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: grey300Color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: grey300Color,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            filteredAvizes.length > 0
                ? _getFilteredAvizesSliverGrid()
                : SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'آگهی یافت نشد.',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                          fontSize: mainTheme().textTheme.titleMedium!.fontSize,
                          color: grey700Color,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _getFilteredAvizesSliverGrid() {
    return SliverGrid.builder(
      itemCount: filteredAvizes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 267,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AvizSinglePageScreen(aviz: filteredAvizes[index])));
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.02),
                  offset: Offset.fromDirection(0, 4),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.02),
                  offset: Offset.fromDirection(0, 18),
                  blurRadius: 18,
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.01),
                  offset: Offset.fromDirection(0, 40),
                  blurRadius: 24,
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0),
                  offset: Offset.fromDirection(0, 70),
                  blurRadius: 28,
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0),
                  offset: Offset.fromDirection(0, 110),
                  blurRadius: 31,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(
                      filteredAvizes[index].photoAddress,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        filteredAvizes[index].name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontWeight: mainTheme().textTheme.titleLarge!.fontWeight,
                          fontSize: 14,
                          color: mainTheme().textTheme.titleLarge!.color,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        filteredAvizes[index].description,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                          fontSize: 12,
                          color: mainTheme().textTheme.titleSmall!.color,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'قیمت:',
                      textAlign: TextAlign.end,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                        fontSize: 12,
                        color: grey700Color,
                      ),
                    ),
                    Container(
                      color: grey100Color,
                      child: Text(
                        filteredAvizes[index].price.convertToPrice(),
                        style: TextStyle(
                          fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

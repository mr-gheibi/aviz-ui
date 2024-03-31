import 'dart:math';

import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/models/Aviz.dart';
import 'package:aviz/widgets/primary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import '../utils/map/tile_servers.dart';
import '../utils/map/utils.dart';
import '../utils/map/viewport_painter.dart';

// ignore: must_be_immutable
class AvizSinglePageScreen extends StatefulWidget {
  Aviz aviz;

  AvizSinglePageScreen({super.key, required this.aviz});

  @override
  State<AvizSinglePageScreen> createState() => _AvizSinglePageScreenState();
}

class _AvizSinglePageScreenState extends State<AvizSinglePageScreen> {
  late Aviz aviz;
  var sectionsList = [
    'مشخصات',
    'قیمت',
    'ویژگی ها و امکانات',
    'توضیحات',
  ];
  int selectedSection = 0;

  @override
  void initState() {
    super.initState();
    aviz = widget.aviz;
  }

  final controller = MapController(
    location: const LatLng(Angle.degree(35.68), Angle.degree(51.41)),
    zoom: 6,
  );

  void _gotoDefault() {
    controller.center = const LatLng(Angle.degree(35.68), Angle.degree(51.41));
    controller.zoom = 14;
    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;

      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      if (controller.zoom < 1) {
        controller.zoom = 1;
      }
      setState(() {});
    } else {
      final now = details.focalPoint;
      var diff = now - _dragStart!;
      _dragStart = now;
      final h = transformer.constraints.maxHeight;

      final vp = transformer.getViewport();
      if (diff.dy < 0 && vp.bottom - diff.dy < h) {
        diff = Offset(diff.dx, 0);
      }

      if (diff.dy > 0 && vp.top - diff.dy > 0) {
        diff = Offset(diff.dx, 0);
      }

      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  bool isArchived = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: grey700Color,
          ),
          actionsIconTheme: IconThemeData(
            color: grey700Color,
          ),
          leading: IconButton(
            icon: ImageIcon(AssetImage('assets/images/arrow-right.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: ImageIcon(AssetImage('assets/images/information.png')),
              onPressed: () {},
            ),
            IconButton(
              icon: ImageIcon(AssetImage('assets/images/share.png')),
              onPressed: () {},
            ),
            IconButton(
              icon: ImageIcon(
                isArchived ? AssetImage('assets/images/archive-selected.png') : AssetImage('assets/images/archive.png')
              ),
              onPressed: () {
                setState(() {
                  isArchived = !isArchived;
                });
              },
            ),
          ],
          scrolledUnderElevation: 0,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          image: AssetImage(aviz.photoAddress),
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: grey300Color,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'آپارتمان',
                              style: TextStyle(
                                fontFamily: 'Shabnam',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            '۱۶ دقیقه پیش در گرگان',
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: grey500Color,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            'آپارتمان ۵۰۰ متری در صیاد شیرازی',
                            textAlign: TextAlign.end,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: grey700Color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 64),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey300Color)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              'هشدار های قبل از معامله!',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Shabnam',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: grey700Color,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('assets/images/arrow-left.png'),
                              color: grey400Color,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        height: 29,
                        child: ListView.builder(
                          itemCount: sectionsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSection = index;
                                    });
                                  },
                                  child: Container(
                                    height: 29,
                                    decoration: BoxDecoration(
                                        color: selectedSection == index
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: grey300Color, width: 1)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      sectionsList[index],
                                      style: TextStyle(
                                        fontFamily: 'Shabnam',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: selectedSection == index
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 32),
                      _getSectionPage(selectedSection),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryButton(
                            text: 'گفتگو',
                            leading: Image.asset('assets/images/message.png'),
                            fixedSize: MaterialStateProperty.all(Size(178, 40)),
                            onPressed: () {},
                          ),
                          PrimaryButton(
                            text: 'اطلاعات تماس',
                            leading: Image.asset('assets/images/call.png'),
                            fixedSize: MaterialStateProperty.all(Size(178, 40)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSectionPage(int index) {
    switch (index) {
      case 0:
        return _getInfoSection();
      case 1:
        return _getPriceSection();
      case 2:
        return _getFeaturesSection();
      case 3:
        return _getDescriptionSection();
      default:
        return _getInfoSection();
    }
  }

  Widget _getDescriptionSection() {
    return Text(
      'ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده  گذاشتم فروش فوری  خریدار باشی تخفیف پای معامله میدم.',
      style: TextStyle(
        fontFamily: 'Shabnam',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: grey500Color,
      ),
    );
  }

  Widget _getFeaturesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset('assets/images/clipboard.png'),
            SizedBox(width: 8),
            Text(
              'ویژگی ها',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: grey700Color,
              ),
            )
          ],
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            border: Border.all(color: grey300Color, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'سند',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey500Color,
                        ),
                      ),
                      Text(
                        'تک برگ',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey500Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 16,
                endIndent: 16,
                thickness: 1,
                color: grey300Color,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'جهت ساختمان',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey500Color,
                        ),
                      ),
                      Text(
                        'شمالی',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey500Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset('assets/images/magicpen.png'),
            SizedBox(width: 8),
            Text(
              'امکانات',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: grey700Color,
              ),
            )
          ],
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 392,
          decoration: BoxDecoration(
            border: Border.all(color: grey300Color, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              var items = [
                'آسانسور',
                'پارکینگ',
                'انباری',
                'بالکن',
                'پنت هاوس',
                'جنس کف سرامیک',
                'سرویس بهداشتی ایرانی و فرنگی'
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: grey500Color,
                      ),
                    ),
                  ),
                  index != (items.length - 1)
                      ? Divider(
                          indent: 16,
                          endIndent: 16,
                          thickness: 1,
                          color: grey300Color,
                        )
                      : Container(),
                ],
              );
            },
            /*children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'سند',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: grey500Color,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 16,
                endIndent: 16,
                thickness: 1,
                color: grey300Color,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'جهت ساختمان',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey500Color,
                        ),
                      ),
                      Text(
                        'شمالی',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: grey500Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],*/
          ),
        ),
      ],
    );
  }

  Widget _getPriceSection() {
    return Container(
      width: double.infinity,
      height: 96,
      decoration: BoxDecoration(
        border: Border.all(color: grey300Color, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'قیمت هر متر:',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: grey700Color,
                    ),
                  ),
                  Text(
                    '۴۶٬۴۶۰٬۰۰۰',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: grey700Color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 16,
            endIndent: 16,
            thickness: 1,
            color: grey300Color,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'قیمت کل:',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: grey700Color,
                    ),
                  ),
                  Text(
                    '۲۳٬۲۳۰٬۰۰۰٬۰۰۰',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: grey700Color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getInfoSection() {
    return Column(
      children: [
        Container(
          height: 98,
          decoration: BoxDecoration(
            border: Border.all(color: grey300Color, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'متراژ',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey500Color,
                      ),
                    ),
                    Text(
                      '500',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey700Color,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: grey300Color,
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'اتاق',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey500Color,
                      ),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey700Color,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: grey300Color,
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'طبقه',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey500Color,
                      ),
                    ),
                    Text(
                      'دوبلکس',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey700Color,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: grey300Color,
                thickness: 1,
                indent: 25,
                endIndent: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ساخت',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey500Color,
                      ),
                    ),
                    Text(
                      '1402',
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey700Color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Image.asset('assets/images/map.png'),
            SizedBox(width: 8),
            Text(
              'موقعیت مکانی',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: grey700Color,
              ),
            )
          ],
        ),
        SizedBox(height: 24),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 144,
              child: MapLayout(
                controller: controller,
                builder: (context, transformer) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onDoubleTapDown: (details) => _onDoubleTap(
                      transformer,
                      details.localPosition,
                    ),
                    onScaleStart: _onScaleStart,
                    onScaleUpdate: (details) =>
                        _onScaleUpdate(details, transformer),
                    child: Listener(
                      behavior: HitTestBehavior.opaque,
                      onPointerSignal: (event) {
                        if (event is PointerScrollEvent) {
                          final delta = event.scrollDelta.dy / -1000.0;
                          final zoom = clamp(controller.zoom + delta, 2, 18);

                          transformer.setZoomInPlace(zoom, event.localPosition);
                          setState(() {});
                        }
                      },
                      child: Stack(
                        children: [
                          TileLayer(
                            builder: (context, x, y, z) {
                              final tilesInZoom = pow(2.0, z).floor();

                              while (x < 0) {
                                x += tilesInZoom;
                              }
                              while (y < 0) {
                                y += tilesInZoom;
                              }

                              x %= tilesInZoom;
                              y %= tilesInZoom;

                              return CachedNetworkImage(
                                imageUrl: google(z, x, y),
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                          CustomPaint(
                            painter: ViewportPainter(
                              transformer.getViewport(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 187,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'گرگان، صیاد شیرا...',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Image(image: AssetImage('assets/images/location.png'))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

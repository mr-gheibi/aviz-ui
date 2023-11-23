import 'dart:math';

import 'package:aviz/screens/add_aviz/add_aviz_last_form_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import '../../data/constants/colors.dart';
import '../../utils/map/tile_servers.dart';
import '../../utils/map/utils.dart';
import '../../utils/map/viewport_painter.dart';

class AddAvizMapScreen extends StatefulWidget {
  const AddAvizMapScreen({super.key});

  @override
  State<AddAvizMapScreen> createState() => _AddAvizMapScreenState();
}

class _AddAvizMapScreenState extends State<AddAvizMapScreen> {
  int step = 4;
  bool showExactLocationSwitch = true;

  final controller = MapController(
    location: const LatLng(35.68, 51.41),
    zoom: 6,
  );

  void _gotoDefault() {
    controller.center = const LatLng(35.68, 51.41);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoDefault,
        tooltip: 'My Location',
        child: const Icon(Icons.my_location),
      ),
      appBar: AppBar(
        title: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'دسته بندی',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            Image(image: AssetImage('assets/images/appbar-logo2.png')),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage('assets/images/arrow-right.png')),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        leading: IconButton(icon: Icon(Icons.close), onPressed: () {}),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Divider(
                color: primaryColor,
                thickness: 4,
                indent: 350 - ((step - 1) * 50),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
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
                    SizedBox(height: 16),
                    Text(
                      'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: grey500Color,
                      ),
                    ),
                    SizedBox(height: 32),
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
                                  final zoom =
                                      clamp(controller.zoom + delta, 2, 18);

                                  transformer.setZoomInPlace(
                                      zoom, event.localPosition);
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
                    SizedBox(height: 32),
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
                            'موقعیت دقیق نقشه نمایش داده شود؟',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: grey700Color,
                            ),
                          ),
                          Switch(
                            value: showExactLocationSwitch,
                            onChanged: (value) {
                              setState(() {
                                showExactLocationSwitch = value;
                              });
                            },
                            activeColor: primaryColor,
                          )
                        ],
                      ),
                    ),
                    // Spacer(),
                    SizedBox(height: 250),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAvizLastFormScreen()));
                      },
                      child: Text(
                        'بعدی',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(343, 40)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:aviz/widgets/switch_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import '../../data/constants/colors.dart';
import '../../utils/map/tile_servers.dart';
import '../../utils/map/utils.dart';
import '../../utils/map/viewport_painter.dart';

class LocationPage extends StatefulWidget {
  final void Function() onFinish;

  const LocationPage({
    super.key,
    required this.onFinish,
  });

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool showExactLocationSwitch = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: _gotoDefault,
          tooltip: 'My Location',
          child: const Icon(Icons.my_location),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
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
                    SwitchBox(
                      data: 'موقعیت دقیق نقشه نمایش داده شود؟',
                      value: showExactLocationSwitch,
                      onChanged: (value) {
                        setState(() {
                          showExactLocationSwitch = value;
                        });
                      },
                    ),
                    // Spacer(),
                    SizedBox(height: 250),
                    ElevatedButton(
                      onPressed: widget.onFinish,
                      child: Text(
                        'بعدی',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
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

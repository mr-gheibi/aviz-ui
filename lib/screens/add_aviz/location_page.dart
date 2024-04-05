import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/widgets/switch_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../data/constants/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(bottom: 100),
      //   child: FloatingActionButton(
      //     onPressed: _gotoDefault,
      //     tooltip: 'My Location',
      //     child: const Icon(Icons.my_location),
      //   ),
      // ),
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
                          style: mainTheme().textTheme.titleLarge,
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: mainTheme().textTheme.titleSmall,
                    ),
                    SizedBox(height: 32),
                    Container(
                      height: 144,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(36.821074, 54.435764),
                          initialZoom: 9.2,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.aviz',
                          ),
                        ],
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
                          fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                          fontSize: mainTheme().textTheme.titleMedium!.fontSize,
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

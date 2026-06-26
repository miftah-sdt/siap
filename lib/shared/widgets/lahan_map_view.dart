import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:siap/core/utils/coordinate_parser.dart';

class LahanMapView extends StatelessWidget {
  const LahanMapView({
    super.key,
    required this.coordinates,
    this.height = 220,
    this.interactive = true,
  });

  final String? coordinates;
  final double height;
  final bool interactive;

  static const LatLng _defaultCenter = LatLng(-6.5569, 107.7644);

  @override
  Widget build(BuildContext context) {
    final point = CoordinateParser.parse(coordinates) ?? _defaultCenter;
    final hasCoords = CoordinateParser.parse(coordinates) != null;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: height,
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: point,
                initialZoom: hasCoords ? 14 : 8,
                interactionOptions: InteractionOptions(
                  flags: interactive
                      ? InteractiveFlag.all
                      : InteractiveFlag.none,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.siap.app',
                ),
                if (hasCoords)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: point,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (!hasCoords)
              Positioned.fill(
                child: Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: const Text(
                    'Koordinat belum diisi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

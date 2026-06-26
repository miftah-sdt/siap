import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/coordinate_parser.dart';

class LahanMapPicker extends StatefulWidget {
  const LahanMapPicker({
    super.key,
    required this.initialCoordinates,
    required this.onChanged,
  });

  final String? initialCoordinates;
  final ValueChanged<String> onChanged;

  @override
  State<LahanMapPicker> createState() => _LahanMapPickerState();
}

class _LahanMapPickerState extends State<LahanMapPicker> {
  static const LatLng _defaultCenter = LatLng(-6.5569, 107.7644);

  late LatLng _selected;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _selected =
        CoordinateParser.parse(widget.initialCoordinates) ?? _defaultCenter;
  }

  void _onTap(TapPosition _, LatLng point) {
    setState(() => _selected = point);
    widget.onChanged(CoordinateParser.format(point));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Pilih lokasi di peta',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 240,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _selected,
                initialZoom: 14,
                onTap: _onTap,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.siap.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _selected,
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
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Koordinat: ${CoordinateParser.format(_selected)}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

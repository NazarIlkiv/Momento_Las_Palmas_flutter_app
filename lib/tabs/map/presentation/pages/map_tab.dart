import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:momento_las_palmas/core/constants/app_colors.dart';
import 'package:momento_las_palmas/core/widgets/place_card/place_card.dart';
import 'package:momento_las_palmas/home/data/models/places_model.dart';
import 'package:momento_las_palmas/home/presentation/cubit/places_cubit/places_cubit.dart';
import 'package:momento_las_palmas/home/presentation/cubit/places_cubit/places_state.dart';

class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  _MapTabState createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  final MapController _mapController = MapController();

  bool showInfo = false;
  PlaceItem? selectedPlace;
  double currentZoom = 12.0;

  @override
  Widget build(BuildContext context) => BlocBuilder<PlacesCubit, PlacesState>(
        builder: (BuildContext context, PlacesState state) => state.when(
          initial: () => const Center(child: CircularProgressIndicator(color: AppColors.colorWhitePrimary)),
          loading: () => const Center(child: CircularProgressIndicator(color: AppColors.colorWhitePrimary)),
          error: (String message) =>
              const Center(child: CircularProgressIndicator(color: AppColors.colorWhitePrimary)),
          loaded: (List<PlacesCategory> places, List<PlaceItem> favourites) {
            final List<Marker> markers = <Marker>[];

            for (final PlacesCategory category in places) {
              for (final PlaceItem place in category.items) {
                final List<String> coordinates = place.coordinates.split(',');
                final double lat = double.tryParse(
                      coordinates[0].replaceAll('°N', '').trim(),
                    ) ??
                    0.0;
                final double lng = double.tryParse(
                      coordinates[1].replaceAll('°W', '').trim(),
                    ) ??
                    0.0;

                markers.add(
                  Marker(
                    point: LatLng(lat, -lng),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlace = place;
                          showInfo = true;
                          _mapController.move(LatLng(lat, -lng), 14.0);
                        });
                      },
                      child: const Icon(
                        Icons.place,
                        color: Colors.amber,
                        size: 40,
                      ),
                    ),
                  ),
                );
              }
            }

            return Stack(
              children: <Widget>[
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: markers.isNotEmpty
                        ? markers.first.point
                        : const LatLng(28.1008, -15.4137),
                    initialZoom: currentZoom,
                    minZoom: 2,
                    maxZoom: 18,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all,
                    ),
                    onTap: (TapPosition tapPosition, LatLng point) {
                      setState(() {
                        showInfo = false;
                      });
                    },
                  ),
                  children: <Widget>[
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: <String>['a', 'b', 'c'],
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
                if (showInfo && selectedPlace != null)
                  Positioned(
                    top: 0,
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PlaceInfoCard(
                          place: selectedPlace!,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: <Widget>[
                      _buildZoomButton(Icons.add, () {
                        setState(() {
                          currentZoom = (currentZoom + 1).clamp(2.0, 18.0);
                          _mapController.move(
                            _mapController.camera.center,
                            currentZoom,
                          );
                        });
                      }),
                      const SizedBox(height: 10),
                      _buildZoomButton(Icons.remove, () {
                        setState(() {
                          currentZoom = (currentZoom - 1).clamp(2.0, 18.0);
                          _mapController.move(
                            _mapController.camera.center,
                            currentZoom,
                          );
                        });
                      }),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

  Widget _buildZoomButton(IconData icon, VoidCallback onPressed) => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.colorBlackPrimary,
          border: Border.all(color: AppColors.colorWhitePrimary, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: AppColors.colorWhitePrimary),
          iconSize: 30,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      );
}

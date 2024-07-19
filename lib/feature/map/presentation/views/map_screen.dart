import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/core/services/shared_prefrences/shared_pref.dart';
import 'package:fall_detection/feature/patient/presentation/manger/PatientCubits/PatientCubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_cubit.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_state.dart';
import 'package:fall_detection/feature/home/data/models/home_screen_model.dart';

import '../../../../core/routes/routes.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController controller = MapController(
    initPosition: GeoPoint(latitude: 51.5, longitude: -0.09),
  );

  @override
  void initState() {
    super.initState();
    fetchHomeScreenData();
  }

  void fetchHomeScreenData() {
    final homeCubit = context.read<HomeCubit>();
    homeCubit.getHomeScreenData(
      token: CacheHelper.sharedPreferences.getString(ApiKey.token) ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('OpenStreetMap Example'),
      // ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return OSMFlutter(
              osmOption: const OSMOption(
                roadConfiguration: RoadOption(
                  roadColor: Colors.yellowAccent,
                  roadWidth: 2.0,
                  zoomInto: true,
                ),
              ),
              controller: controller,
              onGeoPointClicked: (p0) {
                print(p0);
                // addMarkers(state.alerts);
              },
              onLocationChanged: (p0) {
                print(p0);
                // addMarkers(state.alerts);
              },
              onMapIsReady: (p0) {
                print(p0);
                // Ensure markers are added only after the map is ready
                addMarkers(state.alerts);
              },
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  Future<void> addMarkers(List<HomeScreenModel> homeScreenModels) async {
    for (var person in homeScreenModels) {
      try {
        await controller.addMarker(
          GeoPoint(
            latitude: person.latitude,
            longitude: person.longitude,
          ),
          markerIcon: MarkerIcon(
            iconWidget: IconButton(
              onPressed: () {
                context.read<PatientCubit>().fetchPatientData();
                Navigator.pushNamed(context, Routes.patientScreen);
              },
              icon: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 48,
              ),
            ),
          ),
        );
      } catch (e) {
        print('Error adding marker for person ${person.id}: $e');
      }
    }
  }
}

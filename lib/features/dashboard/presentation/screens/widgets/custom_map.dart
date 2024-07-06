import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/country_model.dart';
import 'package:ultimate_solution_task/features/dashboard/data/models/torust_model.dart';
import 'package:flutter/material.dart';
class CustomMaps extends StatefulWidget {


  @override
  State<CustomMaps> createState() => _CustomMapsState();
}

class _CustomMapsState extends State<CustomMaps> {

  @override
  void initState() {
    super.initState();


    DashboardCubit.get(context).initMap();
  }


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<DashboardCubit,DashboardState>(
      builder: (context,state) {
        var cubit = DashboardCubit.get(context);
        return SfMaps(
          layers: <MapLayer>[
            MapShapeLayer(
              initialMarkersCount: cubit.touristPlaces.length,
              markerTooltipBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cubit.touristPlaces[index].place,
                    style: const TextStyle(color: Colors.blue),
                  ),
                );
              },
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: cubit.touristPlaces[index].latLng.latitude,
                  longitude: cubit.touristPlaces[index].latLng.longitude,
                  offset: Offset(0, -cubit.markerSize / 1),
                  size: Size(cubit.markerSize, cubit.markerSize * .7),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: cubit.isHoveredStates[index],
                    builder: (context, isHovered, child) {
                      Color outerColor = Colors.blueGrey;
                      Color innerColor = Colors.blueGrey[200]!;

                      if (isHovered) {
                        outerColor = Colors.blueGrey[200]!;
                        innerColor = outerColor;
                      }

                      return MouseRegion(
                        onEnter: (_) {
                          cubit.isHoveredStates[index].value = true;
                        },
                        onExit: (_) {
                          cubit.isHoveredStates[index].value = false;
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: outerColor,
                              ),
                              width: cubit.markerSize,
                              height: cubit.markerSize,
                              child: Center(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: isHovered ? cubit.markerSize : cubit.markerSize / 3,
                                  height: isHovered ? cubit.markerSize : cubit.markerSize / 3,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isHovered ? outerColor : innerColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              loadingBuilder: (BuildContext context) {
                return const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                );
              },
              source: cubit.mapSource,
              shapeTooltipBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cubit.worldPopulationDensity[index].countryName,
                    style: const TextStyle(color: Colors.blue),
                  ),
                );
              },
              strokeColor: Colors.white30,
              zoomPanBehavior: MapZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
                enableDoubleTapZooming: true,
                minZoomLevel: 1,
                maxZoomLevel: 10,
              ),
            ),
          ],
        );
      }
    );
  }


}

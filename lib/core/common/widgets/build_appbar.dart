import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'dart:html';

import 'package:ultimate_solution_task/features/main_screen/cubit/home_cubit.dart';

class BuildAppbar extends StatelessWidget {
  const BuildAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      return SliverAppBar(
        floating: true,
        pinned: true,
        snap: false,
        expandedHeight: 100.0,
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Row(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(Icons.vertical_distribute_outlined),
                ),
                const SizedBox(width: 8.0),
                if (screenWidth > 1100)
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CompositedTransformTarget(
                      link: cubit.layerLink,
                      child: TextField(
                        controller: cubit.searchController,
                        focusNode: cubit.searchFocusNode,
                        onTap: () => cubit.showOverlay(context),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            cubit.hideOverlay();
                          } else {
                            cubit.showOverlay(context);
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    if (screenWidth < 1100)
                      GestureDetector(
                          onTap: () {}, child: const Icon(Icons.search)),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text('English'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    GestureDetector(
                        onTap: () {}, child: const Icon(Icons.notifications)),
                    const SizedBox(width: 16.0),
                    if (screenWidth > 600) ...[
                      GestureDetector(
                          onTap: () {}, child: const Icon(Icons.apps)),
                      const SizedBox(width: 16.0),
                      GestureDetector(
                          onTap: () {}, child: const Icon(Icons.settings)),
                      const SizedBox(width: 16.0),
                      GestureDetector(
                          onTap: () {}, child: const Icon(Icons.brightness_4)),
                      const SizedBox(width: 16.0),
                    ],
                    if (screenWidth > 1100)
                      GestureDetector(
                          onTap: () {
                            if (cubit.isFullScreen == false) {
                              document.documentElement?.requestFullscreen();

                              cubit.enterFullscreen();

                            } else {
                              document.exitFullscreen();
                              cubit.exitFullscreen();
                            }
                          },
                          child: Icon(
                            cubit.isFullScreen == true
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                            color: cubit.isFullScreen == false
                                ? AppColors.black
                                : AppColors.primary,
                          )),
                    const SizedBox(width: 16.0),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                    ),
                    if (screenWidth > 1100) ...[
                      const SizedBox(width: 8.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Doris Larson'),
                          Text('Founder', style: TextStyle(fontSize: 12.0)),
                        ],
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

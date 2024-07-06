import 'package:ultimate_solution_task/features/main_screen/data/model/list_tile_model.dart';

import '../../../core/src/app_export.dart';
import 'dart:html';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIdle());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  bool isHovered = false;

  onHover(bool hovering) {
    isHovered = hovering;
    emit(CardHoverSuccess());
  }

  bool isFullScreen = false;
  enterFullscreen() {
    isFullScreen = true;
    // document.documentElement?.requestFullscreen();
    emit(ToggleFullScreenSuccess());
  }

  exitFullscreen() {
    isFullScreen = false;
    // document.exitFullscreen();
    emit(ToggleFullScreenSuccess());
  }

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  void showOverlay(BuildContext context) {
    if (overlayEntry != null) {
      return;
    }

    overlayEntry = createOverlayEntry();
    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 300,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, kToolbarHeight),
          child: Material(
            elevation: 4.0,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.insert_chart),
                    title: const Text('Analytics Report'),
                    onTap: () {
                      hideOverlay();
                    },
                  ),
                  const ListTile(
                    leading: Icon(Icons.help),
                    title: Text('How can I help you?'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('User profile settings'),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('USERS', style: TextStyle(color: Colors.grey)),
                  ),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Erwin Brown'),
                    subtitle: Text('UI Designer'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Jacob Deo'),
                    subtitle: Text('Developer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onFocusChange(BuildContext context) {
    if (searchFocusNode.hasFocus) {
      showOverlay(context);
    } else {
      hideOverlay();
    }
  }

  List<ListTileModel> menuListTile = [
    ListTileModel(
      title: 'Dashboard',
      icon: Icons.dashboard,
    ),
    ListTileModel(
      title: 'Calendar',
      icon: Icons.calendar_today,
    ),
    ListTileModel(
      title: 'Chat',
      icon: Icons.ac_unit,
    ),
    ListTileModel(
      title: 'Email',
      icon: Icons.email,
    ),
    ListTileModel(
      title: 'Task',
      icon: Icons.task,
    ),
    ListTileModel(
      title: 'Kanban Board',
      icon: Icons.view_kanban,
    ),
    ListTileModel(
      title: 'File Manager',
      icon: Icons.folder,
    ),
    ListTileModel(
      title: 'Pages',
      icon: Icons.pages,
    ),
    ListTileModel(
      title: 'Error Pages',
      icon: Icons.error,
    ),
  ];

  selectListTile(int i, List<ListTileModel> list) {
    for (var item in list) {
      item.isSelected = false;
    }
    list[i].isSelected = true;
    emit(SelectListTileSuccess());
  }
}

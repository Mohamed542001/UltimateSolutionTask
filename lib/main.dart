import 'core/src/app.dart';
import 'core/src/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  initGetIt();
  Bloc.observer = AppBlocObserver();
  await Future.delayed(const Duration(seconds: 3));

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

      runApp(const MyApp());

  });
}

import '../src/app_export.dart';

class UrlLauncher {
  static Future<void> launchUrlMethod(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch URL. Launching in web browser.');
        await launch(url, forceSafariVC: false); // Launch in web browser
      }
    } on PlatformException catch (e) {
      print('Error launching URL: $e');
      // Handle the error here
      if (e.code == 'ACTIVITY_NOT_FOUND') {
        print('No app found to handle the URL.');
        // Notify the user or provide a fallback mechanism
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Handle other exceptions here
    }
  }
}

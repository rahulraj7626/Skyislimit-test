import 'package:connectivity_plus/connectivity_plus.dart';

import '../common_widgets/show_error.dart';

///checkinhg internet connection
class ConnectivityUtils {
  static Future<bool> checkConnectivity() async {
    bool isConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    } else {
      /// else calling error page
      ErrorPopus()
          .internetError("Connection Error", "Please connect to internet");
    }
    return isConnected;
  }
}

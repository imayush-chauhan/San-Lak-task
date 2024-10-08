import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/features/home/view/login_view.dart';
import '../../../features/home/view/home_view.dart';
import '../../../features/common/nointernet/view/no_internet_view.dart';
import '../../constants/application_constants.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext context;

  ApplicationConstants get appConstants => ApplicationConstants.instance;
  NetworkManager get networkManager => NetworkManager.instance;

  void setState() {
    notifyListeners();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {}

  void goToOnBoard() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      FirebaseAuth.instance.currentUser != null ?
      NavigationService.pushNamed(HomeView.path) :
      NavigationService.pushNamed(Login.path);
    } else {
      NavigationService.pushNamed(NoInternetView.path);
    }
  }
}

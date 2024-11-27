import 'dart:developer';

import '../api/hive/hive_service.dart';
import '../bloc/app_bloc.dart';
import '../bloc/other_bloc.dart';

abstract class BaseAppCommand {
  static bool _init = false;

  static late final HiveService _hive;

  static final blocApp = AppBloc(_hive);

  static final blocOther = OtherBloc();

  /// add other blocs here

  // getters for sub classes of BaseAppCommand

  HiveService get hive => _hive;

  AppBloc get appBloc => blocApp;

  OtherBloc get otherBloc => blocOther;

  /// init

  Future<void> init() async {
    if (_init) return;

    final futures = <Future>[
      HiveFactory.create().then((value) => _hive = value),
    ];

    await Future.wait(futures);

    // // Initialize the Mobile Ads SDK
    // MobileAds.instance.initialize();

    ///

    log("Bootstrap Started, v${AppBloc.kVersion}");
    // Load AppBloc ASAP
    // appBloc.load();

    log("BootstrapCommand - AppModel Loaded, user = ${appBloc.currentUser}");

    /// initialize guest user first time

    log("BootstrapCommand - Init services");
    // Init services
    // firebaseNotification.init();

    appBloc.hasBootstrapped = true;
    log("BootstrapCommand - Complete");
    _init = true;
  }
}

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../data/bloc/app_bloc.dart';

extension ContextExtension on BuildContext {
  AppBloc get appBloc => read<AppBloc>();

// // night mode
// bool get watchIsNightMode =>
//     select<NightMode, bool>((NightMode bloc) => bloc.isNight);
}

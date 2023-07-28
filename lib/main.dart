import 'package:flutter/material.dart';
import 'package:inventory_app/screens/tab_screen.dart';
import 'package:inventory_app/services/app_router.dart';
import 'package:inventory_app/utils/themes.dart';
import 'package:path_provider/path_provider.dart';
import 'bloc/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  //  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        theme: theme(),
        home:  const TabScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

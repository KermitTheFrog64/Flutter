import 'package:zabolotnaya_lab_4/dashboard/bloc/dashboard_bloc.dart';
import 'package:zabolotnaya_lab_4/dashboard/dashboard_page.dart';
import 'package:zabolotnaya_lab_4/dashboard/repository/shop_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ShopRepository(),
      child: BlocProvider(
        create: (context) => DashboardBloc(
          shopRepository: RepositoryProvider.of<ShopRepository>(context),
        )..add(InitShopBox()),
        child: const MaterialApp(
          home: DashboardPage(),
        ),
      ),
    );
  }
}

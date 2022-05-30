import 'package:zabolotnaya_lab_4/dashboard/bloc/dashboard_bloc.dart';
import 'package:zabolotnaya_lab_4/dashboard/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopDetails extends StatelessWidget {
  ShopDetails({Key? key, required this.shop}) : super(key: key);
  final Shop shop;

  final nameCtlr = TextEditingController();
  final quantityCtlr = TextEditingController();
  final aisleCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen,),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DashboardLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shop.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    shop.quantity,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    shop.aisle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            );
          }
          if (state is DashboardError) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}

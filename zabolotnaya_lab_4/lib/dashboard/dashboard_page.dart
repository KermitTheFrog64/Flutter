import 'package:zabolotnaya_lab_4/dashboard/bloc/dashboard_bloc.dart';
import 'package:zabolotnaya_lab_4/dashboard/widget/shop_tile.dart';
import 'package:zabolotnaya_lab_4/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop list"),
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showShopAddDialog(
            context,
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DashboardLoaded) {
            if (state.shopList.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  endIndent: 20,
                  indent: 20,
                ),
                itemCount: state.shopList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShopTile(
                    shop: state.shopList[index],
                    index: index,
                    showShopUpdateDialog: () {
                      showShopUpdateDialog(
                        context,
                        state.shopList[index],
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No item found"),
              );
            }
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

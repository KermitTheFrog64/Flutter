import 'package:zabolotnaya_lab_4/dashboard/bloc/dashboard_bloc.dart';
import 'package:zabolotnaya_lab_4/dashboard/model/shop_model.dart';
import 'package:zabolotnaya_lab_4/shop_detail/shop_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    Key? key,
    required this.shop,
    required this.index,
    required this.showShopUpdateDialog,
  }) : super(key: key);
  final Shop shop;
  final int index;
  final VoidCallback showShopUpdateDialog;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(shop.key.toString()),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (_) {
        BlocProvider.of<DashboardBloc>(context).add(
          RemoveShopEvent(
            id: shop.id,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShopDetails(
                  shop: shop,
                ),
              ),
            );
          },
          key: Key(shop.key.toString()),
          leading: CircleAvatar(
            backgroundColor: Colors.lightGreen,
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(shop.name),
          subtitle: Text(shop.quantity),
          trailing: GestureDetector(
            onTap: () {
              showShopUpdateDialog();
            },
            child: const Icon(
              Icons.update,
            ),
          ),
        ),
      ),
    );
  }
}

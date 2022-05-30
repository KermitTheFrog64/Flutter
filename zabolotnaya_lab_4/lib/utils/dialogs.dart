import 'package:zabolotnaya_lab_4/dashboard/bloc/dashboard_bloc.dart';
import 'package:zabolotnaya_lab_4/dashboard/model/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

Future<dynamic> showShopAddDialog(
    BuildContext context,
    ) {
  final nameCtlr = TextEditingController();
  final quantityCtlr = TextEditingController();
  final aisleCtlr = TextEditingController();
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: nameCtlr,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              controller: quantityCtlr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantity",
              ),
            ),
            TextField(
              controller: aisleCtlr,
              decoration: const InputDecoration(
                labelText: "Aisle",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final shop = Shop(
                  name: nameCtlr.text,
                  quantity: quantityCtlr.text,
                  aisle: aisleCtlr.text,
                  id: const Uuid().v4(),
                );
                BlocProvider.of<DashboardBloc>(context).add(
                  AddShopEvent(shop: shop),
                );
                nameCtlr.clear();
                quantityCtlr.clear();
                aisleCtlr.clear();
                Navigator.pop(context);
              },
              child: const Text("Add"),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen)
            ),
          ],
        ),
      ),
    ),
  );
}

Future<dynamic> showShopUpdateDialog(
    BuildContext context,
    Shop shop,
    ) {
  final nameCtlr = TextEditingController();
  final quantityCtlr = TextEditingController();
  final aisleCtlr = TextEditingController();
  nameCtlr.text = shop.name;
  quantityCtlr.text = shop.quantity;
  aisleCtlr.text = shop.aisle;
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: nameCtlr,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              controller: quantityCtlr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantity",
              ),
            ),
            TextField(
              controller: aisleCtlr,
              decoration: const InputDecoration(
                labelText: "Aisle",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final updatedShop = Shop(
                  name: nameCtlr.text,
                  quantity: quantityCtlr.text,
                  aisle: aisleCtlr.text,
                  id: shop.id,
                );
                BlocProvider.of<DashboardBloc>(context).add(
                  UpdateShopEvent(shop: updatedShop),
                );
                nameCtlr.clear();
                quantityCtlr.clear();
                aisleCtlr.clear();
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    ),
  );
}

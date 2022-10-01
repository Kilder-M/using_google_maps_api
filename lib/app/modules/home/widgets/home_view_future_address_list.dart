import 'package:flutter/material.dart';
import 'package:using_google_maps_api/app/modules/home/controllers/home_controller.dart';
import 'package:using_google_maps_api/app/modules/home/widgets/home_view_list_tile.dart';

Widget homeViewFutureAddressList(HomeController controller) {
  return Expanded(
    child: FutureBuilder(
      future: controller.getAddressList(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Erro ao buscar os endereços.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          );
        } else {
          return controller.addressList.isNotEmpty
              ? const Center(
                  child: Text(
                    'Não existem endereços salvos.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.addressList.length,
                  itemBuilder: ((context, index) {
                    var address = controller.addressList[index];
                    return homeViewListTile(
                      title: address.streetAddress,
                      subtitle: address.zipCode,
                    );
                  }),
                );
        }
      }),
    ),
  );
}

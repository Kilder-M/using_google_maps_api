import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:using_google_maps_api/app/aplication/modules/home/controllers/home_controller.dart';
import 'package:using_google_maps_api/app/aplication/modules/home/widgets/home_view_list_tile.dart';
import 'package:using_google_maps_api/app/widgets/sucess_alert.dart';

Widget homeViewFutureAddressList(
  HomeController controller,
) {
  return Expanded(
    child: FutureBuilder(
      future: controller.getAddressList(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.black,
              backgroundColor: Colors.grey,
            ),
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
          return controller.addressList.isEmpty
              ? const Center(
                  child: Text(
                    'Não existem endereços salvos.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : Obx(
                  () => ListView.builder(
                    itemCount: controller.addressList.length,
                    itemBuilder: ((context, index) {
                      var address = controller.addressList[index].obs;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: homeViewListTile(
                          title: address.value.address,
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Deseja excluir esse endereço ? ',
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('Não'),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Sim'),
                                        onPressed: () async {
                                          Get.back();
                                          await controller
                                              .removeAddress(address.value);
                                          Timer(
                                              const Duration(
                                                  milliseconds: 1300),
                                              () => Get.back());
                                          showDialog(
                                            context: context,
                                            builder: ((context) {
                                              return const SucessAlert(
                                                  title:
                                                      'Endereço excluído com Sucesso ! ');
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      );
                    }),
                  ),
                );
        }
      }),
    ),
  );
}

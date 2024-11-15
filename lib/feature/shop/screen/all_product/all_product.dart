import 'package:app_my_pham/common/widgets/grid_layout.dart';
import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/common/widgets/vertical_product_shimmer.dart';
import 'package:app_my_pham/feature/shop/controller/all_product_controller.dart';
import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../home/widgets/appbar.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = MPVerticalProductsShimmer();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loader;
              }
              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
              final products = snapshot.data!;
              return MPSortableProduct(products: products,);
            },
          ),
        ),
      ),
    );
  }
}

class MPSortableProduct extends StatelessWidget {
  const MPSortableProduct({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
            decoration:
                const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Popularity']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {
              controller.sortProducts(value!);
            }),
        const SizedBox(
          height: 32,
        ),
        Obx(() => MPGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (__, index) => MPProductCart(
                  product: controller.products[index],
                )))
      ],
    );
  }
}

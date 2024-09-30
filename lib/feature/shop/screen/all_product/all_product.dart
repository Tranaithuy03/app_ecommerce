import 'package:app_my_pham/common/widgets/grid_layout.dart';
import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../home/widgets/appbar.dart';
class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'Popular Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: MPSortableProduct(),
        ),
      ),
    );
  }
}

class MPSortableProduct extends StatelessWidget {
  const MPSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort_copy)
          ),
            items: [
              'Name', 'Higher Price','Lower Price','Sale','Popularity'
            ].map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
            onChanged: (value){}
        ),
        const SizedBox(height: 32,),
        MPGridLayout(itemCount: 10, itemBuilder: (p0, p1) => const MPProductCart())
      ],
    );
  }
}

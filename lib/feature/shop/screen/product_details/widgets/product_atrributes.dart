import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product/variation_controller.dart';
import '../../../models/product_model.dart';
import '../../home/widgets/heading_section.dart';
import '../product_detail.dart';

class MPProductAttributes extends StatelessWidget {
  const MPProductAttributes({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Column(
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MPSectionHeading(
                    title: attribute.name ?? '',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Obx(
                        ()=> Wrap(
                        spacing: 16.0,
                        children: attribute.values!.map((value) {
                          final isSelected =
                              controller.selectedAttributes[attribute.name] ==
                                  value;
                          final available = controller
                              .getAttributeAvailabilityInVariation(
                              product.productVariations!, attribute.name!)
                              .contains(value);
                          return MPChoice(
                            text: value,
                            selected: isSelected,
                            onSelected: available? (selected){
                              if(selected && available){
                                controller.onAttributeSelected(product, attribute.name??'', value);
                              }
                            }
                                :null,
                          );
                        }).toList()),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            )
                .toList()),
      ],
    );
  }
}
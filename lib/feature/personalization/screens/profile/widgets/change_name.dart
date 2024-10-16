import 'package:app_my_pham/feature/personalization/controller/change_name_controller.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../utils/validators/validation.dart';

class MPChangeName extends StatelessWidget {
  const MPChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: MPCustomAppBar(
        isShowBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name to easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 32,
            ),

            ///form
            Form(
              key: controller.changeNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                        MPValidator.validateEmptyText(value, 'First Name'),
                    //controller: controller.firstName,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user), labelText: 'First Name'),
                  ),
                    const SizedBox(height: 24.0,),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                        MPValidator.validateEmptyText(value, 'Last Name'),
                    //controller: controller.firstName,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user), labelText: 'Last Name'),
                  ),
                    const SizedBox(height: 32.0,),
                  ],
            )
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()=> controller.uploadUserName(),
                  child: const Text(
                    'Save',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class MPAddMyAddress extends StatelessWidget {
  const MPAddMyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(title: Text('Add my address',style: Theme.of(context).textTheme.headlineSmall,),isShowBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_copy), labelText: 'Name'),),
                const SizedBox(height: 16,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile_copy), labelText: 'Phone'),),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_4_copy), labelText: 'Street'),),),
                    const SizedBox(width: 16.0,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code_1_copy), labelText: 'Postal Code'),),)
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_copy), labelText: 'City'),),),
                    const SizedBox(width: 16.0,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity_copy), labelText: 'State'),),)
                  ],
                ),
                const SizedBox(height: 16,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global_copy), labelText: 'Country'),),
                const SizedBox(height: 24.0,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Save')),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

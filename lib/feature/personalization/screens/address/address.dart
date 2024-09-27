import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/personalization/screens/address/widgets/add_address.dart';
import 'package:app_my_pham/feature/personalization/screens/address/widgets/address_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Get.to(()=> const MPAddMyAddress()),
        backgroundColor: Colors.blue,
        child:  const Icon(Icons.add,size: 25,color: Colors.white,),
      ),
      appBar: MPCustomAppBar(title: Text('Address', style: Theme.of(context).textTheme.headlineSmall,),isShowBackArrow: true,),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              MPAddress(isSelected: true,),
              MPAddress(isSelected: false,)
            ],
          ),
        ),
      ),
    );
  }
}



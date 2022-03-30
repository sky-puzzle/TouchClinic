import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/details.dart';
import 'package:touch_clinic/model/touch_model.dart';

import '../model/get_ads.dart';
import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';
import 'lay_out.dart';

class NewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.grey[200],
                  centerTitle: true,
                  title: const Text(
                    'عيادات مضافه حديثا',
                    style: TextStyle(fontSize: 15,color: Colors.black),
                  ),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeLayOut()),
                        );
                        ShopCubit.get(context).changeNav(0);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.cyan[600],
                      )),
                ),
                // body: SingleChildScrollView(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                //     child: Column(
                //       children: [
                //
                //         const SizedBox(height: 15,),
                //         ListView.builder(
                //           itemBuilder: (context, index) => buildHome(ShopCubit.get(context).adsModel!.data![index],context),
                //           itemCount: ShopCubit.get(context).adsModel!.data!.length,
                //           // scrollDirection: Axis.vertical,
                //            shrinkWrap: true,physics: const BouncingScrollPhysics(),
                //
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ),
            ),
          );
        }

    );
  }
  // Widget buildHome(Data model,context) => InkWell(
  //   onTap: (){
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 DetailsScreen(model)),
  //             );
  //
  //   },
  //   child: Card(
  //     clipBehavior: Clip.hardEdge,
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(20))),
  //     child: Column(
  //       children: [
  //         Image(
  //           image: AssetImage(model.imageUrl.toString()),
  //           fit: BoxFit.cover,
  //           height: 150,
  //           width: double.infinity,
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(15.0),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   const CircleAvatar(
  //                     radius: 40,
  //                     backgroundImage: AssetImage('assets/images/img6.png'),
  //                   ),
  //                   const SizedBox(
  //                     width: 15,
  //                   ),
  //                   Expanded(
  //                     child: Column(
  //                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           model.title,
  //                           style: const TextStyle(fontSize: 15),
  //                         ),
  //                         const SizedBox(
  //                           height: 10,
  //                         ),
  //                         Text(
  //                           model.city,
  //                           style: const TextStyle(
  //                               fontSize: 12, color: Colors.grey),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               const Divider(
  //                 color: Color(0xFFBDBDBD),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               Row(
  //                 children: [
  //                   const Image(
  //                     image: AssetImage('assets/icons/img_14.png'),
  //                     width: 30,
  //                   ),
  //                   const SizedBox(
  //                     width: 20,
  //                   ),
  //                   Expanded(
  //                     child: Text(
  //                       model.discription,
  //                       style: const TextStyle(
  //                           fontSize: 15,
  //                           color: Colors.grey,
  //                           overflow: TextOverflow.ellipsis),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               Row(
  //                 children: [
  //                   const Icon(
  //                     Icons.location_on_sharp,
  //                     size: 30,
  //                     color: Color(0xFF00ACC1),
  //                   ),
  //                   const SizedBox(
  //                     width: 20,
  //                   ),
  //                   Expanded(
  //                     child: Text(model.address,
  //                         style: const TextStyle(fontSize: 15, color: Colors.grey)),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               Row(
  //                 children: [
  //                   const Icon(
  //                     Icons.watch_later_outlined,
  //                     size: 30,
  //                     color: Color(0xFF00ACC1),
  //                   ),
  //                   const SizedBox(
  //                     width: 20,
  //                   ),
  //                   Expanded(
  //                     child: Text(model.date,
  //                         style: const TextStyle(fontSize: 15, color: Colors.grey)),
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/cubit/shop_cubit.dart';
import 'package:touch_clinic/layout/cubit/shop_states.dart';
import 'package:touch_clinic/model/touch_model.dart';

import '../model/get_ads.dart';
import 'details.dart';

class Favoritescreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return  SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child:  Center(child: Text('فارغة',style: TextStyle(fontSize: 15),))
          ),
        );
      }

    );
  }
  Widget buildHome(Data model,context) => InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailsScreen(model)),
              );
    },
    child: Card(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image(
                image: AssetImage(model.img.toString()),
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(backgroundColor: Colors.white,


                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outlined,
                          size: 25,
                          color: Colors.red,
                        ))),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/img6.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name.toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            model.address.toString(),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Color(0xFFBDBDBD),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/icons/img_14.png'),
                      width: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        model.body.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      size: 30,
                      color: Color(0xFF00ACC1),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(model.address.toString(),
                        style: const TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 30,
                      color: Color(0xFF00ACC1),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(model.date.toString(),
                          style: const TextStyle(fontSize: 15, color: Colors.grey)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/model/my_appoint.dart';
import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';

class scheduleScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ConditionalBuilder(

                condition: state is ! ShopSuccessAppointStates ,
                builder: (context)=> buildMyAppoint(cubit.myAppointment!,context) ,
                fallback:(context)=>const Center(child: CircularProgressIndicator()) ,
              )
            ),
          );
        });
  }

  buildMyAppoint(MyAppointment myAppointment,context ) =>
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text('مواعيدي',style: TextStyle(fontSize: 15),textScaleFactor: 1,),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemBuilder: (context,index)=> buildListAppoint(ShopCubit.get(context).myAppointment!.data![index]),
                itemCount: ShopCubit.get(context).myAppointment!.data!.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),

              ),
            ],
          ),
        ),
      );

  buildListAppoint(DataModel data) =>
      Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('الكود',style: TextStyle(fontSize: 12,color: Colors.grey),),
                      Text(data.qrcode.toString(),style :TextStyle(fontSize: 13),textScaleFactor: 1),
                    ],
                  ),
                  Column(
                    children: [
                      Text('الميعاد',style: TextStyle(fontSize: 11,color: Colors.grey),textScaleFactor: 1,),
                      Text(data.date.toString(),style: TextStyle(fontSize: 13),textScaleFactor: 1,),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      );

  //     ListTile(
  //   title:Text(data.date.toString(),style: TextStyle(fontSize: 13),textScaleFactor: 1,) ,
  //   leading: Text(data.qrcode.toString(),style :TextStyle(fontSize: 13),textScaleFactor: 1),
  // );
}


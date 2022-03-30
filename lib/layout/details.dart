import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/lay_out.dart';
import 'package:touch_clinic/model/touch_model.dart';
import 'package:touch_clinic/shared/constants.dart';

import '../model/get_ads.dart';
import 'cubit/shop_cubit.dart';
import 'cubit/shop_states.dart';

class DetailsScreen extends StatelessWidget {
  Data? model;

  DetailsScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.grey[200],
                  centerTitle: true,
                  title:  Text(
                    model!.name.toString(),
                    // 'مركز الحياه للتجميل',
                    style: TextStyle(fontSize: 15, color: Colors.black),textScaleFactor: 1,
                  ),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeLayOut()),
                        );
                        ShopCubit.get(context).changeNav(0);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.cyan[600],
                      )),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image(
                            image: NetworkImage(
                                'http://touch.extra-laboratory.com/api/img/${model!.img}'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                width: 175,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)
                                    // color: Colors.white,
                                    ),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.favorite_border,
                                          size: 22,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'اضف للمفضله',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700]),
                                          textScaleFactor: 1,
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            // const Spacer(),
                            Container(
                              clipBehavior: Clip.hardEdge,
                              width: 175,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)
                                  // color: Colors.white,
                                  ),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.share_rounded,
                                        size: 22,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'مشاركه العرض',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]),
                                        textScaleFactor: 1,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'كوبونات الخصم',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        model!.offer!.isNotEmpty
                            ? Column(
                                children: [
                                  Card(
                                    elevation: 3,
                                    clipBehavior: Clip.hardEdge,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 120,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: Image(
                                                    image: NetworkImage(
                                                        'http://touch.extra-laboratory.com/api/img/${model!.img}'),
                                                    width: 110,
                                                    height: 110,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  //
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      model!.offer![0].title
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      textScaleFactor: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      model!.offer![0].body
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                      textScaleFactor: 1,
                                                    ),
                                                    SizedBox(
                                                      width: 70,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                        children: [
                                                          Text(
                                                            model!.offer![0].after
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 12.0,
                                                            ),
                                                          ),
                                                          Text("/"),
                                                          Text(
                                                            model!.offer![0].befor.toString()
                                                                .toString(),
                                                            style: TextStyle(
                                                              decoration: TextDecoration.lineThrough,
                                                              fontSize: 12.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: double.infinity,
                                             height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.grey[100]),
                                            child: InkWell(
                                              onTap: (){
                                                ShopCubit.get(context).Appoint(int.parse(model!.id.toString()),token!);

                                              },
                                              child:  Center(
                                                child: Text(
                                                  'حجز',
                                                  style: TextStyle(fontSize: 14),textScaleFactor: 1,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    elevation: 3,
                                    clipBehavior: Clip.hardEdge,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            // mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 120,
                                                  decoration:
                                                  const BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius
                                                              .circular(
                                                              10))),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: Image(
                                                    image: NetworkImage(
                                                        'http://touch.extra-laboratory.com/api/img/${model!.img}'),
                                                    width: 110,
                                                    height: 110,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  //
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      model!.offer![0].title
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      textScaleFactor: 1,
                                                      textAlign:
                                                      TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      model!.offer![1].body
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                      textScaleFactor: 1,
                                                    ),
                                                    SizedBox(
                                                      width: 70,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                        children: [
                                                          Text(
                                                            model!.offer![1].after
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 12.0,
                                                            ),
                                                          ),
                                                          Text("/"),
                                                          Text(
                                                            model!.offer![1].befor.toString()
                                                                .toString(),
                                                            style: TextStyle(
                                                              decoration: TextDecoration.lineThrough,
                                                              fontSize: 12.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: Colors.grey[100]),
                                            child: InkWell(
                                              onTap: (){
                                                ShopCubit.get(context).Appoint(int.parse(model!.id.toString()),token!);

                                              },
                                              child:  Center(
                                                child: Text(
                                                  'حجز',
                                                  style: TextStyle(fontSize: 14),textScaleFactor: 1,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                child: Text(
                                  'لا يوجد كوبونات حاليا',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                  textScaleFactor: 1,
                                ),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'معلومات عن المركز',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        // SizedBox(height: 5,),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children:  [
                            Image(
                              image: AssetImage('assets/icons/img_14.png'),
                              width: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                model!.body.toString(),
                                // 'زراعه شعر, ازاله شعر بالليزر, اخري',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis),
                                textScaleFactor: 1,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children:  [
                            Icon(
                              Icons.location_on_sharp,
                              size: 30,
                              color: Color(0xFF00ACC1),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              model!.address.toString(),
                              // '105 شارع 240 دبي',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              textScaleFactor: 1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children:  [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 30,
                              color: Color(0xFF00ACC1),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              model!.time.toString(),
                              // '10:00 ص ل 12:00 م',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              textScaleFactor: 1,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

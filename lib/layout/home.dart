import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/cubit/shop_cubit.dart';
import 'package:touch_clinic/layout/cubit/shop_states.dart';
import 'package:touch_clinic/layout/details.dart';
import 'package:touch_clinic/layout/new_clinic.dart';
import 'package:touch_clinic/layout/section1.dart';
import 'package:touch_clinic/model/category_model.dart';
import 'package:touch_clinic/model/get_ads.dart';
import 'package:touch_clinic/model/touch_model.dart';

import 'category_item.dart';

class HomeScreen extends StatelessWidget {
  List images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                child: Scaffold(
                  // appBar: AppBar(),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 10, right: 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/img.png'),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    alignment: AlignmentDirectional.topCenter,
                                    icon: const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 4.5,
                                      child: Icon(
                                        Icons.notifications_none_rounded,
                                        size: 28,
                                        color: Color(0xFF00ACC1),
                                      ),
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 170,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        style: const TextStyle(height: 0.8),
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: 'بحث بالاسم',
                                          hintStyle: TextStyle(fontSize: 11),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          prefixIcon:
                                              Icon(Icons.search_rounded),
                                        ),
                                      )),
                                  const Spacer(),
                                  Container(
                                      width: 170,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.place_outlined,
                                            color: Colors.grey,
                                          ),
                                          // Spacer(),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                isExpanded: true,
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xFF757575),
                                                    wordSpacing: 17,
                                                    fontFamily: 'Jannah'),
                                                iconSize: 25,
                                                alignment: Alignment.center,
                                                value: ShopCubit.get(context)
                                                    .dropval,
                                                items: ShopCubit.get(context)
                                                    .drop1,
                                                onChanged: (String? val) {
                                                  if (val != null) {
                                                    ShopCubit.get(context)
                                                        .dropval = val;
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: CarouselSlider(
                                  items: images
                                      .map((e) => Image(
                                            image: AssetImage(e),
                                            width: double.infinity,
                                            // height: 400,
                                            fit: BoxFit.cover,
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                    initialPage: 0,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    autoPlayAnimationDuration:
                                        const Duration(seconds: 1),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    reverse: false,
                                    scrollDirection: Axis.horizontal,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    height: 200,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'الاقسام',
                                    style: TextStyle(fontSize: 14),textScaleFactor: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            // height: 100,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,

                              physics: const BouncingScrollPhysics(),
                              child: Wrap(
                                // verticalDirection: VerticalDirection.up,
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                alignment: WrapAlignment.start,
                                spacing: 8.0,
                                runSpacing: 10.0,
                                children: List.generate(
                                    ShopCubit.get(context).CATEGORIES.length,
                                    (int index) => buildCategoriesItems(
                                        ShopCubit.get(context)
                                            .CATEGORIES[index],
                                        context)),
                              ),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'عيادات مضافه حديثا',
                                style: TextStyle(fontSize: 14),textScaleFactor: 1,
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => NewScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'عرض الكل',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),textScaleFactor: 1,
                                  ))
                            ],
                          ),
                        ),
                        ConditionalBuilder(
                          condition:cubit.adsModel !=null ,
                          builder:(context)=> buildAds(cubit.adsModel,context) ,
                          fallback: (context)=> const CircularProgressIndicator(),

                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
  buildAds(GetAdsModel? adsModel,context) =>
      ListView.builder(
        itemBuilder: (context, index) => buildHome(
            ShopCubit.get(context).adsModel!.data![index], context),
        itemCount: ShopCubit.get(context).adsModel!.data!.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      );

  Widget buildHome(Data model, context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(model)),
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
                      image: NetworkImage('https://touch.extra-laboratory.com/api/img/${model.img}'),
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                size: 25,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/img6.png'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.name.toString(),
                                  style: const TextStyle(fontSize: 12),textScaleFactor: 1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  model.address.toString(),
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey),textScaleFactor: 1,
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
                                  fontSize: 13,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis),textScaleFactor: 1,
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
                          Expanded(
                            child: Text(model.address.toString(),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),textScaleFactor: 1,),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:  [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 30,
                            color: Color(0xFF00ACC1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(model.time.toString(),
                                style:  TextStyle(
                                    fontSize: 13, color: Colors.grey),textScaleFactor: 1,),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  buildCategoriesItems(CategoryModel model, BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductsCategory(model)));
        },
        child: MyChip(
          label: model.title.toString(),
          image: model.imageUrl.toString(),
        ),
      );


}

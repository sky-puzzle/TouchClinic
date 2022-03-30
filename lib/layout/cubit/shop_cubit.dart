import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_clinic/layout/cubit/shop_states.dart';
import 'package:touch_clinic/model/appointment.dart';
import 'package:touch_clinic/model/category_model.dart';
import 'package:touch_clinic/model/get_ads.dart';
import 'package:touch_clinic/model/my_appoint.dart';
import 'package:touch_clinic/model/products.dart';
import 'package:touch_clinic/model/sections.dart';
import 'package:touch_clinic/model/touch_model.dart';
import 'package:touch_clinic/ntework/dio_helper.dart';

import '../../ntework/end_point.dart';
import '../../shared/constants.dart';
import '../favorites.dart';
import '../home.dart';
import '../schadule.dart';
import '../settinngs.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());


  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> BottomScreens = [
    HomeScreen(),
    scheduleScreen(),
    Favoritescreen(),
    SettingsScreen(),
  ];

  void changeNav(int index) {
    currentIndex = index;
    emit(ShopChangeNag());
  }

GetAdsModel? adsModel;

  void GetAds(){
    emit(ShopLoadingGetAdsStates());
    DioHelper.getData(url: GET_ADS,token: token).then((value) {
      // print(value.data);
      // print(token);

        adsModel = GetAdsModel.fromJson(value.data);




      emit(ShopSuccessGetAdsStates());
    }).catchError((error) {
      print(error);
      emit(ShopErrorGetAdsStates());
    });
  }
 Appointment? appointment;
  Map ChangeAppoint = {};

 void Appoint (int id, String token){
   emit(ShopLoadingAppointStates());
   // print("appoint $token");
    DioHelper.postData(url: APPOINTMENT, data: {
      'id':id,
      'token':token,

    }, token: token).then((value) {
      emit(ShopSuccessAppointStates());
      appointment = Appointment.fromJson(value.data);



      // print(value.data);
      Fluttertoast.showToast(
              msg: 'تم الحجز بنجاح',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );    }).catchError((error){
      emit(ShopErrorAppointStates());
      print(error.toString());
    });

 }


 MyAppointment? myAppointment;
 void MyAppoint (){
   emit(ShopLoadingMyAppointStates());
   print("appoint $token");
    DioHelper.getData(url: MYAPPOINTMENT,token: token


     ).then((value) {
      emit(ShopSuccessMyAppointStates());
      myAppointment = MyAppointment.fromJson(value.data);




      // print(value.data);

     }).catchError((error){
      emit(ShopErrorMyAppointStates());
      print(error.toString());
    });

 }

  List<TouchModel> touch =
      [
        TouchModel(
            id: 1,
            title: 'عيادة دكتور عبدالله للاسنان',
            city: 'العين',
            address: '105 شارع 240 العين',
            discription: 'ابتسامه هوليود , تنظيف جير , اخري',
            imageUrl: 'assets/images/imag1.jpg',
            imagAv: '',
            date: '10:00 ص ل 12:00 م'
        ),
        TouchModel(
            id: 2,
            title: 'مركز الروضه للتجميل',
            city: 'عجمان',
            address: '105 شارع 240 عجمان',
            discription: 'زراعه شعر, ازاله شعر بالليزر, اخري',
            imageUrl: 'assets/images/imag2.jpg',
            imagAv: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSShmkwkIQmRUftoXVVkVTrP9nRDjRc8K0kyw&usqp=CAU',
            date: '10:00 ص ل 12:00 م'
        ),
        TouchModel(
            id: 3,
            title: 'مركز الحياه للتجميل',
            city: 'دبي',
            address: '105 شارع 240 دبي',
            discription: 'زراعه شعر, ازاله شعر بالليزر, اخري',
            imageUrl: 'assets/images/iamg3.jpg',
            imagAv: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSShmkwkIQmRUftoXVVkVTrP9nRDjRc8K0kyw&usqp=CAU',
            date: '10:00 ص ل 12:00 م'
        ),
        TouchModel(
            id: 4,
            title: 'مركز الصفا للتجميل',
            city: 'دبي',
            address: '105 شارع 240 دبي',
            discription: 'العنايه بالوجه والبشره',
            imageUrl: 'assets/images/imag4.jpg',
            imagAv: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSShmkwkIQmRUftoXVVkVTrP9nRDjRc8K0kyw&usqp=CAU',
            date: '10:00 ص ل 12:00 م'
        ),
        TouchModel(
            id: 5,
            title: 'مركز دينا للاسنان',
            city: 'ابوظبي',
            address: '105 شارع 240 ابوظبي',
            discription: 'العنايه بالوجه والبشره',
            imageUrl: 'assets/images/imag5.jpg',
            imagAv: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSShmkwkIQmRUftoXVVkVTrP9nRDjRc8K0kyw&usqp=CAU',
            date: '10:00 ص ل 12:00 م'
        ),
        TouchModel(
            id: 6,
            title: 'مركز مادريد للاسنان',
            city: 'الشارقه',
            address: '105 شارع 240 الشارقه',
            discription: 'ابتسامه هوليود, تنظيف جير, اخري',
            imageUrl: 'assets/images/imag6.jpg',
            imagAv: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSShmkwkIQmRUftoXVVkVTrP9nRDjRc8K0kyw&usqp=CAU',
            date: '10:00 ص ل 12:00 م'
        ),
      ];




  String dropval = 'دبي';
  static final menuItem = <String>[
    'دبي',
    'ابوظبي',
    'الشارقة',
    'العين',
    'الفجيرة',
    'عجمان',
  ];
  final List<DropdownMenuItem<String>> drop1 = menuItem
      .map((String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ))
      .toList();

  List<CategoryModel> CATEGORIES = [
    CategoryModel(
        id: 70,
        title: 'ليزر كامل',
        imageUrl:
        'assets/icons/img_16.png'),
    CategoryModel(
        id: 71,
        title: 'ليزر مناطق',
        imageUrl:
        'assets/icons/img_19.png'),
    CategoryModel(
        id: 72,
        title: 'حجامه',
        imageUrl:
        'assets/icons/img_5.png'),
    CategoryModel(
        id: 73,
        title: 'سبا',
        imageUrl:
        'assets/icons/img_17.png'),
    CategoryModel(
        id: 74,
        title: 'الاسنان',
        imageUrl:
        'assets/icons/img_21.png'),
    CategoryModel(
        id: 75,
        title: "بشره",
        imageUrl:
        'assets/icons/img_18.png'),
    CategoryModel(
        id: 76,
        title: "نحت قوام",
        imageUrl:
        'assets/icons/img_20.png'),
  ];
  final List<ProductsModel> PRODUCTS = [
    ProductsModel(
        id: '1',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 290 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/pic1.jpg',


        categories: [70,71],
        description:
        '5 جلسات ليزر للجسم كامل مع 5 رتوش للجسم كامل بجهازجنتل ماكس برو يشمل خاصيه التبريد لجميع انواع البشره وجميع انواع الشعر + جلسه ليزر كربوني لنضاره الوجه بجهاز سبكترا',
        price: 1699,
        oldPrice: 2600,
        discount: '45 %',

        address1: 'مجمع صحتي المتميز الطبي',
        address2: 'حي الصفا وسط دبي',


    ),
    ProductsModel(
        id: '2',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 290 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/pic2.jpg',


        categories: [75],
        description:
        'جلسه فيلر 1 مل بماده ديرما استايل لاي منطقه من اختيارك (شفايف - استقامه الانف - خدود)جلسه توريد شفايف بالليزر بجهاز ديكا كيوسويتشد',
        price: 569,
        oldPrice: 1500,
        discount: '62 %',

        address1: 'مجمع عيادات الماس',
        address2: 'حي الصفا وسط دبي',


    ),
    ProductsModel(
        id: '3',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 290 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/pic3.jpg',


        categories: [75],
        description:
        '3 جلسات لتنظيف البشره العميف بجهاز الهيدرافيشل مع ماسك التفتيح',
        price: 600,
        oldPrice: 1200,
        discount: '50 %',

        address1: 'مجمع صحتي المتميز الطبي',
        address2: 'حي الصفا وسط دبي',


    ),
    ProductsModel(
        id: '4',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 290 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/pic4.jpg',


        categories: [72],
        description:
        'نقدم مجموعة متنوعة من العلاجات التكميلية والتكاملية التي تساعد في تحسين قدرة الجسم على الشفاء والتعافي، والتي تزيد من التحكم في أعراض المشاكل المزمنة وتخفف من حدتها، ومن بين ذلك الحجامة، ونحرص عند تطبيق ذلك على الاستعانة بأحدث الأجهزة المعتمدة لهذا المجال، ونتبع إجراءات التطبيق بمعاييرها الطبية التي تضمن تحقيق النتائج الفعالة',
        price: 350,
        oldPrice: 650,
        discount: '45 %',

        address1: 'مركز السلطان الطبي',
        address2: 'حي مشاريف عجمان',


    ),
    ProductsModel(
        id: '5',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 290 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/na7t.png',


        categories: [76,71],
        description:
        'استخدام طاقة الليزر لتسخين وتدمير الخلايا، ليتخلص منها الجهاز الليمفاوي لاحقاً في غضون 12 أسبوع تقريباً بعد الإجراء، ويمكن استخدام هذه التقنية لعلاج منطقة البطن وجوانب الخصر، وتستغرق كل منطقة حوالي 25 دقيقة',


        price: 1699,
        oldPrice: 2600,
        discount: '45 %',

        address1: 'مجمع صحتي المتميز الطبي',
        address2: 'حي الصفا وسط دبي',


    ),
    ProductsModel(
        id: '6',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 290 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/img4.jpg',


        categories: [74],
        description:
        '5 جلسات لعلاج الاسنان وتنظيف الاسنان من الجير والكشف عن تسوس الاسنان',
        price: 700,
        oldPrice: 100,
        discount: '30 %',

        address1: 'عياده الدكتور عبدالله للاسنان',
        address2: 'حي الصفا العين',


    ),
    ProductsModel(
        id: '7',
        title: 'hp Laptop',
        payment: '5 جلسات لعلاج الاسنان وتنظيف الاسنان من الجير والكشف عن تسوس الاسنان',
        imageUrl:'assets/images/imag1.jpg',


        categories: [74],
        description:
        '5 جلسات ليزر للجسم كامل مع 5 رتوش للجسم كامل بجهازجنتل ماكس برو يشمل خاصيه التبريد لجميع انواع البشره وجميع انواع الشعر + جلسه ليزر كربوني لنضاره الوجه بجهاز سبكترا',
        price: 750,
        oldPrice: 1200,
        discount: '45 %',

        address1: 'مركز دينا للاسنان',
        address2: 'حي الاعظميه ابوظبي',


    ),
    ProductsModel(
        id: '8',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 150 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/pic5.jpg',


        categories: [73],
        description:
        'تدلل بحصولك على جلسة مساج وحمام ومغربي وغيرها من الخدمات الأخرى في إتش كير سبا',
        price: 250,
        oldPrice: 350,
        discount: '30 %',

        address1: 'مجمع جميرا للفنادق ',
        address2: 'جميرا دبي',


    ),
    ProductsModel(
        id: '9',
        title: 'hp Laptop',
        payment: 'لتأكيد حجزك لهذا العرض واصدار الفاتورهيرجي سداد جزء من قيمه العرض فقط مبلغ 150 درهم والمتبقي من قيمه العرض يتم سداده يوم موعدك في المركز',
        imageUrl:'assets/images/pic6.jpg',


        categories: [73],
        description:
        'تدلل بحصولك على جلسة مساج وحمام ومغربي وغيرها من الخدمات الأخرى في إتش كير سبا',
        price: 205,
        oldPrice: 300,
        discount: '30 %',

        address1: 'مجمع صحتي المتميز الطبي',
        address2: 'حي الصفا وسط دبي',


    ),

  ];
  // List<ProductsModel> PRODUCTS_SALE = [
  //   ProductsModel(
  //       id: '17',
  //       title: 'PVC Bean Bag Black',
  //       imageUrl:
  //       'http://your-order.store/wp-content/uploads/2013/06/N12741301A_1.webp',
  //       imagesUrl: [
  //         'http://your-order.store/wp-content/uploads/2013/06/N12741301A_1.webp'
  //       ],
  //       categories: [73],
  //       description: 'PVC Bean Bag Black 80x80x50centimeter',
  //       price: 71,
  //       oldPrice: 119,
  //       discount: '40',
  //       quantity: '10',inCart: false),
  //   ProductsModel(
  //       id: '11',
  //       title: 'Ruched Mini Dress Black',
  //       imageUrl:
  //       'http://your-order.store/wp-content/uploads/2013/06/N44397095V_1.webp',
  //       imagesUrl: [
  //         'http://your-order.store/wp-content/uploads/2013/06/N44397095V_1.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N44397095V_2.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N44397095V_3.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N44397095V_4.webp',
  //       ],
  //       categories: [76],
  //       description: 'Ruched Mini Dress Black',
  //       price: 118,
  //       oldPrice: 196,
  //       discount: '50',
  //       quantity: '10',inCart: false),
  //   ProductsModel(
  //       id: '12',
  //       title: 'Noemia Sleeveless Maxi Dress Teal',
  //       imageUrl:
  //       'http://your-order.store/wp-content/uploads/2013/06/N40893697V_1.webp',
  //       imagesUrl: [
  //         'http://your-order.store/wp-content/uploads/2013/06/N40893697V_1.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N40893697V_4.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N40893697V_2.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N40893697V_3.webp',
  //       ],
  //       categories: [76],
  //       description: 'Noemia Sleeveless Maxi Dress Teal',
  //       price: 146,
  //       oldPrice: 365,
  //       discount: '60',
  //       quantity: '10',inCart: false),
  //   ProductsModel(
  //       id: '14',
  //       title: 'Sherpa Flight Bomber Jacket Black',
  //       imageUrl:
  //       'http://your-order.store/wp-content/uploads/2013/06/N39783613V_1.webp',
  //       imagesUrl: [
  //         'http://your-order.store/wp-content/uploads/2013/06/N39783613V_1.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N39783613V_2.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N39783613V_3.webp',
  //         'http://your-order.store/wp-content/uploads/2013/06/N39783613V_4.webp',
  //       ],
  //       categories: [75],
  //       description: 'Sherpa Flight Bomber Jacket Black',
  //       price: 506,
  //       oldPrice: 680,
  //       discount: '25',
  //       quantity: '10',inCart: false),
  // ];




}

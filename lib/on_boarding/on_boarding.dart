import 'package:flutter/material.dart';
import 'package:touch_clinic/login/login_screen.dart';
import 'package:touch_clinic/ntework/cache_helper.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  void submit(context){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      }});}


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[300]
                    ),
                    // clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text('English',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),)

                        ),
                        // const SizedBox(
                        //   width: 1,
                        // ),
                        const Icon(
                          Icons.language,
                          size: 23,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  const Image(
                    image: AssetImage('assets/images/img.png'),
                  )
                ],
              ),
              // const SizedBox(height: 10,),
              const Expanded(
                  child: Image(image: AssetImage('assets/images/img_1.png'))),
              // const SizedBox(
              //   height: 10,
              // ),
              const Text(
                'عروض وخصومات علي العيادات والمراكز الطبيه',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF00ACC1),
                ),
                child: MaterialButton(
                    onPressed: () {
                      submit(context);
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(builder: (context)=> LoginScreen()), (
                      //     route) => false);
                    },
                    child: const Text(
                      'استمرار',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

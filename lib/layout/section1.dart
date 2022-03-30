import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyChip extends StatelessWidget {

  final String label;
  final String image;
   MyChip({ required this.label, required this.image}) ;
  @override
  Widget build(BuildContext context) {
    return Chip(
       elevation: 1,
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(fontSize: 13),
      avatar: CircleAvatar(backgroundColor: Colors.white,
        backgroundImage:AssetImage(image,),radius: 14 ,
          // child: Image(image: AssetImage(image,),height: 25,)
      ),
      label: Text(label),


        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // padding: EdgeInsets.zero,

    );
  }
}

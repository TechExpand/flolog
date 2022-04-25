import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Contants/color.dart';

Widget shimmerEffect(context){
 return Container(
   height: MediaQuery.of(context).size.height,
   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
   child: Column(
     mainAxisSize: MainAxisSize.max,
     children: <Widget>[
       Expanded(
         child: Shimmer.fromColors(
           baseColor: Colors.grey.shade300,
           highlightColor: Colors.grey.shade100,
           enabled: true,
           child: Container(
             margin: EdgeInsets.only(left: 10, right: 10),
             width: MediaQuery.of(context).size.width,
             child: GridView.builder(
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 gridDelegate:
                 const SliverGridDelegateWithMaxCrossAxisExtent(
                     maxCrossAxisExtent: 200,
                     childAspectRatio: 3 / 4.50,
                     crossAxisSpacing: 15,
                     mainAxisSpacing: 0),
                 itemCount: 4,
                 itemBuilder: (BuildContext ctx, index) {
                   return InkWell(
                     onTap: () {

                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Stack(
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(5)),
                                 child: Container(
                                   height: 240,
                                   width:
                                   MediaQuery.of(context).size.width,
                                   alignment: Alignment.center,
                                   child: Text(''),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.all(
                                           Radius.circular(5))),
                                 ),
                               ),
                             ],
                           ),

                         ],
                       ),
                     ),
                   );
                 }),
           ) ,
         ),
       ),

     ],
   ),
  );
}
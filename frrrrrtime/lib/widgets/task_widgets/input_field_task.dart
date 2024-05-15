import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frrrrrtime/configs/themes_third//theme.dart';



class MyInputfield extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputfield ({super.key,

    required this.title,
    required this.hint,
    this.widget,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Text(title,
            style:titleStyle,
          ),
          Container(
            height : 52,
            padding:const EdgeInsets.only(left: 14) ,
            margin: const EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color:Colors.grey,
                    width: 1.0

                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                    child : TextFormField(
                        readOnly:widget==null?false:true,
                        autofocus: false,
                        cursorColor:Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                        controller:controller ,
                        style: subtitleStyle,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: subtitleStyle,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context.theme.colorScheme.background,
                                  width : 0
                              )
                          ),
                          enabledBorder:UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context.theme.colorScheme.background,
                                  width : 0
                              )
                          ),
                        )
                    )
                ),
                widget==null?Container():Container(child: widget)
              ],
            ),




          )
        ],
      ),

    );
  }
}
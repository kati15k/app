import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/configs/themes/custom_text_styles.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/controllers/question_paper/question_paper_controller.dart';
import 'package:frrrrrtime/controllers/zoom_drawer_controller.dart';
import 'package:frrrrrtime/screens/home/menu_screen.dart';
import 'package:frrrrrtime/screens/home/question_card.dart';
import 'package:frrrrrtime/widgets/app_circle_button.dart';
import 'package:frrrrrtime/widgets/app_icons.dart';
import 'package:frrrrrtime/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});
  static const String routeName= "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder <MyZoomDrawerController>(builder :(_){
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.DefaultStyle,
          backgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width*0.5,

          menuScreen: const MenuScreen(),
          mainScreen: Container(

            decoration: BoxDecoration(
              gradient: mainGradient(),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children:  [
                        AppCircleButton(
                          onTap:controller.toogleDraw ,
                          width: 10,
                          child: const Icon(AppIcons.menuleft,),

                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(

                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        const Text(
                          "Current Quizzes",
                          style:headerText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(()=> ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            itemBuilder: (BuildContext context , int index ){
                             return QuestionCard(
                                model: questionPaperController.allPapers[index],
                              );
                            },
                            separatorBuilder: (BuildContext context , int index ){
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: questionPaperController.allPapers.length),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}




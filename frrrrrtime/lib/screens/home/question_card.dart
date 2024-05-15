import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/custom_text_styles.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/controllers/question_paper/question_paper_controller.dart';
import 'package:frrrrrtime/models/question_paper_model.dart';
import 'package:frrrrrtime/widgets/app_icon_text.dart';
import 'package:get/get.dart';

import '../question/questions_screen.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});
  final QuestionPaperModel model;
  static const String routeName="/questionsscreen";
  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: (){
          Get.toNamed(QuestionsScreen.routeName, arguments: model);
         /* Get.toNamed("/questionsscreen");
         controller.navigateToQuestions(routeName: routeName, paper: model);*/
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            clipBehavior:Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ColoredBox(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: SizedBox(
                            height: Get.width * 0.15,
                            width: Get.width * 0.15,
                            child: CachedNetworkImage(
                              imageUrl: model.imageUrl!,
                              placeholder: (context, url) => Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/app_splash_logo.png"),
                            )),
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cartTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text("${model.id.toUpperCase()} 2023_2024",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1.0, // Add letter spacing
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.9),
                          ),),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: AppIconText(
                                  icon: Icon(
                                    Icons.help_outline_sharp,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                                  widget: Padding(
                                    padding: const EdgeInsets.only(right:0.0),
                                    child: Text(
                                      'Make Sure To Check The Materials.',
                                      style: detailText.copyWith(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 15,
                            ),

                          ],
                        ),
                        Positioned(
                           bottom: -padding,
                            right:- padding,
                            child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft:Radius.circular(cardBorderRadius),
                                bottomRight: Radius.circular(cardBorderRadius),
                              ),

                            ),

                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

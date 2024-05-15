import 'package:flutter/material.dart';
import 'package:frrrrrtime/configs/themes/custom_text_styles.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/controllers/question_paper/questions_controller_extension.dart';
import 'package:frrrrrtime/controllers/questions_controller.dart';
import 'package:frrrrrtime/widgets/common/backgroung_decoration.dart';
import 'package:frrrrrtime/widgets/common/custom_app_bar.dart';
import 'package:frrrrrtime/widgets/content_area.dart';
import 'package:frrrrrtime/widgets/questions/answer_card.dart';
import 'package:frrrrrtime/widgets/questions/countdown_timer.dart';
import 'package:frrrrrtime/widgets/questions/question_number_card.dart';
import 'package:get/get.dart';

import '../../widgets/common/main_button.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});

static const String routeName="/testoverview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body:  BackgoundDecoration(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: ContentArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CountdownTimer(
                                color: UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyLarge!.color:Theme.of(context).primaryColor,
                                time: ''),
                            Obx(() => Text('${controller.time} Remaining',
                              style: countDownTimerr(),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                       Expanded(child:  GridView.builder(
                         itemCount: controller.allQuestions.length,
                         shrinkWrap: true,
                         physics: const BouncingScrollPhysics(),
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: Get.width~/75,
                           childAspectRatio: 1,
                           crossAxisSpacing: 8,
                           mainAxisSpacing: 8,


                                         ),
                         itemBuilder: (_,index) {
                           AnswerStatus? answerStatus;
                           if(controller.allQuestions[index].selectedAnswer!=null){
                             answerStatus=AnswerStatus.answered;
                           }
                           return QuestionNumberCard(
                               index: index+1,
                               status: answerStatus,
                               onTap: ()=>
                           controller.jumpToQuestion(index)
                           ) ;

                         },
                       )),
                      ],
                    ),
                    

                  )
              ),
              ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: MainButton(
                    onTap: (){
                      controller.saveTestResults();
                    controller.complete();
                    },
                    title: "Complete",
                  )
                ),
              )

            ],
          )
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frrrrrtime/configs/themes/custom_text_styles.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/controllers/question_paper/questions_controller_extension.dart';
import 'package:frrrrrtime/screens/question/answer_check_screen.dart';
import 'package:frrrrrtime/widgets/common/backgroung_decoration.dart';
import 'package:frrrrrtime/widgets/common/custom_app_bar.dart';
import 'package:frrrrrtime/widgets/common/main_button.dart';
import 'package:frrrrrtime/widgets/content_area.dart';
import 'package:frrrrrtime/widgets/questions/answer_card.dart';
import 'package:frrrrrtime/widgets/questions/question_number_card.dart';
import 'package:get/get.dart';

import '../../controllers/questions_controller.dart';

class ResultScreen extends GetView<QuestionsController> {

  const ResultScreen({super.key});
  static const String routeName="/resultscreen";

  @override
  Widget build(BuildContext context) {
    Color textColor = Get.isDarkMode?
        Colors.white:Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const SizedBox(
          height: 80,
        ),
        title:controller.correctAnsweredQuestions,
      ),
      body:BackgoundDecoration(
        child: Column(
          children: [

            Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/bulb.svg'),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 5),
                        child: Text(
                          'Congratulations',
                          style: headerText.copyWith(color: textColor),
                        ),
                      ),
                      Text("You have Got ${controller.points} Points",
                      style:TextStyle(
                        color: textColor,
                      ) ,
                      ),
                      const SizedBox(
                        height: 25,

                      ),
                      const Text(
                        'Tap below question numbers to view correct answers',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                          child: GridView.builder(
                            itemCount: controller.allQuestions.length,
                            shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: Get.width~/75,
                                childAspectRatio: 1,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8
                              ),
                              itemBuilder: (_,index){
                               final question = controller.allQuestions[index];
                               AnswerStatus status= AnswerStatus.notanswered;
                              final selectedAnswer= question.selectedAnswer;
                              final correctAnswer= question.correctAnswer;

                              if(selectedAnswer== correctAnswer){
                                status= AnswerStatus.correct;

                              }else if (question.selectedAnswer==null){
                                status=AnswerStatus.wrong;

                              }else{
                                status=AnswerStatus.wrong;
                              }
                              return QuestionNumberCard(
                                  index: index+1,
                                  status: status,
                                  onTap: (){
                                    controller.jumpToQuestion(index,isGoBack: false);
                                    Get.toNamed(AnswerCheckScreen.routeName);
                                  });
                              }
                          )),
                      ColoredBox(
                          color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParameters.mobileScreenPadding,
                        child: Row(
                          children: [
                            Expanded(
                              child: MainButton(
                                onTap: (){
                                controller.tryAgain();
                                },
                                color: Colors.blueGrey,
                                title: 'Try Again',
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: MainButton(
                                onTap: (){
                                 controller.navigateToHome();
                                controller.saveTestResults();
                                },
                                title: 'Go Home',
                              ),
                            ),
                          ],
                        ),
                      ),)
                    ],
                  ),
                ))
          ],
        ),
      )
    );
  }
}

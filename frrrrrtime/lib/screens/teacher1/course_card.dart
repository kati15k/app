import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frrrrrtime/configs/themes/custom_text_styles.dart';
import 'package:frrrrrtime/configs/themes/ui_parameters.dart';
import 'package:frrrrrtime/widgets/app_icon_text.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.courseName});

  final String courseName;
  static const String routeName = "/upload";

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            clipBehavior: Clip.none,
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
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseName,
                          style: cartTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            "2023_2024",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.0, // Add letter spacing
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
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
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Text(
                                    'Make Sure To Check The Materials.',
                                    style: detailText.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -padding,
                          right: -padding,
                          child: GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                  Radius.circular(cardBorderRadius),
                                  bottomRight:
                                  Radius.circular(cardBorderRadius),
                                ),
                              ),
                            ),
                          ),
                        )
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

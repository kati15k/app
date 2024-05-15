import 'package:flutter/material.dart';
import 'package:frrrrrtime/styles.dart';

class CourseCard extends StatelessWidget {
  final Color color;
  final String title;
  final String image;
  final String teacher;

  const CourseCard({super.key, required this.color, required this.title, required this.image, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 8
            )
          ]),
      child: Container(
        margin: const EdgeInsets.only(left: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 39,
              width: 64,
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                    size: 16,
                  ),
                  SizedBox(
                    width: 2,
                  ),

                ],
              ),
            ),
            Text(title,
              style: cardNameTextStyle,),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Hero(
                    tag:image,
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(36),
                          border: Border.all(width: 3.0,color: Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Teacher", style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 16),),
                        const SizedBox(height: 8,),
                        Text(teacher, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
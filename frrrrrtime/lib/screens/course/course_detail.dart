import 'package:flutter/material.dart';
import 'package:frrrrrtime/styles.dart';
import 'package:frrrrrtime/widgets/common/backgroung_decoration.dart';

class CourseDetailPage extends StatelessWidget {
  final val;
  static const String routeName="/course";

  const CourseDetailPage({ super.key, this.val});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgoundDecoration(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 88,
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 36,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(color: Colors.grey[200], fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      )),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
                            child: Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: val["color"],
                                      borderRadius: BorderRadius.circular(24),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                            "https://github.com/flutterbytes/flutter_glassmorphism/blob/master/up.png?raw=true",
                                          ),
                                          fit: BoxFit.cover
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          val["title"],
                                          style: detailsTitleTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        const Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
        
                                            SizedBox(
                                              width: 4,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text(
                              "Course Material",
                              style: detailsSubTitleTextStyle,
                            ),
                          ),
                          Container(
                            height: 300,
                            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(56),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 16)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 72,
                                      width: 72,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      child: const Center(
                                          child: Icon(
                                            Icons.videocam_outlined,
                                            color: Colors.white,
                                            size: 34,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "12 Video Tutorials",
                                            style: courseStyle,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "250 min ",
                                                style: const TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                    "of interesting lectures",
                                                    style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  )
                                                ]),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 72,
                                      width: 72,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.cyan,
                                      ),
                                      child: const Center(
                                          child: Icon(
                                            Icons.bookmark_border_rounded,
                                            color: Colors.white,
                                            size: 34,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "7 Practical Tasks",
                                            style: courseStyle,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "3 Teachers ",
                                                style: const TextStyle(
                                                    color: Colors.cyan,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400),
                                                children: [
                                                  TextSpan(
                                                    text: "will check your work",
                                                    style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  )
                                                ]),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 72,
                                      width: 72,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.pinkAccent,
                                      ),
                                      child: const Center(
                                          child: Icon(
                                            Icons.folder_outlined,
                                            color: Colors.white,
                                            size: 34,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "10 Templates for Design",
                                            style: courseStyle,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "500 MB ",
                                                style: const TextStyle(
                                                  color: Colors.pinkAccent,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "of sketch files",
                                                    style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  )
                                                ]),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
        
                          const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text(
                              "Teacher",
                              style: detailsSubTitleTextStyle,
                            ),
                          ),
                          Container(
                            height: 120,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 16)
                                ]),
                            child: Row(
                              children: [
                                Hero(
                                  tag:val["image"],
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(val["image"]),
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      val["teacher"],
                                      style: courseStyle,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
        
                                  ],
                                ),
                                const Spacer(),
        
                              ],
                            ),
                          ),
        
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
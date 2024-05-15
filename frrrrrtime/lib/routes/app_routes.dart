import 'package:frrrrrtime/controllers/question_paper/question_paper_controller.dart';
import 'package:frrrrrtime/controllers/questions_controller.dart';
import 'package:frrrrrtime/controllers/zoom_drawer_controller.dart';
import 'package:frrrrrtime/screens/admin_home/admin_home_screen.dart';
import 'package:frrrrrtime/screens/attendance/attendance.dart';
import 'package:frrrrrtime/screens/chat/chat_screen.dart';
import 'package:frrrrrtime/screens/course/course_home_screen.dart';
import 'package:frrrrrtime/screens/home/home_screen.dart';
import 'package:frrrrrtime/screens/introduction/introduction.dart';
import 'package:frrrrrtime/screens/login/login_screen.dart';
import 'package:frrrrrtime/screens/question/answer_check_screen.dart';
import 'package:frrrrrtime/screens/question/questions_screen.dart';
import 'package:frrrrrtime/screens/question/result_screen.dart';
import 'package:frrrrrtime/screens/question/test_overview_screen.dart';
import 'package:frrrrrtime/screens/splash/splash_screen.dart';
import 'package:frrrrrtime/screens/teacher1/teacher1_screen.dart';
import 'package:frrrrrtime/screens/teacher3/teacher3_screen.dart';
import 'package:frrrrrtime/screens/teacher2/teacher2_screen.dart';
import 'package:get/get.dart';
import 'package:frrrrrtime/screens/register/register_screen.dart';
import '../screens/task/home_task_screen.dart';
import '../screens/upload/upload.dart';



class AppRoutes {

static List<GetPage> routes()=>[
  // the slach refers to the first screen of ur whole app
  GetPage(name: "/", page: ()=> const SplashScreen()),

  GetPage(name: "/introduction", page: ()=> const Introduction()),
  GetPage(name: "/register", page: ()=> RegisterScreen()),
  GetPage(
    name: "/home", 
    page: ()=> const HomeScreen(),
    binding: BindingsBuilder((){
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());
      
    })
  ),

  GetPage(
    name: "/teacher1",
    page: ()=> const Teacher1(),
    binding: BindingsBuilder((){
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());

    })
  ),

  GetPage(
    name: "/teacher2",
    page: ()=> const Teacher2(),
    binding: BindingsBuilder((){
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());

    })
  ),GetPage(
    name: "/teacher3",
    page: ()=> const Teacher3(),
    binding: BindingsBuilder((){
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());

    })
  ),
      GetPage(
    name: "/chat",
    page: ()=>  ChatScreen(),
    binding: BindingsBuilder((){
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());

    })
    ),
  GetPage(
      name: "/login",
      page:()=> LoginScreen()),

  GetPage(
      name: "/admin",
      page:()=> const AdminScreen()),

  GetPage(
      name: "/file",
      page:()=>  const DemoApp()),

  GetPage(
      name: "/course",
      page: ()=>  const CourseHomePage(),

  ),

  GetPage(
      name: "/task",
      page:()=> const HomePage()),

  GetPage(
      name: "/att",
      page:()=> const Attendance()),




  /*GetPage(
      name: "/chat",
      page:()=> ChatScreen()),*/

  GetPage(
      name: "/questionsscreen",
      page:()=> const QuestionsScreen(),
      binding: BindingsBuilder((){
        Get.put<QuestionsController>(QuestionsController());
      })
  ),
  GetPage(
      name: TestOverviewScreen.routeName,
      page:()=> const TestOverviewScreen(),
  ),
  GetPage(
      name: ResultScreen.routeName,
      page:()=> const ResultScreen(),
  ),
  GetPage(
      name: AnswerCheckScreen.routeName,
      page:()=> const AnswerCheckScreen(),
  ),
  GetPage(
      name: ChatScreen.routeName,
      page:()=>  ChatScreen(),
  ),


];
}
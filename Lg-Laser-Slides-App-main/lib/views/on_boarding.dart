
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_slides/models/boxes.dart';
import 'package:laser_slides/models/slide.dart';
import 'package:laser_slides/views/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Image image1;
  late Image image2;
  late Image image3;

  @override
  void initState(){
    image1 = Image.asset("assets/images/laser1.jpg");
    image2 = Image.asset("assets/images/lg2.png");
    super.initState();
    initDB();
  }

  void initDB(){
    if(boxSLides.isEmpty){
      for(int i = 0;i<18;i++){
        boxSLides.put("$i", Slide(label: "Slide ${i+1}", command: "0 1"));
      }
    }
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    

    return Scaffold(
      body: Stack(
          children:[
            PageView(
              controller: pageController,
              //physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.horizontal,
              children: [
                onBoardpage(sh,sw,image1.image,"Welcome to Laser Slides ","Your Ultimate Presentation Companion!","Welcome aboard Laser Slides, where innovation meets simplicity! Whether you're a seasoned presenter or a first-timer, our app is designed to revolutionize the way you interact with your laser presentations. Say goodbye to traditional slideshows and hello to seamless, button-controlled presentations that captivate your audience."),
                onBoardpage(sh,sw,image2.image,"Powered by Liquid Galaxy","Build by GDG Lleida","Liquid Galaxy is a remarkable panoramic system that is tremendously compelling. It started off as a Google 20% project created by Google engineer Jason Holt to run Google Earth across a cluster of PC's and it has grown from there! \n\n Liquid Galaxy hardware consists of 3 or more computers driving multiple displays, usually one computer for each display. Liquid Galaxy applications have been developed using a master/slave architecture."),
              ],
            ),
            Positioned(
              bottom: sh * 0.12,
              left: sw /2 - 25,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: SwapEffect(
                  activeDotColor: const Color.fromARGB(255, 255, 255, 255),
                  dotColor: Colors.grey.shade400,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              //left: sw/10 - 10,
              child: Container(
                height: 50,
                width: sw,
                //margin:EdgeInsets.only(left: 10,right: 10),
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:Color.fromARGB(230, 244, 244, 244)
                ),
                child: InkWell(
                  onTap: (){
                    Get.to(const Home(),transition: Transition.downToUp,duration:const Duration(milliseconds: 400));
                  },
                  child:const Center(
                    child: Text("Continue",style: TextStyle(fontFamily: 'sen', color: Color.fromARGB(255, 33, 33, 33),fontSize: 20),)
                  ),
                ),
              )
            )
          ]
        ),
      );
  }
}

Widget onBoardpage(h,w,path,header1,header2,description){
  return Stack(
    children: [
      Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image:path,
            fit:BoxFit.cover,
          )
        ),
      ),
      Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color.fromARGB(0, 0, 0, 0),
              Color.fromARGB(193, 0, 0, 0),
            ],
            stops: [0.0,.9]
          )
        ),
      ),
      Positioned(
        top: h * 0.62,
        left: 10,
        child: SizedBox(
          width: w - 20,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(header1,style: const TextStyle(fontSize: 27,color:Colors.white,fontWeight: FontWeight.bold,fontFamily: 'sen'),),
              Text(header2,style: const TextStyle(fontSize: 20,color:Colors.white,fontFamily: 'sen'),),
              const SizedBox(height: 25,),
              Text(description,
                style: const TextStyle(fontSize: 12,color:Color.fromARGB(201, 255, 255, 255),fontFamily: 'sen'), 
                maxLines: 5, 
                overflow:TextOverflow.ellipsis,  
              ),
            ],
          ),
        ),
      )
    ],
  );
}


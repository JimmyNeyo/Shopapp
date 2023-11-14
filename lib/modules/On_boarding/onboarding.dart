import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/modules/login/shoplogin.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/network/local/cache_helper.dart';

class BoardingModel{
  late final String image ;
  late final String title ;
  late final String body ;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
  
}


class OnBoardingScreen extends StatefulWidget {



  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController boardcontroller = PageController();

  bool islast = false;

  final List<BoardingModel> boarding = [
    BoardingModel(  image: 'images/images.jfif',
                    title: 'on board title 1',
                     body: 'on board 1 body',
      ),
    BoardingModel(  image: 'images/images.jfif',
                    title: 'on board title 2',
                     body: 'on board 2 body',
      ), 
    BoardingModel(  image: 'images/images.jfif',
                    title: 'on board title 3',
                     body: 'on board 3 body',
      ),
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

       // title: const Center(child: Text('Shopping',style: TextStyle(fontSize: 40 , fontFamily: 'family' ),)),
        actions: [ TextButton(onPressed: (){
          
                              ssubmit();
        }, child: const Text('skip',style: TextStyle(fontSize: 38 , fontFamily: 'family' ,color: Colors.white),))],
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardcontroller,
                itemBuilder: (context , index) => buildboardscreen(boarding[index]) ,
                itemCount: boarding.length,
                onPageChanged: (index){
                  if(index == boarding.length -1){
                      setState(() {
                        islast =true;
                      });
                  }
                  else{
                      setState(() {
                        islast=false;
                      });
                  }
                },
                ),

                
              ),
              const SizedBox(height: 30.0,),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardcontroller,
                     count: boarding.length , 
                     effect: const JumpingDotEffect (
                      activeDotColor: Colors.black54,
                      dotColor: Colors.indigo,
                      dotHeight: 10,
                      dotWidth: 7,  
                      spacing: 20,
                      verticalOffset: 12, 

                     ),),
                 // const Text('Indicator' , style: TextStyle(fontSize: 20.0),) ,
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: (){
                      boardcontroller.nextPage(
                        duration: const Duration(milliseconds: 400), 
                        curve: Curves.easeInOutCubic,
                        );

                          if( islast == true){
                               ssubmit();
                          }
                       
                    } , 
                    child:const Icon(Icons.arrow_forward_ios)
                  )
                ],
              )
             
          ],
          ),
      ),
        
        );

  }

  Widget buildboardscreen(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage(
              model.image,
            ),
            fit: BoxFit.fill,
          )),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            model.title,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 25.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );


void ssubmit()async{
  await CacheHelper.saveData(key: 'onboarding' , value: true).then((value) {
    if(value){
        navigatorFinish(context, const ShopLogin());
    }
  });
   
}

}



import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tik_tok/Bloc/Tiktok/tiktok_bloc.dart';
import 'package:tik_tok/Repositry/Model/tik_tok_model.dart';
import 'package:tik_tok/Ui/Screens/vidioscreen.dart';

import 'package:video_player/video_player.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Tiktokmodel tiktok;
  late VideoPlayerController videoController;
  late FlickManager flickManager;

  Duration? videoDuration;
  bool isclicked = false;
  @override
  void initState() {
    BlocProvider.of<TiktokBloc>(context).add(Fetchtiktokevent());
    super.initState();
  }

  Future<void> initializePlay({String? videoPath}) async {
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.networkUrl(Uri.parse(videoPath!))
              ..initialize().then((_) {
                videoDuration = videoController.value.duration;
                videoController.play();
              }));
  }

  Future<void> startPlay(String videoPath) async {
    await _clearPrevious().then((_) {
      initializePlay(videoPath: videoPath);
    });
  }

  Future<bool> _clearPrevious() async {
    await videoController.pause();
    videoController.dispose();
    return true;
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TiktokBloc, TiktokState>(builder: (context, state) {
      if (state is TiktokIblocloading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is Tiktokblocerror) {
        return RefreshIndicator(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: const Center(child: Text('Oops something went wrong')),
            ),
          ),
          onRefresh: () async {
            return BlocProvider.of<TiktokBloc>(context).add(Fetchtiktokevent());
          },
        );
      }
      if (state is Tiktokblocloaded) {
        tiktok = BlocProvider.of<TiktokBloc>(context).tiktokmodel;
        initializePlay(videoPath: tiktok.data!.play.toString());
        return Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black,
                child: FlickVideoPlayer(flickManager: flickManager)
                
                ),
            Positioned(
                top: 400.h,
                left: 310.w,
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundImage:
                      NetworkImage(tiktok.data!.author!.avatar.toString()),
                )
                
                ),
            Positioned(
                top: 444.h,
                left: 328.w,
                child: CircleAvatar(
                  radius: 10.r,
                  backgroundColor: Color.fromARGB(255, 3, 238, 255),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 15.sp,
                    ),
                  ),
                )),
            Positioned(
                top: 480.h,
                left: 320.w,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isclicked = !isclicked;
                      });
                    },
                    child: isclicked
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                            size: 40.sp,
                          )
                        : Icon(
                            Icons.favorite_rounded,
                            color: Colors.white,
                            size: 40.sp,
                          ))),
            Positioned(
                top: 60.h,
                left: 12.w,
                child:
                GestureDetector(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_)=>Vidioscreen())),
                  child: Container(
                    
                    height: 45.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(55, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(color: Colors.white)
                        ),
                        child: Row(
                          children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.search,color: Colors.black,size: 25.sp,),
                          )
                          ],
                        ),
                  ),
                )
                
                 ),
            Positioned(
                top: 535.h,
                left: 320.w,
                child: Image.asset(
                  'assets/img1.png',
                  height: 35.h,
                  width: 35.w,
                )),
            Positioned(
                top: 580.h,
                left: 320.w,
                child: Image.asset(
                  'assets/img2.png',
                  height: 40.h,
                  width: 40.w,
                )),
            Positioned(
                top: 635.h,
                left: 313.w,
                child: Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Image.asset(
                      'assets/img3.png',
                      height: 30.h,
                      width: 30.w,
                    )))),
            Positioned(
                top: 650.h,
                left: 20.w,
                child: Text('@Hola',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ))),
            Positioned(
                top: 685.h,
                left: 20.w,
                child: Text('#baile #musica #2022 #estilo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ))),
          ],
        );
      } else {
        return SizedBox();
      }
    }));
  }
}

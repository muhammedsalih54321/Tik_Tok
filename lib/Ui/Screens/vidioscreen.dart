import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tik_tok/Bloc/Vidios/vidios_bloc.dart';
import 'package:tik_tok/Repositry/Model/Vidios_model.dart';
import 'package:video_player/video_player.dart';

class Vidioscreen extends StatefulWidget {
  const Vidioscreen({super.key});

  @override
  State<Vidioscreen> createState() => _VidioscreenState();
}

class _VidioscreenState extends State<Vidioscreen> {
  late VideoModel vidios;
  bool isclicked = false;
  late VideoPlayerController videoController;
  late FlickManager flickManager;
  Duration? videoDuration;
  final controller = PageController();
  final controller2 = TextEditingController();
  String errorMessage = ''; 
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            child: Container(
              height: 45.h,
              width: 350.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(55, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.white)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                            errorMessage = ''; 
                            
                          });
                
                    },
                    controller: controller2,
                    onFieldSubmitted: (value) {
                      BlocProvider.of<VidiosBloc>(context)
                          .add(fetchvideoevent(name: controller2.text));
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  )),
            ),
          ),
        ),
        body: PageView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return BlocBuilder<VidiosBloc, VidiosState>(
              builder: (context, state) {
                if (state is Vidiosblocloading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is Vidiosblocerror) {
                  return RefreshIndicator(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .9,
                        child: const Center(
                            child: Text('Oops something went wrong')),
                      ),
                    ),
                    onRefresh: () async {
                      return BlocProvider.of<VidiosBloc>(context)
                          .add(fetchvideoevent(name: ''));
                    },
                  );
                }
                if (state is Vidiosblocloaded) {
                  vidios = BlocProvider.of<VidiosBloc>(context).videoModel;
                  initializePlay(
                      videoPath: vidios.data!.videos![index].play.toString());
                  return 
                  
                     controller2.text.isNotEmpty?Stack(
                    children: [
                   
                      Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.black,
                          child: FlickVideoPlayer(flickManager: flickManager)),
                    
                      Positioned(
                          top: 300.h,
                          left: 310.w,
                          child: CircleAvatar(
                            radius: 28.r,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(vidios
                                .data!.videos![index].author!.avatar
                                .toString()),
                          )),
                      Positioned(
                          top: 344.h,
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
                          top: 380.h,
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
                          top: 435.h,
                          left: 320.w,
                          child: Image.asset(
                            'assets/img1.png',
                            height: 35.h,
                            width: 35.w,
                          )),
                      Positioned(
                          top: 480.h,
                          left: 320.w,
                          child: Image.asset(
                            'assets/img2.png',
                            height: 40.h,
                            width: 40.w,
                          )),
                      Positioned(
                          top: 560.h,
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
                          top: 580.h,
                          left: 20.w,
                          child: Text(vidios.data!.videos![index].author!.nickname.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ))),
                      Positioned(
                          top: 615.h,
                          left: 20.w,
                          child: SizedBox(
                            height: 40.h,
                            width: 360.w,
                            child: Text(vidios.data!.videos![index].title.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                )),
                          )),
                    ],
                  ):Container(
                    child: Center(
                              child: Text(
                                errorMessage.isEmpty
                                    ? 'Please enter a text to process.'
                                    : errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                  );
                } else {
                  return SizedBox();
                }
              },
            );
          },
        ));
  }
}

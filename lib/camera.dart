
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Camera extends StatefulWidget {
  // const Camera({ Key? key }) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraImage cameraImage;
  CameraController cameraController;
  String output = '';

  @override
  void initState(){
    super.initState();
    loadCamera();
  }
  

  // Funct access camera
  loadCamera(){
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value){
      if(!mounted){
        return;
      }else{
        setState(() {
          cameraController.startImageStream((imageStream){
            cameraImage = imageStream;
          });
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera'),),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height*0.7,
            width: MediaQuery.of(context).size.width,
            child: !cameraController.value.isInitialized?
            Container():
            AspectRatio(aspectRatio: cameraController.value.aspectRatio,
            child: CameraPreview(cameraController),),
          ),)
        ],
      )
    );
  }
}
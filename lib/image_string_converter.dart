import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class ImageToString extends  StatefulWidget {
  @override
  State<ImageToString> createState() => _ImageToStringState();
}

class _ImageToStringState extends State<ImageToString> {

  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  File? newFile;
  Uint8List? decodedbytes;
  String? baseString;

  @override
  Widget build(BuildContext context) {
   // openImage();
    return Scaffold(
        appBar: AppBar(
          title: Text("Image to base64 Encoding"),
          backgroundColor: Colors.redAccent,
        ),

        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
                children: [

                          Container(

                            child:decodedbytes!=null?
                              Image.memory(
                                  decodedbytes!,
                                  fit: BoxFit.fill
                              ):

                              Text('No data found data'),

                              // imagepath != ""?Image.file(File(imagepath)):
                  //newFile != null ?Image.file(newFile!):
                  // Container(
                  //   child: Text("No Image selected."),
                  // ),

                  //open button ---------------
                  ),

                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          openImage();
                        });
                      },
                      child: Text("Open Image")
                  ),
                ],
            ),
          ),
        )

    );
  }

 void  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      if(pickedFile != null){
        imagepath = pickedFile.path;
        print('This is image path: $imagepath');

        File imagefile = File(imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytesSync(); //convert to bytes
        String base64string = base64.encode(imagebytes); //convert bytes to base64 string
        print(base64string);
        baseString=base64string;

        decodedbytes = base64.decode(base64string);
        print('Decoded bytes $decodedbytes');
        newFile = File(decodedbytes as String);

        setState(() {

        });










      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file.");
    }
  }




}

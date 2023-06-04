import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget{
    @override
  Widget build(BuildContext context){
      return Material(

        child:
          Column(
            children: [
              Container(
                height: 100,
                width: 30,
              ),
              ElevatedButton(onPressed: null,
                  child: Text("Generate password",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: GoogleFonts.lato().fontFamily),),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(400,60)),



              ),
              Container(
                height: 100,
                width: 30,
              ),
              ElevatedButton(onPressed: null,
                child: Text("Check password",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: GoogleFonts.lato().fontFamily),),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(400,60)),



              )
            ],
          )
      );
    }
}
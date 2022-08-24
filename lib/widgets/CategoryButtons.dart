import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget{
  int? currentTab ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
          OutlinedButton(
            onPressed: (){
              //-------------------------------------ALL-----------------------
              currentTab = 0;
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
            ),
            child: const Text("All",style: TextStyle( color:Colors.green ,),),
          ),
            SizedBox(width: 25,),
            OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),)),
              ),
              child: const Text("Plants",style: TextStyle(color: Colors.lightGreen),),
            ),
            SizedBox(width: 25,),
            OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
              ),
              child: const Text("Seeds",style: TextStyle(color: Colors.lightGreen),),
            ),
            SizedBox(width:25,),
            OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
              ),
              child: const Text("Tools",style: TextStyle(color: Colors.lightGreen),),
            ),
        ],),
      ),
    );
  }

}
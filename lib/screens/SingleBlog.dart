import 'package:flutter/material.dart';

class SingleBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Svgs/plant2.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Column(children: const<Widget>[
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "5 Simple Tips to treat plants",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(30,0,0,30),
                child: Text(
                  "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(30,0,0,30),
                child: Text(
                  "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(30,0,0,30),
                child: Text(
                  "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(30,0,0,30),
                child: Text(
                  "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30,10,20,30),
                child: Text(
                  "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                ),
              ),
            ],),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(Blogs());
}

class Blogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlogsScreen(),
    );
  }
}

class BlogsScreen extends StatefulWidget {
  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  Map<int, bool> countToValue = <int, bool>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.eco_rounded, color: Colors.black),
            onPressed: () => Navigator.pushNamed(
                context, 'quiz'),
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Blogs',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 530,
              child: ListView(
                children: [
                  for (int count in List.generate(10, (index) => index + 1))
                    GestureDetector(
                      onTap: (){
                        print('blog is clicked');
                        Navigator.pushNamed(
                            context, 'singleblog');
                        //-----------------------------------Details Screen-----------------
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 1,
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 130,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/Svgs/plant2.png"),
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:const  <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0,0,0,10),
                                    child: Text(
                                      "2 days ago",
                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
                                    ),
                                  ),
                                  Text(
                                    "5 Tips to treat plants",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "leaf,in botany, any usually\nleaf,in botany, any usually ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

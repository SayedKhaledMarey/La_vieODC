import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({Key? key}) : super(key: key);

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(top: 40),
              child: const Expanded(
                child: Center(
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 7, right: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: Container(
                                width: 50,
                                height: 50,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/147/147142.png",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.refresh),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 5, top: 10),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: 'Sayed khaled',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                        " GET notification from APi"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,

                      padding: EdgeInsets.only(left: 7, right: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: Container(
                                width: 50,
                                height: 50,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/147/147142.png",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.refresh),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //height: 110,
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: "Sayed marey",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            " GET notification from APi"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 7, right: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  child: ClipOval(
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://cdn-icons-png.flaticon.com/512/147/147142.png",
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.refresh),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: 'sayed khaled',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                              " GET notification from APi"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

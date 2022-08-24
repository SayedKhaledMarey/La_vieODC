import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:odc_mobile_app_task/widgets/CategoryButtons.dart';

class ListOfLavie extends StatelessWidget {
  final List<Map> myPlant =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 35, left: 25, right: 25),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 60,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Svgs/laviephoto.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                            prefixIcon: Container(
                              padding: EdgeInsets.all(15),
                              child: const Icon(Iconsax.search_status),
                              width: 18,
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, 'mycart');
                    },
                    child: Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Iconsax.shopping_cart,
                          color: Colors.white,
                        ),
                        width: 50),
                  ),
                ],
              ),
              Container(
                color: Colors.lightGreen,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: CategoryButtons(),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  //color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: myPlant.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Container(
                                  width: 82,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/Svgs/plant.jpg"),
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                                  child: Text(
                                    "Plant Name",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 96, 0),
                                  child: Text(
                                    "200 EGP",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: ElevatedButton(
                                    child: const Text('Add To Cart'),
                                    onPressed: () {
                                      //----------------------------------------------------------------
                                    },
                                  ),
                                ),
                                const BottomAppBar(),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

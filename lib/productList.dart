import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui_design/data.dart';
import 'package:ui_design/productPage.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        HorizontalList(),
        ...data.map(
          (item) => Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: ProductList(
              item: item,
              isVertical: true,
            ),
          ),
        )
      ],
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            // aspectRatio: ,
            enlargeCenterPage: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            autoPlayCurve: Curves.easeInCubic,
            height: 180,
          ),
          items: data
              .map((item) => Container(
                  // height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white10,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 15),
                    child: ProductList(
                      item: item,
                      isVertical: false,
                    ),
                  )))
              .toList(),
        ),
      ],
    ));
  }
}

class ProductList extends StatelessWidget {
  final item;
  final bool isVertical;
  const ProductList({Key key, @required this.item, @required this.isVertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int randomint = Random().nextInt(1000);
    double rating = Random().nextDouble() * 5;
    int ratingCount = Random().nextInt(1000);
    bool isLimmitedTime = Random().nextBool();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(
                      item: item,
                      isVertical: isVertical,
                      rating: rating,
                      ratingcount: ratingCount,
                      isLimmitedTime: isLimmitedTime,
                    )));
      },
      child: Container(
        color: Colors.white70,
        height: 150,
        width: 20,
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Hero(
                  tag: item.toString() + isVertical.toString(),
                  child: Image.network(
                    item["image"],
                    width: 100,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.fromLTRB(10, 9, 10, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["title"].toString(),
                        maxLines: 3,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemSize: 22,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          Text(ratingCount.toString()),
                        ],
                      ),
                      SizedBox(height: 5),
                      isLimmitedTime
                          ? Container(
                              color: Colors.red,
                              height: 18,
                              width: 140,
                              child: Text(
                                "  LIMITED TIME DEAL",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Container(),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text("\$ ${item["price"]}"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("\$ "),
                          Text(
                            ((item["price"]) + 150).toString(),
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text("Free Delivery by Amazone"),
                    ],
                  ),
                  //child: Text(data[index].toString()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class VerticalList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
//       child: Container(
//         color: Colors.white70,
//         height: 150,
//         width: 20,
//         child: Center(
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Image.network(
//                   data[0]["image"],
//                   width: 100,
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   color: Colors.amber,
//                   //child: Text(data[index].toString()),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui_design/appBar.dart';

class ProductPage extends StatelessWidget {
  final item;
  final int ratingcount;
  final bool isLimmitedTime;
  final bool isVertical;
  final double rating;
  const ProductPage(
      {Key key,
      @required this.item,
      @required this.isVertical,
      @required this.ratingcount,
      @required this.rating,
      @required this.isLimmitedTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Bar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("category : ${item["category"]}"),
                      Expanded(child: Container()),
                      RatingBar.builder(
                        initialRating: Random().nextDouble() * 5,
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
                      SizedBox(width: 5),
                      Text(ratingcount.toString())
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    item["title"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item["description"],
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 300,
                    color: Colors.amber,
                    child: Hero(
                      tag: item.toString() + isVertical.toString(),
                      child: Image(image: NetworkImage(item["image"])),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.favorite_border), onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.share_outlined), onPressed: () {})
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("   \$ "),
                      Text(
                        item["price"].toString(),
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("   \$ "),
                      Text(
                        (item["price"] + 150).toString(),
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        "   Save \$ 150",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  isLimmitedTime
                      ? Container(
                          color: Colors.red,
                          height: 40,
                          padding: EdgeInsets.fromLTRB(10, 10, 100, 10),
                          child: Text(
                            "  Limited time deal",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

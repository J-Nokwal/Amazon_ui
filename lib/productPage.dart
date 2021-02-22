import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui_design/appBar.dart';
import 'package:ui_design/productList.dart';

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
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("category : ${item["category"]}"),
                      Expanded(child: Container()),
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
                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    color: Colors.white70,
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isLimmitedTime
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.red),
                              height: 18,
                              width: 140,
                              child: Text(
                                "  LIMITED TIME DEAL",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Container(),
                      Text("FREE delivery"),
                      // HorizontalList(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 0.5),
                          color: Colors.amber[700]),
                      child: Center(child: Text("Buy Now")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 0.5),
                          color: Colors.amber[500]),
                      child: Center(child: Text("Add To Cart")),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "In Stock.",
                    style: TextStyle(color: Colors.green[600]),
                  ),
                  HorizontalList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

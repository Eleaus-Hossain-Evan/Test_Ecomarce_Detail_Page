
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pattern_bloc/bloc/product_bloc.dart';
import 'package:pattern_bloc/bloc/product_event.dart';
import 'package:pattern_bloc/bloc/product_state.dart';
import 'package:pattern_bloc/data/model/model.dart';

import "package:velocity_x/velocity_x.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductBloc? productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc!.add(FetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
          tooltip: 'Go Back',
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.share_outlined),
              color: Colors.black,
              tooltip: 'Share on Social Media',
            ),
          ),
        ],
      ),
      body: Container(
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductErrorState) {
              final snackBar =
                  new SnackBar(content: new Text(state.message.toString()));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitialState) {
                return buildLoading();
              } else if (state is ProductLoadinglState) {
                return buildLoading();
              } else if (state is ProductLoadedState) {
                return buildProducts(state.product);
              } else if (state is ProductErrorState) {
                return buildErrorUi(state.message);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String? message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message!,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildProducts(ProductModel? product) {
    return Container(
      color: Color(0xffE5E5E5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 374.88,
              height: 240.74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: ImageSlideshow(
                  width: double.infinity,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {
                    print('>>>> Page: $value');
                  },
                  autoPlayInterval: 3000,
                  children: [
                    Image.network("${product!.image}", fit: BoxFit.cover),
                    Image.network("${product.bannerImage}", fit: BoxFit.cover),
                    Image.network("${product.brand!.image}", fit: BoxFit.cover),
                  ]),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "${product.productName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Brand: ${product.brand!.name}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "BDT ${product.productPrice}",
                                  style: TextStyle(
                                    color: Color(0xffdd3935),
                                    fontSize: 15,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  " BDT ${00.00}",
                                  style: TextStyle(
                                    color: Color(0xff616161),
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 63.33,
                                  height: 23.66,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffdd3935),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "0% Off",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                rating:
                                    double.parse("${product.productReviewAvg}"),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Select Color",
                          style: TextStyle(
                            color: Color(0xff242424),
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Black',
                                style: TextStyle(
                                  color: Color(0xff242424),
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size.fromHeight(32),
                                  side: BorderSide(color: Color(0xff242424))),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Yellow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xffF2C94C),
                                fixedSize: Size.fromHeight(32),
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Red',
                                style: TextStyle(
                                  color: Color(0xffDD3935),
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size.fromHeight(32),
                                  side: BorderSide(color: Color(0xffDD3935))),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Blue',
                                style: TextStyle(
                                  color: Color(0xff2F80ED),
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size.fromHeight(32),
                                  side: BorderSide(color: Color(0xff2F80ED))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Delivery Information",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff242424),
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.truck,
                    size: 12,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sent from Dhaka, will arrive in 7/10 workdays",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Payment Method (Supported)",
                style: TextStyle(
                  color: Color(0xff242424),
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 321.6332702636719,
                height: 51.035858154296875,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0.569244384765625,
                      left: 0,
                      child: Container(
                        width: 68.28829956054688,
                        height: 26,
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 24.288299560546875,
                            child: Text(
                              'Bkash',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.600000023841858),
                            ),
                          ),
                          Positioned(
                            top: 5.232818603515625,
                            left: 0,
                            child: Container(
                              width: 16,
                              height: 15.534343719482422,
                              child: Stack(children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: 15.534343719482422,
                                    height: 15.534343719482422,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff27AE60),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(15.534343719482422,
                                              15.534343719482422)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0.46561673283576965,
                                  child: Container(
                                    width: 15.534343719482422,
                                    height: 15.534343719482422,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Image.asset(
                                          'assets/images/group.png',
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 84.82461547851562,
                      child: Container(
                        width: 236.80865478515625,
                        height: 26,
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 24.80865478515625,
                            child: Text(
                              'Cash on Delivery not available',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.600000023841858),
                            ),
                          ),
                          Positioned(
                            top: 4.1078338623046875,
                            left: 0,
                            child: Container(
                              width: 16,
                              height: 15.534343719482422,
                              child: Stack(children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: 15.534343719482422,
                                    height: 15.534343719482422,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffFF0600),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(15.534343719482422,
                                            15.534343719482422),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0.46561673283576965,
                                  child: Container(
                                    width: 15.534343719482422,
                                    height: 15.534343719482422,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Image.asset(
                                          'assets/images/group1.png',
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      top: 25.035858154296875,
                      left: 0,
                      child: Container(
                        width: 68.02157592773438,
                        height: 26,
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 24.021575927734375,
                            child: Text(
                              'Bkash',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.600000023841858),
                            ),
                          ),
                          Positioned(
                            top: 5.232818603515625,
                            left: 0,
                            child: Container(
                              width: 16,
                              height: 15.534343719482422,
                              child: Stack(children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: 15.534343719482422,
                                    height: 15.534343719482422,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff27AE60),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(15.534343719482422,
                                              15.534343719482422)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0.46561673283576965,
                                  child: Container(
                                    width: 15.534343719482422,
                                    height: 15.534343719482422,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Image.asset(
                                          'assets/images/group.png',
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      top: 23.755218505859375,
                      left: 84.98037719726562,
                      child: Container(
                        width: 67.72427368164062,
                        height: 26,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 23.724273681640625,
                              child: Text(
                                'Bkash',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.600000023841858),
                              ),
                            ),
                            Positioned(
                              top: 5.232818603515625,
                              left: 0,
                              child: Container(
                                width: 16,
                                height: 15.534343719482422,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        width: 15.534343719482422,
                                        height: 15.534343719482422,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff27AE60),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(
                                                  15.534343719482422,
                                                  15.534343719482422)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0.46561673283576965,
                                      child: Container(
                                        width: 15.534343719482422,
                                        height: 15.534343719482422,
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Image.asset(
                                              'assets/images/group.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 23.9691162109375,
                      left: 165.12039184570312,
                      child: Container(
                        width: 68.32925415039062,
                        height: 26,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 24.329254150390625,
                              child: Text(
                                'Bkash',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.600000023841858),
                              ),
                            ),
                            Positioned(
                              top: 4.000030517578125,
                              left: 0,
                              child: Container(
                                width: 16,
                                height: 15.534343719482422,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        width: 15.534343719482422,
                                        height: 15.534343719482422,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff27AE60),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(
                                                  15.534343719482422,
                                                  15.534343719482422)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0.46561673283576965,
                                      child: Container(
                                        width: 15.534343719482422,
                                        height: 15.534343719482422,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Image.asset(
                                                'assets/images/group.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                color: Color(0xffE5E5E5),
                padding: EdgeInsets.only(
                  left: 6.0,
                  right: 6.0,
                ),
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Text(
                    "Description",
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: VxDiscList([
                        "Soft-touch Jersy",
                        "Lose Fabric",
                        "High Sensitive",
                        "Soft-touch Jersy",
                        "Lose Fabric",
                        "High Sensitive",
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                color: Color(0xffE5E5E5),
                padding: EdgeInsets.only(
                  left: 6.0,
                  right: 6.0,
                  bottom: 10,
                ),
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Text(
                    "Additional Information",
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: VxDiscList([
                            'Size:  L, M, S, XL',
                            'Colors: Black, Blue, Red',
                          ]),
                        )
                      ],
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

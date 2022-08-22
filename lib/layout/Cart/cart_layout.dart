import 'package:flutter/material.dart';
import 'package:la_vie/shared/my_widget.dart';

import '../../shared/reusables/reusables_appbar.dart';

class CartLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image(
                image: AssetImage('images/homeBackground.jpeg'),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              Column(
                children: [
                  buildAppbar(context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image:
                                                AssetImage('images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Text('300 EGP'),
                                          Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image:
                                                AssetImage('images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Text('300 EGP'),
                                          Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image:
                                                AssetImage('images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Text('300 EGP'),
                                          Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image:
                                                AssetImage('images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Text('300 EGP'),
                                          Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              flex: 1,
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Sub Total',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('1200 EGP'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Shipping',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('0 EGP'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        myDivider(),
                                        SizedBox(
                                          height: 35,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '1200 EGP',
                                              style: TextStyle(
                                                  color: Color(0xff1ABC00),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 35,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Color(0xff1ABC00),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xff1abc00),
                                              ),
                                              child: Text(
                                                'Checkout',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),

                      // Column(children: [
                      //   SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                      //   Image(
                      //     image: AssetImage('images/cart.png'),
                      //     width: 120,
                      //   ),
                      //   SizedBox(height: 10,),
                      //   Text('Your Cart is Empty',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold,
                      //     ),),
                      //   Padding(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         color: Color(0xff1ABC00),
                      //         borderRadius:
                      //         BorderRadius.all(Radius.circular(10)),
                      //       ),
                      //       child: TextButton(
                      //           onPressed: () {},
                      //           style: TextButton.styleFrom(
                      //             fixedSize: Size(172, 40),
                      //             backgroundColor: Color(0xff1abc00),
                      //           ),
                      //           child: Text(
                      //             'Keep Shopping',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w300,
                      //             ),
                      //           )),
                      //     ),
                      //   )
                      // ],)
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

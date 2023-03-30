import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keeptruckin/constants.dart';
import 'package:keeptruckin/live_location_screen.dart';
import 'package:keeptruckin/orders_custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'live_location_screen.dart';
// import 'orders_custom_card.dart';

class OrdersHomeScreen extends StatefulWidget {
  const OrdersHomeScreen({Key? key}) : super(key: key);

  @override
  State<OrdersHomeScreen> createState() => _OrdersHomeScreenState();
}

class _OrdersHomeScreenState extends State<OrdersHomeScreen> {
  final CollectionReference ordersCollectionReference =
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders');

  TextEditingController receiverName = TextEditingController();
  TextEditingController receiverPhoneNumber = TextEditingController();
  TextEditingController orderItems = TextEditingController();
  TextEditingController numberOfContainers = TextEditingController();
  TextEditingController orderDropLocation = TextEditingController();
  TextEditingController deliveryVehicleNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders / Deliveries'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddNewDeliveryDialog();
          },
          child: const Icon(Icons.add)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: ordersCollectionReference
                  .orderBy('timestamp', descending: true)
                  .snapshots(), //build connection
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    streamSnapshot.data!.docs.length, //number of rows
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      final String vehicleID =
                      documentSnapshot['delivery_vehicle_ID'];
                      final String dropLocation =
                      documentSnapshot['drop_location'];
                      final String numberOfContainer =
                      documentSnapshot['number_of_container'];
                      final String orderItems = documentSnapshot['order_items'];
                      final String receiverContactNumber =
                      documentSnapshot['receiver_contact_number'];
                      final String receiverName =
                      documentSnapshot['receiver_name'];
                      // final String salary = documentSnapshot['salary'];

                      return Column(
                        children: [
                          OrdersCustomCard(
                            documentSnapshot: documentSnapshot,
                            receiverName: receiverName,
                            receiverContactNumber: receiverContactNumber,
                            dropLocation: dropLocation,
                            onTapCall: () async {
                              Uri phoneno =
                              Uri.parse('tel:+91${receiverPhoneNumber}');
                              if (await launchUrl(phoneno)) {
                                //dialer opened
                              } else {
                                //dailer is not opened
                              }
                            },
                            onTapLiveLocation: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LiveLocationScreen()));
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showAddNewDeliveryDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            // height: MediaQuery.of(context).size.height * 0.7,
            // margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
            decoration: boxDecoration(
              borderradius: 15,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Delivery',
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Add Delivery Details',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // style: const TextStyle(fontSize: 16),
                        textCapitalization: TextCapitalization.words,
                        controller: deliveryVehicleNumber,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            border: outlineEnabledBorder(),
                            labelText: "Delivery Vehicle ID",
                            hintText: "Enter Delivery Vehicle ID"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // style: const TextStyle(fontSize: 16),
                        textCapitalization: TextCapitalization.words,
                        controller: receiverName,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            border: outlineEnabledBorder(),
                            labelText: "Receiver's Name",
                            hintText: "Enter Receiver's Name"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        // style: const TextStyle(fontSize: 16),
                        textCapitalization: TextCapitalization.words,
                        controller: receiverPhoneNumber,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            border: outlineEnabledBorder(),
                            labelText: "Receiver's Contact Number",
                            hintText: "+91"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // style: const TextStyle(fontSize: 16),
                        textCapitalization: TextCapitalization.words,
                        controller: orderDropLocation,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            border: outlineEnabledBorder(),
                            labelText: "Drop Location",
                            hintText: "Enter Drop Location"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // style: const TextStyle(fontSize: 16),
                        textCapitalization: TextCapitalization.words,
                        controller: orderItems,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            border: outlineEnabledBorder(),
                            labelText: "Order Items",
                            hintText: "Enter Order Items"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // style: const TextStyle(fontSize: 16),
                        textCapitalization: TextCapitalization.words,
                        controller: numberOfContainers,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            border: outlineEnabledBorder(),
                            labelText: "Number of Containers",
                            hintText: "Enter Number of Containers"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: FloatingActionButton.extended(
                              onPressed: () async {
                                await ordersCollectionReference.add({
                                  'delivery_vehicle_ID':
                                  deliveryVehicleNumber.text,
                                  'receiver_name': receiverName.text,
                                  'receiver_contact_number':
                                  receiverPhoneNumber.text,
                                  'drop_location': orderDropLocation.text,
                                  'order_items': orderItems.text,
                                  'number_of_container':
                                  numberOfContainers.text,
                                  'timestamp': FieldValue.serverTimestamp(),
                                });

                                Navigator.pop(context);

                                receiverName.text = '';
                                receiverPhoneNumber.text = '';
                                orderDropLocation.text = '';
                                orderItems.text = '';
                                numberOfContainers.text = '';
                                deliveryVehicleNumber.text = '';
                              },
                              icon: const Icon(Icons.done),
                              label: Text('Save Delivery'))),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

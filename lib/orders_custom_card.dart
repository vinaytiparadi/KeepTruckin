import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keeptruckin/constants.dart';

class OrdersCustomCard extends StatefulWidget {
  const OrdersCustomCard({Key? key, required this.documentSnapshot, required this.receiverName, required this.receiverContactNumber, required this.dropLocation, required this.onTapCall, required this.onTapLiveLocation}) : super(key: key);

  final DocumentSnapshot documentSnapshot;
  final String receiverName;
  final String receiverContactNumber;
  final String dropLocation;
  final VoidCallback onTapCall;
  final VoidCallback onTapLiveLocation;


  @override
  State<OrdersCustomCard> createState() => _OrdersCustomCardState();
}

class _OrdersCustomCardState extends State<OrdersCustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: boxDecoration(
          color: Colors.orangeAccent.withOpacity(0.18),
          borderradius: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent.withAlpha(95),
                  radius: 45,
                  child: CircleAvatar(
                    radius: 39,
                    backgroundImage: AssetImage('assets/truck.png'),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Receiver's Name: ${widget.receiverName}", style: bodyText1Bold(),),
                      const SizedBox(height: 5,),
                      Text("Contact No: +91 ${widget.receiverContactNumber}"),
                      const SizedBox(height: 5,),
                      Text("Drop Location: ${widget.dropLocation}"),
                      // const SizedBox(height: 10,),
                      // Text("Payment: Due"),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                    onPressed: widget.onTapCall,
                    icon: Icon(Icons.call),
                    label: Text('Call')),
                FloatingActionButton.extended(
                    onPressed: widget.onTapLiveLocation,
                    icon: Icon(Icons.location_on_outlined),
                    label: Text('Live Location'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

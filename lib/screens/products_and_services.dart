import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAndServices extends StatelessWidget{
final productServicesList=[
  'Corporate Cover',
  'Individual Cover',
  'Family Cover',
  'Antenatal Cover',
  'Antenatal & Delivery Package',
  'Short-term Cover',
  'Elderly Cover',
  'Hypertension Package',
  'Hypertension & Diabetes Package',
  'School kids Cover',
  'Ambulance Cover',
  'Medical Check-up Package',
  'Third Party Administration Management',
  'Group Vaccination Package',
  'Medical Sensitization/Talks'

];
static final partImage = Image.asset('assets/images/CASE-LOGO-full.png');
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     bottomSheet: Container(
       width: double.infinity,
       color: Colors.green,
       child: Text('Products can be tailored to individual needs.\n Kindly submit your contacts on the quotation request'
       ,textAlign: TextAlign.center,
         style: TextStyle(color: Colors.white),
       ),
     ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: 40 ,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: partImage),
              ],
            ),
            Text('PRODUCTS AND SERVICES',
            style: TextStyle(color: Colors.lightGreen[400]),),
          ],
        ),),
      body: ListView.builder(
        itemCount: productServicesList.length,

          itemBuilder: (context,index){

                return ListTile(
                  leading: Icon(Icons.arrow_drop_up),
                  title:Text(
                    productServicesList[index]
                ),);
          }),
    );
  }

}
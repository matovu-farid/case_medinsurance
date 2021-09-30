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
static final partImage = Image.asset('assets/icon/icon.png');
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
        
        title: Text('PRODUCTS AND SERVICES',
        
        style: TextStyle(fontSize: 16),
        
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
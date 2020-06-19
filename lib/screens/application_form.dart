import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/faridFormField.dart';
import 'package:flutter/material.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  String inputText = '';




  final formList1 = <FaridFormField>[
    FaridFormField(
      text: 'Company',

    ),
    FaridFormField(
      text: "Main Member's Name",

    ),
    FaridFormField(
      text: 'PhoneNo',

    ),
    FaridFormField(
      text: 'DateOfBirth',

    ),
    FaridFormField(
      text: 'Gender',
      isRadioBtton: true,

      radioList: [
        {'Male': 0},
        {'Female': 1}
      ],
    ),
    FaridFormField(
      text: 'Email',

    ),
    FaridFormField(
      text: 'Phone No',
    ),
    FaridFormField(
      text: 'Address/Location',
    ),
    FaridFormField(

      text: 'Type of Business',
      hint: 'Select Type of business',
      isDropdown: true,
      dropdownNames: ["cookies", 'monkey', 'hahaha'],
    ),
  ];
  List<Map<String, TextEditingController>> listOfContent = [];
  final tableInfo = <Map<String, String>>[];
  addInfo(){
    for(var field in tableTextFields){
      tableInfo.add({
        field.keys.toList()[0]:field[field.keys.toList()[0]].textGot,
        field.keys.toList()[1]:field[field.keys.toList()[1]].textGot,
        field.keys.toList()[2]:field[field.keys.toList()[2]].textGot,
      });
    }
  }
  final tableTextFields=[
    {
      'Name': FaridFormField(),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(),
    },
    {
      'Name': FaridFormField(),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(),
    },
    {
      'Name': FaridFormField(),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(),
    },
    {
      'Name': FaridFormField(),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(),
    },
    {
      'Name': FaridFormField(),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(),
    },
  ];

  printTableInfo(){
    tableInfo.forEach((row) {
      final keyList= row.keys.toList();
      for(String key in keyList){
        printInfo(row[key]);
      }
    });
  }




  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
//      key: scaffoldKey,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: 40,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.2,
                    child: ProductAndServices.partImage),
              ],
            ),
            Text(
              'APPLICATION FORM',
              style: TextStyle(color: Colors.lightGreen[400]),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: formList1.length,
                  itemBuilder: (context, index) {
//                    listOfContent.add(
//                        {formList1[index].text: formList1[index].controller});
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: formList1[index],
                    );
                  }),
              Center(
                child: Text('Dependants Details:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  columnWidths: {0: FixedColumnWidth(20)},
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    TableRow(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Center(child: Text('Name')),
                        Center(child: Text('Gender')),
                        Center(child: Text('Date of Birth')),
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('1.')),
                        tableTextFields[0]['Name'],
                        tableTextFields[0]['Gender'],
                        tableTextFields[0]['Date of Birth'],
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('2.')),
                        tableTextFields[1]['Name'],
                        tableTextFields[1]['Gender'],
                        tableTextFields[1]['Date of Birth'],
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('3.')),
                        tableTextFields[2]['Name'],
                        tableTextFields[2]['Gender'],
                        tableTextFields[2]['Date of Birth'],
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('4.')),
                        tableTextFields[3]['Name'],
                        tableTextFields[3]['Gender'],
                        tableTextFields[3]['Date of Birth'],
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('5.')),
                        tableTextFields[4]['Name'],
                        tableTextFields[4]['Gender'],
                        tableTextFields[4]['Date of Birth'],
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                  'Information regarding any Pre-existing medical conditions, regular medication,surgical operations:'),
              TextField(),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  addInfo();

                  for (var e in formList1) {
                    printInfo(e);
                  }
                  print('${tableInfo}');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
void printInfo(dynamic e){
  if (e.isDropdown) {
    print('${e.text} : ${e.selectedItem}');
  }
  if (e.textGot.runtimeType == int) {
    int radio = e.textGot as int;
    String gender = (radio == 0) ? 'Male' : 'Female';

    print('${e.text} : $gender');
  }
  if (e.textGot.runtimeType == String && !e.isDropdown)
    print('${e.text} : ${e.textGot}');

}

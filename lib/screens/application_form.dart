import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/faridFormField.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  String inputText = '';
  static final required = RequiredValidator(errorText: 'required');



  final formList1 = [
    FaridFormField(
      text: 'Company',
      validator: required,
    ),
    FaridFormField(
      text: "Main Member's Name",
      description: 'required',

    ),
    FaridFormField(
      text: 'PhoneNo',
      description : 'Phone number',

    ),
    FaridFormField(
      text: 'DateOfBirth',
      isDate:true,

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
      description: 'email',

    ),
    FaridFormField(
      text: 'Phone No',
      description: 'Phone number',
    ),
    FaridFormField(
      text: 'Address/Location',
      description: "required",
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
      'Name': FaridFormField(
        fieldHieght: 45,
      ),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(
        isDate: true,fieldHieght: 45,
      ),
    },
    {
      'Name': FaridFormField(
        fieldHieght: 45,
      ),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(
        isDate: true,fieldHieght: 45,
      ),
    },
    {
      'Name': FaridFormField(
        fieldHieght: 45,
      ),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(isDate: true,fieldHieght: 45,),
    },
    {
      'Name': FaridFormField(

        fieldHieght: 45,
      ),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(isDate: true,fieldHieght: 45,),

    },
    {
      'Name': FaridFormField(
        fieldHieght: 45,
      ),
      'Gender':FaridFormField(
        isDropdown: true,
        dropdownNames: ['Male', 'Female'],
      ),
      'Date of Birth':FaridFormField(isDate: true,fieldHieght: 45,),
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
        backgroundColor: Colors.lightGreen[400],
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: formList1.length,
                    itemBuilder: (context, index) {
//                    listOfContent.add(
//                        {formList1[index].text: formList1[index].controller});
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
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
                    _formKey.currentState.validate();
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
      ),
    );
  }
}
void printInfo(dynamic e){
//  if(e.textGot.runtimeType==Da)
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

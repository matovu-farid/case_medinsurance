import 'package:case_app/bloc/quotation_index.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'corporate_form.dart';
import 'individual_form.dart';

class QuotationRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuotationRequestState();
  }
}

class QuotationRequestState extends State<QuotationRequest> {
//  Iterator<FaridFormField> get iter=> corporateList.iterator;

  var currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      context.read<QuotationIndex>().add(pageController.page!);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quotation Request",
          
        ),
      ),
      bottomNavigationBar: BlocBuilder<QuotationIndex, int>(
        builder: (context, state) {
          return BottomNavigationBar(
              onTap: (index) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 600), curve: Curves.easeInCubic);
              },
              currentIndex: state,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.corporate_fare), label: 'Corporate'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.male), label: 'Individual')
              ]);
        },
      ),
      body: Container(
        child: PageView(
            controller: pageController,
            children: [CorporateForm(), IndividualForm()]),
      ),
    );
  }
}





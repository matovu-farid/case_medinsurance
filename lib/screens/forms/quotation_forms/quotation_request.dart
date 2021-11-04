import 'dart:io';

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
    if (Platform.isIOS) {
      return CupertinoPageScaffold(

        
        navigationBar: CupertinoNavigationBar(middle: Text('Quotation'),),
        child: CupertinoTabScaffold(
          
            tabBar: CupertinoTabBar(items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.corporate_fare), label: 'Corporate'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.male), label: 'Individual')
            ]),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (_)=>(index==0)?CorporateForm():IndividualForm(),
              );
              
            }),
      );
    }
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
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInCubic);
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
      body: _Body(pageController: pageController),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageController,
          children: [CorporateForm(), IndividualForm()]),
    );
  }
}

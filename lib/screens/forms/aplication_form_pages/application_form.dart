import 'package:case_app/bloc/application/application_bloc.dart';
import 'package:case_app/bloc/application_form_index.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/submit_screens/error_screen.dart';
import 'package:case_app/widgets/submit_screens/loading_screen.dart';
import 'package:case_app/widgets/submit_screens/submit_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import 'client_info.dart';
import 'dependants_info.dart';

class ApplicationForm extends StatelessWidget {
  String inputText = '';
  static final required = RequiredValidator(errorText: 'required');

  List<Map<String, TextEditingController>> listOfContent = [];
  final List<Map<String, String?>> tableInfo = <Map<String, String>>[];

  printTableInfo() {
    tableInfo.forEach((row) {
      final keyList = row.keys.toList();
      for (String key in keyList) {
        printInfo(row[key]);
      }
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pageController = PageController();
  late final bloc = getIt<ApplicationBloc>();
  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      context.read<ApplicationIndex>().add(pageController.page!);
    });
    return BlocBuilder<ApplicationBloc, MyFormState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is FormSending) return LoadingScreen();
        if (state is FormSendingFailure) return ErrorScreen(state.text,bloc);
        if (state is FormSent) return SuccessScreen(bloc);
        return Scaffold(
          appBar: ApplicationFormAppBar(context),
          body: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        child: PageView(
                          allowImplicitScrolling: true,
                          controller: pageController,
                          
                          children: [
                            ClientInfo(_formKey, pageController),
                            DependantDetails(_formKey, pageController),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<ApplicationIndex, int>(
                        builder: (context, state) {
                          return PageViewDotIndicator(
                            currentItem: state,
                            count: 2,
                            unselectedColor: Colors.black26,
                            selectedColor: Colors.blue,
                            duration: Duration(milliseconds: 200),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ApplicationFormAppBar extends AppBar {
  final BuildContext context;

  ApplicationFormAppBar(this.context, {
    Key? key,
  }) : super(
            centerTitle: true,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: ProductAndServices.partImage),
                  ],
                ),
                Text(
                  'APPLICATION FORM',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ));
}

void printInfo(dynamic e) {
//  if(e.textGot.runtimeType==Da)
  if (e.isDropdown) {
    print('${e.label} : ${e.selectedItem}');
  }
  if (e.textGot.runtimeType == int) {
    int? radio = e.textGot as int?;
    String gender = (radio == 0) ? 'Male' : 'Female';

    print('${e.label} : $gender');
  }
  if (e.textGot.runtimeType == String && !e.isDropdown)
    print('${e.label} : ${e.textGot}');
}

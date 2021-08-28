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


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final bloc = getIt<ApplicationBloc>();
  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<ApplicationBloc, MyFormState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is FormSending) return LoadingScreen();
        if (state is FormSendingFailure) return ErrorScreen(state.text,bloc);
        if (state is FormSent) return SuccessScreen(bloc);
        return Scaffold(
          appBar: AppBar(centerTitle: true,title: Text('Application Form'),),
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
                          controller: getIt<PageController>(),
                          
                          children: [
                            ClientInfo(_formKey),
                            DependantDetails(_formKey),
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
                            duration: Duration(milliseconds: 2),
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





import 'package:case_app/bloc/application/application_bloc.dart';
import 'package:case_app/bloc/application_form_index.dart';
import 'package:case_app/bloc/claim/claim_bloc.dart';
import 'package:case_app/bloc/feedback/feedback_bloc.dart';
import 'package:case_app/bloc/quotation/quotation_bloc.dart';
import 'package:case_app/bloc/quotation_index.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({Key? key,required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>getIt<ApplicationBloc>()),
      BlocProvider(create: (_)=>getIt<ClaimBloc>()),
      BlocProvider(create: (_)=>getIt<FeedbackBloc>()),
      BlocProvider(create: (_)=>getIt<IndividualQuotationBloc>()),
      BlocProvider(create: (_)=>getIt<CooporateQuotationBloc>()),
      BlocProvider(create: (_)=>getIt<CooporateQuotationBloc>()),
      BlocProvider(create: (_)=>getIt<ApplicationIndex>()),
      BlocProvider(create: (_)=>getIt<QuotationIndex>()),


    ], child: child);
  }
}

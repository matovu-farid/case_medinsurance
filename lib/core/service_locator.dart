import 'package:case_app/bloc/application/application_bloc.dart';
import 'package:case_app/bloc/application/dependant_bloc.dart';
import 'package:case_app/bloc/application_form_index.dart';
import 'package:case_app/bloc/claim/claim_bloc.dart';
import 'package:case_app/bloc/feedback/feedback_bloc.dart';
import 'package:case_app/bloc/quotation/quotation_bloc.dart';
import 'package:case_app/bloc/quotation_index.dart';
import 'package:case_app/data_handlers/savers/application_saver.dart';
import 'package:case_app/data_handlers/savers/claim_saver.dart';
import 'package:case_app/data_handlers/savers/dependant_saver.dart';
import 'package:case_app/data_handlers/savers/feedback_saver.dart';
import 'package:case_app/data_handlers/savers/quotation_saver.dart';
import 'package:case_app/data_handlers/submitters/application_submitter.dart';
import 'package:case_app/data_handlers/submitters/claim_submitter.dart';
import 'package:case_app/data_handlers/submitters/dependant_submitter.dart';
import 'package:case_app/data_handlers/submitters/feedback_submitter.dart';
import 'package:case_app/data_handlers/submitters/quotation_submitter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setup() {
  //feedback
  getIt.registerLazySingleton<FeedbackSaver>(() => FeedbackSaverImpl());
  getIt.registerLazySingleton<FeedbackSubmitter>(() => FeedbackSubmitterImpl());
  getIt.registerLazySingleton(
      () => FeedbackBloc(getIt<FeedbackSaver>(), getIt<FeedbackSubmitter>()));
  //claim
  getIt.registerLazySingleton<ClaimSaver>(() => ClaimSaverImpl());
  getIt.registerLazySingleton<ClaimSubmitter>(() => ClaimSubmitterImpl());
  getIt.registerLazySingleton(
      () => ClaimBloc(getIt<ClaimSaver>(), getIt<ClaimSubmitter>()));
//dependant
  getIt.registerFactory<DependantSaver>(() => DependantSaverImpl());
  getIt.registerLazySingleton<DependantSubmitter>(
      () => DependantSubmitterImpl(getIt<ApplicationBloc>()));
  getIt.registerFactory(() =>
      DependantBloc(getIt<DependantSaver>(), getIt<DependantSubmitter>()));
  //application
  getIt.registerLazySingleton<ApplicationSaver>(() => ApplicationSaverImpl());
  getIt.registerLazySingleton<ApplicationSubmitter>(
      () => ApplicationSubmitterImpl());
  getIt.registerLazySingleton(() => ApplicationBloc(
      getIt<ApplicationSaver>(), getIt<ApplicationSubmitter>()));
  //quotation
  getIt.registerLazySingleton<CooperateQuotationSaverImpl>(
      () => CooperateQuotationSaverImpl());
  getIt.registerLazySingleton<IndividualQuotationSaverImpl>(
      () => IndividualQuotationSaverImpl());
  getIt.registerLazySingleton<QuotationSubmitter>(
      () => QuotationSubmitterImpl());
  getIt.registerLazySingleton(() => CooporateQuotationBloc(
      getIt<CooperateQuotationSaverImpl>(), getIt<QuotationSubmitter>()));
  getIt.registerLazySingleton(() => IndividualQuotationBloc(
      getIt<IndividualQuotationSaverImpl>(), getIt<QuotationSubmitter>()));

//application index
  getIt.registerSingleton( ApplicationIndex());
  //quotation index
  getIt.registerLazySingleton(() => QuotationIndex());

  ///////////////////////////////////////////////////
  //objects
  var pageController = PageController();
  getIt.registerSingleton<PageController>(pageController
    ..addListener(() {
      getIt<ApplicationIndex>().add(pageController.page!);
    }));
  ///////////////////////////////////////////////////
}

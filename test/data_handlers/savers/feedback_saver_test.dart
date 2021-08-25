import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/data_handlers/savers/feedback_saver.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late FeedbackSaver saver;
  setUp(() {
    saver = FeedbackSaverImpl();
  });
  group('should save the data correctly', () {
    //act

    test('save the company name in the feedback', () {
      var company = 'Toyota';
      InputFormEvent event = InputCompany(company);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.company, company);
    });
    test('save the phone number in the feedback', () {
      var number = 'O705222144';
      InputFormEvent event = InputPhoneNumber(number);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.phoneNumber, number);
    });
    test('save the inquiry in the feedback', () {
      var inquiry = 'xxxxxx';
      InputFormEvent event = InputInquiry(inquiry);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.inquiry, inquiry);
    });
    test('save the compliments in the feedback', () {
      var compliments = 'xxxxxxxxx';
      InputFormEvent event = InputCompliments(compliments);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.compliments, compliments);
    });
    test('save the complaints in the feedback', () {
      var complaints = 'xxxxxxx';
      InputFormEvent event = InputComplaints(complaints);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.complaints, complaints);
    });
    test('save the address in the feedback', () {
      var address = 'xxxx';
      InputFormEvent event = InputAddress(address);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.address, address);
    });
    test('save the card number in the feedback', () {
      var number = 'O705222144';
      InputFormEvent event = InputCardNumber(number);
      saver.saveData(event);
      var feedbackInfo = saver.fetchInfo();
      expect(feedbackInfo.cardNumber, number);
    });
  });
}

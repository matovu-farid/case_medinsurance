import 'package:firebasefunctions/firebasefunctions.dart';

class Mail with FirebaseBloc {
  final String subject;
  final String text;

  Mail({this.subject = 'Case Medcare', this.text = '  This is a test'});
  send() async{
    
    var sendMail = firebaseFunctions.httpsCallable('sendMail');
    sendMail({'subject': subject, 'text': text});
  }
}

// import 'package:firebasefunctions/firebasefunctions.dart';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:logging/logging.dart';

class Mail {
  final Map<String, dynamic> data;
  final String methodName;

  static final _logger = Logger('Mail');

  Mail(this.data,this.methodName);
  Future send() async {
    var sendMail = FirebaseFunctions.instance.httpsCallable(methodName);

    await sendMail(data);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationIndex extends Bloc<double, int> {
  ApplicationIndex() : super(0);

  @override
  Stream<int> mapEventToState(double event) async* {
    if (event < 1)
      yield 0;
    else  
      yield 1;
    
  }
}

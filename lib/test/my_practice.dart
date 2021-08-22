void main() {
  var bingo = Bingo.instance;
  bingo.increamentNumber();
  var bongo = Bingo.instance;
  bongo.printNumber();
}


class Bingo {
  int number = 0;
  Bingo._();
  static final instance = Bingo._();
  increamentNumber() {
    number++;
  }

  printNumber() {
    print('The number : $number');
  }
}

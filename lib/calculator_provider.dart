
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorProvider = StateNotifierProvider<CalculatorNotifier, double>((ref){
  return CalculatorNotifier();
});

class CalculatorNotifier extends StateNotifier<double>{
  CalculatorNotifier() : super(0);

  void addNumber(double a, double b){
    state = a + b;
  }
}
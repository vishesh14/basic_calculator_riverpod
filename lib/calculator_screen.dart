import 'package:basic_calculator/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorScreen extends ConsumerStatefulWidget{



const CalculatorScreen({super.key});

  @override
  ConsumerState<CalculatorScreen> createState()  => _CalculatorScreenState();
    
  }


  class _CalculatorScreenState extends ConsumerState<CalculatorScreen>{
      final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();

    @override
    Widget build(BuildContext context){
      final result = ref.watch(calculatorProvider);
      return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _num1Controller,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(labelText: "Enter first number"),
          ),
          SizedBox(height: 10),

          TextField(
            controller: _num2Controller,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(labelText: "Enter first number"),
          ),
           SizedBox(height: 10),
           ElevatedButton(onPressed: (){

            final num1 = double.tryParse(_num1Controller.text)?? 0;
            final num2 = double.tryParse(_num2Controller.text)?? 0;
            ref.read(calculatorProvider.notifier).addNumber(num1, num2);

           }, child: Text("Add")),
           SizedBox(height: 10),
           Text(
            'Result: $result', style: TextStyle(fontSize: 24))
        ],
      ));
    }
  }
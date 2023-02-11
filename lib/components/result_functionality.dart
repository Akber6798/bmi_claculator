import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.heightBrain,this.weightBrain});
  final int? heightBrain;
  final int? weightBrain;

  late double _bmi;


  //Functions for calculation and checking conditions


  //Calculating BMI score
  String calculateBMI(){
     _bmi = weightBrain! / pow(heightBrain!/100, 2);
    return _bmi.toStringAsFixed(1);
  }
 

 //Calculating BMI Result 
  String getResults(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>=18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
 
  //Calculate BMI result Description
  String getInterPretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Try to exercise more. 😐';
    }else if(_bmi>=18.5){
      return 'You have a normal body weight. Good Job! 👍';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more. 😑';
    }

  }
}
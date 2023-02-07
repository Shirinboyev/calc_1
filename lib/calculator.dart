
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';
  String result = '0';
  List<String> buttonList = [
    'C','(',')','/',
    '7','8','9','*',
    '4','5','6','+',
    '1','2','3','-',
    'AC','0','.','=',
      ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
           Flexible(child: resultWidget(),flex: 1,),
           Flexible(child: buttonsWidget(),flex:2)
        ],),
      ));
  }
  Widget resultWidget(){
return Column(
  children: [
  Container(
    padding: const EdgeInsets.all(20),
    alignment: Alignment.centerRight,
    child: Text(
      userInput,
    style: const TextStyle(fontSize: 50,),
    ),
    ),
     Container(
    padding: const EdgeInsets.all(20),
    alignment: Alignment.centerRight,
    child: Text(
      result,
    style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold)
    ),
    )
],);
  }
  Widget buttonsWidget(){
    return GridView.builder(
      itemCount: buttonList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index){
    return button(buttonList[index]);
      }
      
      );

  }
  Widget button(String text){
        return Container(
          margin: EdgeInsets.all(15),
          child: MaterialButton(onPressed: (){
          setState(() {
            handleButtonPress(text);
          });
          },
          color:getColor(text),
          textColor: Colors.white,
          child: Text(text,style: const TextStyle(fontSize: 25),
          ),
          shape: const CircleBorder(),
          
          ),
        );
        
  }
  handleButtonPress(String text){
    if(text =='AC'){
      userInput ="";
      result = '0';
      return;
    }
if(text =='C'){
  userInput = userInput.substring(0,userInput.length -1);
  return;
}

if(text =='='){
  result = calculate();
  if(result.endsWith('.0'));
  result = result.replaceAll(".0", '');
  return;
}

    userInput = userInput +text;
  }
  String calculate(){
  
      var exp = Parser().parse(userInput);
      var evaluation= exp.evaluate(EvaluationType.REAL, ContextModel());
    
    eatch(e){
      return "Error";
    }
      return evaluation.toString();
  }
  getColor(String text){
    if(text =='/' || text =='*' || text =='+' || text =='-' || text =='='|| text =='.'){
      return Colors.orangeAccent;
    }
    if(text =='C' || text =='AC'){
      return Colors.red;
    }if(text =='(' || text ==')'){
      return Colors.blueGrey;
    }
 return Color.fromARGB(255, 46, 41, 41);
  }
}
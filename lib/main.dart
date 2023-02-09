// import 'package:calc_1/calculator.dart';
// import 'package:flutter/material.dart'; 
// void main(){
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget{
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme:  ThemeData(
//         primarySwatch: Colors.blueGrey,
//       ),
//       home:  Calculator());
    
//   }
// }

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  TextEditingController controller=TextEditingController();

Widget exp(String b,[Color colo=Colors.amber,]){
  return ElevatedButton(
     style: ElevatedButton.styleFrom(
        backgroundColor: colo,
        fixedSize: Size(70, 70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70))
        ),
    onPressed: (){
    if(controller.text[controller.text.length - 1] == 'x'){
      controller.text =
       controller.text.substring(0,controller.text.length -1);
    }
    else  if(controller.text[controller.text.length - 1] == '/'){
      controller.text =
       controller.text.substring(0,controller.text.length -1);
    }
    else  if(controller.text[controller.text.length - 1] == '+'){
      controller.text =
       controller.text.substring(0,controller.text.length -1);
    }
    else  if(controller.text[controller.text.length - 1] == '-'){
      controller.text =
       controller.text.substring(0,controller.text.length -1);
    }
    controller.text+=b;
  }, child: Text(b,style: TextStyle(fontSize: 30),));
}
  Widget wid(String a,[Color col=Colors.transparent]){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: col,
        fixedSize: Size(70, 70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70))
        ),
      onPressed: (){
   controller.text+=a;
    }, child: Text(a,style: TextStyle(fontSize: 25),));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(child: 
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: TextField(
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.end,
                
                readOnly: true,
                controller: controller,
                decoration: InputDecoration(),),
            ),
           
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            
                                  ElevatedButton(
                         style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          fixedSize: Size(70, 70),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70))
          ),
                onPressed: (){
                    controller.text = controller.text.substring(0, controller.text.length-controller.text.length);
                  }, child: Text('AC',style: TextStyle(fontSize: 20),)),
           
              wid('%',Colors.transparent),
    
            ElevatedButton(
                  style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          fixedSize: Size(70, 70),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70))
          ),onPressed: (){
    
               controller.text = controller.text.substring(0, controller.text.length-1);
             }, child: Text('C',style: TextStyle(fontSize: 20),)),
              exp('x')
            ],
          ), Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              wid('7'),
              wid('8'),
              wid('9'),
              exp('/'),
              ],
            ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              wid('4'),
              wid('5'),
              wid('6'),
              exp('+')
            ],
          ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              wid('1'),
              wid('2'),
              wid('3'),
              exp('-')
            ],
          ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
      
                    wid('.',Color.fromARGB(255, 48, 48, 48)),
                  wid('0'),
                ElevatedButton(
                 style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          fixedSize: Size(155, 70),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70))
          ),
                onPressed: (){
                  String exp = '+-x/';
                    List<int> ind = [];
                    //amallarni indexini olish
                    for (int i = 0; i < controller.text.length; i++) {
                      if (exp.contains(controller.text[i])) {
                        ind.add(i);
                      }
                    }
                    

                    // raqamlarni olish
                    List<num> numbers = [];
                    int q = 0;
                    for (int i in ind) {
                      numbers.add(num.parse(controller.text.substring(q, i)));
                      q = i + 1;
                    }
                    numbers.add(
                        num.parse(controller.text.substring(ind.last + 1)));
             setState(() {
               
                         String s = controller.text;
                      int ind  = s.indexOf('+');
                      if(ind != -1){
                        String a = s.substring(0,ind);
                        String b = s.substring(ind+1);
                        int ans = int.parse(a)+int.parse(b);
                        controller.text = ans.toString();
                      }
             });
                      setState(() {
                       String s = controller.text;
                      int ind  = s.indexOf('%');
                      if(ind != -1){
                        String a = s.substring(0,ind);
                        String b = s.substring(ind+1);
                        int ans = int.parse(a)%int.parse(b);
                        controller.text = ans.toString();
                      }
                      });
                      setState(() {
                           String s = controller.text;
                      int ind  = s.indexOf('-');
                      if(ind != -1){
                        String a = s.substring(0,ind);
                        String b = s.substring(ind+1);
                        int ans = int.parse(a)-int.parse(b);
                        controller.text = ans.toString();
                      }
                      },
                      ); setState(() {
                           String s = controller.text;
                      int ind  = s.indexOf('x');
                      if(ind != -1){
                        String a = s.substring(0,ind);
                        String b = s.substring(ind+1);
                        int ans = int.parse(a)*int.parse(b);
                        controller.text = ans.toString();
                      }
                      },
                      ); setState(() {
                          
                           String s = controller.text;
                      int ind  = s.indexOf('/');
                      if(ind != -1){
                        String a = s.substring(0,ind);
                        String b = s.substring(ind+1);
                        int ans = int.parse(a)~/int.parse(b);
                        controller.text = ans.toString();
                      }
                      },
                      );setState(() {
                          
                           String s = controller.text;
                      int ind  = s.indexOf('%');
                      if(ind != -1){
                        String a = s.substring(0,ind);
                        String b = s.substring(ind+1);
                        int ans = int.parse(a)%int.parse(b);
                        controller.text = ans.toString();
                      }
                      });
              }, child: Text('=',style: TextStyle(fontSize: 30),),
              
              ),

            ],
          )
          ],),)
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}):super(key:key);

  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText == "CLEAR"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else if(buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/"){
      num1 = double.parse(output);
      operand = buttonText;
       _output = "0";
    }else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already contains a decimals");
        return;
      }else{
        _output = _output + buttonText;
      }
    }else if(buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1+num2).toString();
      }else if(operand == "-"){
        _output = (num1-num2).toString();
      }else if(operand == "x"){
        _output = (num1*num2).toString();
      }else if(operand == "/"){
        _output = (num1/num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else{
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
          output = double.parse(_output).toStringAsFixed(2);
        });
  }
  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
        style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),),
        onPressed: (){
          return buttonPressed(buttonText);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child:new Text(output, style: new TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            
            new Expanded(
            child: new Divider(),
            ),
            new Row(
              children: <Widget>[
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
              ],
            ),
            new Row(
              children: <Widget>[
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("x"),
              ],
            ),
            new Row(
              children: <Widget>[
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
              ],
            ),
            new Row(
              children: <Widget>[
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+"),
              ],
            ),
            new Row(
              children: <Widget>[
                buildButton("CLEAR"),
                buildButton("=")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

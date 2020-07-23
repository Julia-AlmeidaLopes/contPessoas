import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Contador de Pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = "";

  String controlePessoas(){
 if(_counter < 0){
       _text = "Impossível número negativo de pessoas";
      }else if(_counter <= 15){
       _text = "Pode Entrar!!!";
      }else{
        _text = "Lotado";
      }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      controlePessoas();
     
    });
  }
  void _removeCounter() {
    setState(() {
      _counter--;
      controlePessoas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF007b64),
        child: Center(
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/p.png", 
                height: 77,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Quantidade de Pessoas:',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.white
                      ),
                      ),
                      SizedBox(width: 13,),
                    Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ],
                ),
              Text(_text,
              style: TextStyle(fontSize: 21,
              color: Colors.orange,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
              ),
              )
                ],
              ),
              
            ],
          ),
        ),
      ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 19,),
          FloatingActionButton(
            onPressed: _removeCounter,
            tooltip: 'Remove',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

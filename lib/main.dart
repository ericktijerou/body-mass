import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(new App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculadora",
      theme: new ThemeData(
          primarySwatch: Colors.teal
      ),
      home: new First(),
    );
  }
}

class First extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new FirstState();
  }}

class FirstState extends State<First>{

  TextEditingController controllerHeight = new TextEditingController();
  TextEditingController controllerWeight = new TextEditingController();

  double result ;
  Color color = Colors.grey;

  void calculate(){
    if(controllerWeight.text.isNotEmpty && controllerHeight.text.isNotEmpty){
      result = double.parse(controllerWeight.text) / (double.parse(controllerHeight.text) * double.parse(controllerHeight.text));
      setState(() {
        if(result < 18.5){
          color = Colors.red;
        }else if (result < 25){
          color = Colors.green;
        }else{
          color = Colors.deepPurple;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Calculadora"),),
        body: new Material(
          color: Colors.teal[10],
          child:
          new Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Builder(builder: (context) => (
                Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // adding text element
                                new Text(
                                  "Calculadora Índice de Masa Corporal",
                                  style: new TextStyle(fontSize:18.0,
                                    color: const Color(0xFF008080),
                                    fontWeight: FontWeight.bold,),
                                )
                              ]),
                          new Padding(padding: EdgeInsets.all(15.0))
                          ,
                          new Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Adding a row
                                new Row(
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 5.0,
                                    ),
                                    new Padding(padding: EdgeInsets.all(5.0))
                                    ,
                                    new Text(
                                      "Infrapeso",
                                      style: new TextStyle(fontSize:12.0,
                                        fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.all(2.0))
                                ,
                                // Adding a row
                                new Row(
                                    children: <Widget>[
                                      new CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 5.0,
                                      ),
                                      new Padding(padding: EdgeInsets.all(5.0))
                                      ,
                                      new Text(
                                        "Normal",
                                        style: new TextStyle(fontSize:12.0,
                                          fontWeight: FontWeight.normal),
                                      )]),
                                new Padding(padding: EdgeInsets.all(2.0))
                                ,
                                // Adding a row
                                new Row(
                                    children: <Widget>[
                                      new CircleAvatar(
                                        backgroundColor: Colors.deepPurple,
                                        radius: 5.0,
                                      ),
                                      new Padding(padding: EdgeInsets.all(5.0))
                                      , new Text(
                                        "Sobrepeso",
                                        style: new TextStyle(fontSize:12.0,
                                          fontWeight: FontWeight.normal),
                                      )
                                    ])])
                          ,
                          new Padding(padding: EdgeInsets.all(15.0))
                          ,
                          new TextField(
                            decoration: new InputDecoration(
                                hintText: "",
                                icon: new Icon(Icons.accessibility),
                                labelText: "Altura (Mts)"
                            ),
                            keyboardType: TextInputType.number
                            ,
                            controller: controllerHeight,

                          ),
                          new Padding(padding: EdgeInsets.all(25.0)),
                          // Adding TextField to get input from the user
                          new TextField(
                            decoration: new InputDecoration(
                                hintText: "",
                                icon: new Icon(Icons.line_weight),
                                labelText: "Peso (kg)"
                            ),
                            keyboardType: TextInputType.number
                            ,
                            controller: controllerWeight,

                          ),
                          new Padding(padding: EdgeInsets.all(10.0))
                          ,
                          new Icon(Icons.favorite, size: 80.0,color: color,),
                          new Padding(padding: EdgeInsets.all(10.0)),
                          new FlatButton(key:null, onPressed: () => calculate(),
                              color: Colors.teal,
                              padding: EdgeInsets.all(15.0),
                              child: new Text(
                                "Calcular",
                                style: new TextStyle(fontSize:15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Merriweather"),
                              )
                          )
                        ]
                    )
                )
            )),
          )
          ,)

    );
  }

}
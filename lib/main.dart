
import 'package:flutter/material.dart';

void main() {
  runApp(
    MeuWidget2(),
  );
}


class MeuWidget2 extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Checkpoint 01"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Image.asset(
                '../images/sonic.jpg',
          ),

          Text(
            "Seu nome",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: Colors.blue,),
              Icon(Icons.phone, color: Colors.green,),
              Icon(Icons.email, color: Colors.red,),
            ],
          )
        ],

      ),


      drawer: Drawer(


        child: Column(
            children: [


              
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage:  AssetImage('../images/sonic.jpg'),
                ),
                    

                accountName: Text("Wendel Eduardo"),
                accountEmail: Text("wendel@gmail.com"),
              ),

              

               ListTile(
                  leading: Icon(Icons.computer),
                  title: Text("Primary"),
               ),

               ListTile(
                  leading: Icon(Icons.people),
                  title: Text("Social"),
               ),

               ListTile(
                  leading: Icon(Icons.category),
                  title: Text("Promotions"),
               ),
              
            ],
        ),

      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.whatsapp),
        backgroundColor: Colors.green,
      ), 
    )

    );
  }
}

class MeuWidget extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }

}






class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.whatsapp),
      ), 
    );
  }
}

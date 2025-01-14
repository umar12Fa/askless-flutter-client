import 'package:flutter/material.dart';
import 'package:askless/index.dart';


class RandomNumbersApp extends StatelessWidget {
  const RandomNumbersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Numbers Generated by the Server',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final _textStyle = const TextStyle(fontSize: 22);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Server Generated Numbers"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: AsklessClient.instance.readStream(route: 'generated-random-number',),
                builder: (context,  snapshot) {
                  if(!snapshot.hasData) {
                    return Container();
                  }
                  return Text(snapshot.data["currentRandomNumber"].toString(), style: _textStyle);
                }
              )
            ],
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }
}

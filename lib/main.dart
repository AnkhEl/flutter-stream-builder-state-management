import 'package:flutter/material.dart';
import 'package:stream_biuilder_state/counter_block.dart';
import 'package:stream_biuilder_state/counter_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final CounterBlock _counterBlock =  CounterBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: _counterBlock.counterStateStream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _counterBlock.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => _counterBlock.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

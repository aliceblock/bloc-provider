import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp Built');
    return Provider<CounterBloc>(
      builder: (context) => CounterBloc(),
      dispose: (context, _counterBloc) => _counterBloc.dispose(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  @override
  Widget build(BuildContext context) {
    debugPrint('MyHomePage Built');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DisplayCounter(),
      ),
      floatingActionButton: FAButton(),
    );
  }
}

class DisplayCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('DisplayCounter Built');
    CounterBloc _counterBloc = Provider.of<CounterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        StreamBuilder(
          stream: _counterBloc.stream,
          initialData: CounterBloc.initialCounter,
          builder: (context, snapshot) {
            return Text(
              '${snapshot.data}',
              style: Theme.of(context).textTheme.display1,
            );
          },
        ),
      ],
    );
  }
}

class FAButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('FAButton Built');
    CounterBloc _counterBloc = Provider.of<CounterBloc>(context);
    return FloatingActionButton(
      onPressed: _counterBloc.increaseCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

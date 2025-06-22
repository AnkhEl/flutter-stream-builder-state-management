import 'dart:async';

import 'package:stream_biuilder_state/counter_event.dart';

class CounterBlock {

  int _counter = 0;

  final StreamController<int> _counterStateController = StreamController<int>();
  Stream<int> get _counterStateStream  => _counterStateController.stream;
  Sink<int> get incCounter => _counterStateController.sink;

  final StreamController<CounterEvent> _counterEventController = StreamController<CounterEvent>();
  Stream<CounterEvent> get _counterEventStream => _counterEventController.stream;


}
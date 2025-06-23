import 'dart:async';

import 'package:stream_biuilder_state/counter_event.dart';

class CounterBlock {

  int _counter = 0;

  final StreamController<int> _counterStateController = StreamController<int>();
  Stream<int> get counterStateStream  => _counterStateController.stream;
  StreamSink<int> get _counterStateSink => _counterStateController.sink;

  final StreamController<CounterEvent> _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink; //this sink is used to dispatch CounterEvents

  CounterBlock(){
    _counterEventController.stream.listen(_mapEventToState); //This stream will listen to events dispatched by the counterEventSink
  }

  //This method will be invoked every time when the stream detects counterEvent dispatched
  void _mapEventToState(CounterEvent event){
    if(event is IncrementEvent){
      _counter++;
    }
    else{
      _counter--;
    }
    _counterStateSink.add(_counter);
  }
}
/*
 * @Description eventbus封装
 * @Author chenjun
 * @Date 2021/7/9
 * @Param
 * @Return
 */

import 'dart:async';

import 'package:event_bus/event_bus.dart';

typedef void EventCallback<T>(T event);

class EventBusUtil {
  EventBus _eventBus;

  factory EventBusUtil() => _getInstance();
  static EventBusUtil get instance => _getInstance();
  static EventBusUtil _instance;
  EventBusUtil._internal() {
    // 初始化
    _eventBus = new EventBus();
  }

  static EventBusUtil _getInstance() {
    return _instance ??= EventBusUtil._internal();
  }

  /// 开启eventbus订阅 并
  StreamSubscription on<T>(EventCallback<T> callback) {
    StreamSubscription stream = _eventBus.on<T>().listen((event) {
      callback(event);
    });
    // subscriptionList.add(stream);
    return stream;
  }

  /// 发送消息
  void emit(event) {
    _eventBus.fire(event);
  }

  /// 移除steam
  void off(StreamSubscription steam) {
    steam.cancel();
  }
}

var eventBus = EventBusUtil.instance;

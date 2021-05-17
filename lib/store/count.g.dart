// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountStore on CountStoreMobx, Store {
  final _$valueAtom = Atom(name: 'CountStoreMobx.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$CountStoreMobxActionController =
      ActionController(name: 'CountStoreMobx');

  @override
  void increment() {
    final _$actionInfo = _$CountStoreMobxActionController.startAction(
        name: 'CountStoreMobx.increment');
    try {
      return super.increment();
    } finally {
      _$CountStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$CountStoreMobxActionController.startAction(
        name: 'CountStoreMobx.decrement');
    try {
      return super.decrement();
    } finally {
      _$CountStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void set(int value) {
    final _$actionInfo = _$CountStoreMobxActionController.startAction(
        name: 'CountStoreMobx.set');
    try {
      return super.set(value);
    } finally {
      _$CountStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

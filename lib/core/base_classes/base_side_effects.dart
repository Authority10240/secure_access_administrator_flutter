import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BaseSideEffects extends Equatable {

  EffectState effectState;
  String? errorMessage;
  String? errorCode;

  BaseSideEffects({

    this.effectState = EffectState.init,
    this.errorMessage,
    this.errorCode
  });

  @override
  // TODO: implement props
  List<Object?> get props => [effectState];
}

enum EffectState{
  init,
  loading,
  reloading,
  success,
  error
}

abstract class BaseBlocPrimaryState{
  void call(BuildContext context);
}
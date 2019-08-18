import 'package:nubank/models/AppState.dart';
import 'action.dart';

AppState reducer(AppState state, dynamic action){
  AppState newState = AppState.fromAppState(state);

  if(action.type == 'ANIMATED'){
    newState.animated = action.payload;
  }

  return newState;
}
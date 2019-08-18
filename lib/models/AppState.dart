class AppState {
  bool animated;

  AppState({ this.animated });

  AppState.fromAppState(AppState app){
    animated = app.animated;
  }
}
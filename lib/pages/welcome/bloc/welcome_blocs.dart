import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ylearning/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelccomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelccomeEvent>(event, emit) {
      emit(WelcomeState(page: state.page));
    }
  }
}

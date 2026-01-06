import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutRequested>((event, emit) async {
      emit(LogoutLoading());
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      emit(LogoutSuccess());
    });
  }
}

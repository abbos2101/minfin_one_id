import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../minfin_api.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final MinfinApi _api;

  LoginBloc(this._api) : super(LoginState.state()) {
    on<LoginEvent>(
      (event, emit) async {
        if (event is _init) {
          await _emitInit(event, emit);
        } else if (event is _changed) {
          await _emitChanged(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _emitInit(_init event, Emitter<LoginState> emit) async {
    emit(state.copyWith(initialUrl: _api.initialUrl));
  }

  Future<void> _emitChanged(_changed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      currentUrl: event.currentUrl ?? state.currentUrl,
      progress: event.progress ?? state.progress,
    ));
    if (event.currentUrl != null && event.currentUrl!.isNotEmpty) {
      if (state.currentUrl.contains("http://") ||
          state.currentUrl.contains("https://")) {
        const key = "code=";
        final index = state.currentUrl.indexOf(key);
        if (index != -1) {
          final code = state.currentUrl.substring(
            index + key.length,
            state.currentUrl.indexOf("&"),
          );
          emit(state.copyWith(status: EnumStatus.loading));
          try {
            final token = await _api.token(code);
            final user = await _api.getUser(token);
            emit(state.copyWith(user: user, status: EnumStatus.success));
            await Future.delayed(Duration.zero);
            await _api.logout(token);
            emit(state.copyWith(status: EnumStatus.next));
          } catch (e) {
            emit(state.copyWith(status: EnumStatus.fail, message: "Error $e"));
          }
        }
      }
    }
  }
}

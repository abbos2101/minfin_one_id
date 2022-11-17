part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  factory LoginEvent.init() = _init;

  factory LoginEvent.changed({String? currentUrl, int? progress}) = _changed;
}

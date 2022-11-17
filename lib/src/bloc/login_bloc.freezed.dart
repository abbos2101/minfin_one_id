// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? currentUrl, int? progress) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? currentUrl, int? progress)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? currentUrl, int? progress)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_changed value) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_changed value)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_changed value)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initCopyWith<$Res> {
  factory _$$_initCopyWith(_$_init value, $Res Function(_$_init) then) =
      __$$_initCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_init>
    implements _$$_initCopyWith<$Res> {
  __$$_initCopyWithImpl(_$_init _value, $Res Function(_$_init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_init implements _init {
  _$_init();

  @override
  String toString() {
    return 'LoginEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? currentUrl, int? progress) changed,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? currentUrl, int? progress)? changed,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? currentUrl, int? progress)? changed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_changed value) changed,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_changed value)? changed,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_changed value)? changed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _init implements LoginEvent {
  factory _init() = _$_init;
}

/// @nodoc
abstract class _$$_changedCopyWith<$Res> {
  factory _$$_changedCopyWith(
          _$_changed value, $Res Function(_$_changed) then) =
      __$$_changedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? currentUrl, int? progress});
}

/// @nodoc
class __$$_changedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_changed>
    implements _$$_changedCopyWith<$Res> {
  __$$_changedCopyWithImpl(_$_changed _value, $Res Function(_$_changed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUrl = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$_changed(
      currentUrl: freezed == currentUrl
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_changed implements _changed {
  _$_changed({this.currentUrl, this.progress});

  @override
  final String? currentUrl;
  @override
  final int? progress;

  @override
  String toString() {
    return 'LoginEvent.changed(currentUrl: $currentUrl, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_changed &&
            (identical(other.currentUrl, currentUrl) ||
                other.currentUrl == currentUrl) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUrl, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_changedCopyWith<_$_changed> get copyWith =>
      __$$_changedCopyWithImpl<_$_changed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? currentUrl, int? progress) changed,
  }) {
    return changed(currentUrl, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? currentUrl, int? progress)? changed,
  }) {
    return changed?.call(currentUrl, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? currentUrl, int? progress)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(currentUrl, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_changed value) changed,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_changed value)? changed,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_changed value)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _changed implements LoginEvent {
  factory _changed({final String? currentUrl, final int? progress}) =
      _$_changed;

  String? get currentUrl;
  int? get progress;
  @JsonKey(ignore: true)
  _$$_changedCopyWith<_$_changed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  String get initialUrl => throw _privateConstructorUsedError;
  String get currentUrl => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  dynamic get user => throw _privateConstructorUsedError;
  EnumStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String initialUrl, String currentUrl,
            int progress, dynamic user, EnumStatus status, String message)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String initialUrl, String currentUrl, int progress,
            dynamic user, EnumStatus status, String message)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String initialUrl, String currentUrl, int progress,
            dynamic user, EnumStatus status, String message)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_state value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_state value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_state value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {String initialUrl,
      String currentUrl,
      int progress,
      dynamic user,
      EnumStatus status,
      String message});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialUrl = null,
    Object? currentUrl = null,
    Object? progress = null,
    Object? user = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      initialUrl: null == initialUrl
          ? _value.initialUrl
          : initialUrl // ignore: cast_nullable_to_non_nullable
              as String,
      currentUrl: null == currentUrl
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnumStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_stateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$$_stateCopyWith(_$_state value, $Res Function(_$_state) then) =
      __$$_stateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String initialUrl,
      String currentUrl,
      int progress,
      dynamic user,
      EnumStatus status,
      String message});
}

/// @nodoc
class __$$_stateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_state>
    implements _$$_stateCopyWith<$Res> {
  __$$_stateCopyWithImpl(_$_state _value, $Res Function(_$_state) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialUrl = null,
    Object? currentUrl = null,
    Object? progress = null,
    Object? user = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$_state(
      initialUrl: null == initialUrl
          ? _value.initialUrl
          : initialUrl // ignore: cast_nullable_to_non_nullable
              as String,
      currentUrl: null == currentUrl
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnumStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_state implements _state {
  _$_state(
      {this.initialUrl = "",
      this.currentUrl = "",
      this.progress = 0,
      this.user,
      this.status = EnumStatus.initial,
      this.message = ""});

  @override
  @JsonKey()
  final String initialUrl;
  @override
  @JsonKey()
  final String currentUrl;
  @override
  @JsonKey()
  final int progress;
  @override
  final dynamic user;
  @override
  @JsonKey()
  final EnumStatus status;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'LoginState.state(initialUrl: $initialUrl, currentUrl: $currentUrl, progress: $progress, user: $user, status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_state &&
            (identical(other.initialUrl, initialUrl) ||
                other.initialUrl == initialUrl) &&
            (identical(other.currentUrl, currentUrl) ||
                other.currentUrl == currentUrl) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialUrl, currentUrl, progress,
      const DeepCollectionEquality().hash(user), status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_stateCopyWith<_$_state> get copyWith =>
      __$$_stateCopyWithImpl<_$_state>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String initialUrl, String currentUrl,
            int progress, dynamic user, EnumStatus status, String message)
        state,
  }) {
    return state(initialUrl, currentUrl, progress, user, status, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String initialUrl, String currentUrl, int progress,
            dynamic user, EnumStatus status, String message)?
        state,
  }) {
    return state?.call(initialUrl, currentUrl, progress, user, status, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String initialUrl, String currentUrl, int progress,
            dynamic user, EnumStatus status, String message)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(initialUrl, currentUrl, progress, user, status, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_state value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_state value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_state value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _state implements LoginState {
  factory _state(
      {final String initialUrl,
      final String currentUrl,
      final int progress,
      final dynamic user,
      final EnumStatus status,
      final String message}) = _$_state;

  @override
  String get initialUrl;
  @override
  String get currentUrl;
  @override
  int get progress;
  @override
  dynamic get user;
  @override
  EnumStatus get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_stateCopyWith<_$_state> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'photo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoItem _$PhotoItemFromJson(Map<String, dynamic> json) {
  return _PhotoItem.fromJson(json);
}

/// @nodoc
class _$PhotoItemTearOff {
  const _$PhotoItemTearOff();

  _PhotoItem call(
      {@JsonKey(name: 'path') required String path,
      @JsonKey(name: 'create_date_time') required DateTime createDateTime}) {
    return _PhotoItem(
      path: path,
      createDateTime: createDateTime,
    );
  }

  PhotoItem fromJson(Map<String, Object> json) {
    return PhotoItem.fromJson(json);
  }
}

/// @nodoc
const $PhotoItem = _$PhotoItemTearOff();

/// @nodoc
mixin _$PhotoItem {
  /// FilePath
  @JsonKey(name: 'path')
  String get path => throw _privateConstructorUsedError;

  /// CreateDateTime
  @JsonKey(name: 'create_date_time')
  DateTime get createDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoItemCopyWith<PhotoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoItemCopyWith<$Res> {
  factory $PhotoItemCopyWith(PhotoItem value, $Res Function(PhotoItem) then) =
      _$PhotoItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'path') String path,
      @JsonKey(name: 'create_date_time') DateTime createDateTime});
}

/// @nodoc
class _$PhotoItemCopyWithImpl<$Res> implements $PhotoItemCopyWith<$Res> {
  _$PhotoItemCopyWithImpl(this._value, this._then);

  final PhotoItem _value;
  // ignore: unused_field
  final $Res Function(PhotoItem) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? createDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createDateTime: createDateTime == freezed
          ? _value.createDateTime
          : createDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PhotoItemCopyWith<$Res> implements $PhotoItemCopyWith<$Res> {
  factory _$PhotoItemCopyWith(
          _PhotoItem value, $Res Function(_PhotoItem) then) =
      __$PhotoItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'path') String path,
      @JsonKey(name: 'create_date_time') DateTime createDateTime});
}

/// @nodoc
class __$PhotoItemCopyWithImpl<$Res> extends _$PhotoItemCopyWithImpl<$Res>
    implements _$PhotoItemCopyWith<$Res> {
  __$PhotoItemCopyWithImpl(_PhotoItem _value, $Res Function(_PhotoItem) _then)
      : super(_value, (v) => _then(v as _PhotoItem));

  @override
  _PhotoItem get _value => super._value as _PhotoItem;

  @override
  $Res call({
    Object? path = freezed,
    Object? createDateTime = freezed,
  }) {
    return _then(_PhotoItem(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createDateTime: createDateTime == freezed
          ? _value.createDateTime
          : createDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhotoItem implements _PhotoItem {
  _$_PhotoItem(
      {@JsonKey(name: 'path') required this.path,
      @JsonKey(name: 'create_date_time') required this.createDateTime});

  factory _$_PhotoItem.fromJson(Map<String, dynamic> json) =>
      _$_$_PhotoItemFromJson(json);

  @override

  /// FilePath
  @JsonKey(name: 'path')
  final String path;
  @override

  /// CreateDateTime
  @JsonKey(name: 'create_date_time')
  final DateTime createDateTime;

  @override
  String toString() {
    return 'PhotoItem(path: $path, createDateTime: $createDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoItem &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.createDateTime, createDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.createDateTime, createDateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(createDateTime);

  @JsonKey(ignore: true)
  @override
  _$PhotoItemCopyWith<_PhotoItem> get copyWith =>
      __$PhotoItemCopyWithImpl<_PhotoItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhotoItemToJson(this);
  }
}

abstract class _PhotoItem implements PhotoItem {
  factory _PhotoItem(
      {@JsonKey(name: 'path')
          required String path,
      @JsonKey(name: 'create_date_time')
          required DateTime createDateTime}) = _$_PhotoItem;

  factory _PhotoItem.fromJson(Map<String, dynamic> json) =
      _$_PhotoItem.fromJson;

  @override

  /// FilePath
  @JsonKey(name: 'path')
  String get path => throw _privateConstructorUsedError;
  @override

  /// CreateDateTime
  @JsonKey(name: 'create_date_time')
  DateTime get createDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhotoItemCopyWith<_PhotoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

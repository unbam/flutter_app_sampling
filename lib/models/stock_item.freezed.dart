// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StockItem _$StockItemFromJson(Map<String, dynamic> json) {
  return _StockItem.fromJson(json);
}

/// @nodoc
class _$StockItemTearOff {
  const _$StockItemTearOff();

  _StockItem call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') String name = '',
      @JsonKey(name: 'count') int count = 0}) {
    return _StockItem(
      id: id,
      name: name,
      count: count,
    );
  }

  StockItem fromJson(Map<String, Object> json) {
    return StockItem.fromJson(json);
  }
}

/// @nodoc
const $StockItem = _$StockItemTearOff();

/// @nodoc
mixin _$StockItem {
// Id
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  /// Name
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Count
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockItemCopyWith<StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) then) =
      _$StockItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'count') int count});
}

/// @nodoc
class _$StockItemCopyWithImpl<$Res> implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._value, this._then);

  final StockItem _value;
  // ignore: unused_field
  final $Res Function(StockItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StockItemCopyWith<$Res> implements $StockItemCopyWith<$Res> {
  factory _$StockItemCopyWith(
          _StockItem value, $Res Function(_StockItem) then) =
      __$StockItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'count') int count});
}

/// @nodoc
class __$StockItemCopyWithImpl<$Res> extends _$StockItemCopyWithImpl<$Res>
    implements _$StockItemCopyWith<$Res> {
  __$StockItemCopyWithImpl(_StockItem _value, $Res Function(_StockItem) _then)
      : super(_value, (v) => _then(v as _StockItem));

  @override
  _StockItem get _value => super._value as _StockItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? count = freezed,
  }) {
    return _then(_StockItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StockItem implements _StockItem {
  _$_StockItem(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'count') this.count = 0});

  factory _$_StockItem.fromJson(Map<String, dynamic> json) =>
      _$_$_StockItemFromJson(json);

  @override // Id
  @JsonKey(name: 'id')
  final int id;
  @override

  /// Name
  @JsonKey(name: 'name')
  final String name;
  @override

  /// Count
  @JsonKey(name: 'count')
  final int count;

  @override
  String toString() {
    return 'StockItem(id: $id, name: $name, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StockItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$StockItemCopyWith<_StockItem> get copyWith =>
      __$StockItemCopyWithImpl<_StockItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StockItemToJson(this);
  }
}

abstract class _StockItem implements StockItem {
  factory _StockItem(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'count') int count}) = _$_StockItem;

  factory _StockItem.fromJson(Map<String, dynamic> json) =
      _$_StockItem.fromJson;

  @override // Id
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override

  /// Name
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @override

  /// Count
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StockItemCopyWith<_StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}

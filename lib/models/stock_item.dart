import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item.freezed.dart';
part 'stock_item.g.dart';

///
/// StockItem
///
@freezed
class StockItem with _$StockItem {
  factory StockItem({
    // Id
    @JsonKey(name: 'id') required int id,

    /// Name
    @JsonKey(name: 'name') @Default('') String name,

    /// Count
    @JsonKey(name: 'count') @Default(0) int count,
  }) = _StockItem;

  factory StockItem.fromJson(Map<String, dynamic> json) =>
      _$StockItemFromJson(json);
}

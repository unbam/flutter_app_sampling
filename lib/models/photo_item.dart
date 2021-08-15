import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_item.freezed.dart';
part 'photo_item.g.dart';

///
/// PhotoItem
///
@freezed
abstract class PhotoItem with _$PhotoItem {
  factory PhotoItem({
    /// FilePath
    @JsonKey(name: 'path') required String path,

    /// CreateDateTime
    @JsonKey(name: 'create_date_time') required DateTime createDateTime,
  }) = _PhotoItem;

  factory PhotoItem.fromJson(Map<String, dynamic> json) =>
      _$PhotoItemFromJson(json);
}

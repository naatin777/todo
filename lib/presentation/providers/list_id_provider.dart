import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_id_provider.g.dart';

@riverpod
class ListId extends _$ListId {
  @override
  String build() => "";

  void changeListId(String listId) {
    state = listId;
  }
}

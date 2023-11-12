import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterModel {
  final bool? available;
  final String? gender;
  final String? domain;

  FilterModel({this.available, this.gender, this.domain});
}
final filterProvider = StateProvider<FilterModel>((ref) => FilterModel());

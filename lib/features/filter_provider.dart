import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/UserModel.dart';
import '../models/filter_model.dart';

final filterProvider = StateProvider<FilterModel>((ref) => FilterModel());
final usersListProvider = FutureProvider<List<UserModel>>((ref) async {
  final String jsonData = await rootBundle.loadString('assets/heliverse_mock_data.json');
  final data = json.decode(jsonData);
  List<UserModel> usersList = [];
  for (Map i in data) {
    usersList.add(UserModel.fromJson(i));
  }
  return usersList;
});

final filteredUsersProvider = Provider<List<UserModel>>((ref) {
  final filter = ref.watch(filterProvider);
  final users = ref.watch(usersListProvider).value ?? [];
  return applyFilters(users, filter);
});

List<UserModel> applyFilters(List<UserModel> users, FilterModel filter) {
  return users.where((user) {
    if (filter.available != null && user.available != filter.available) return false;
    if (filter.gender != null && user.gender != filter.gender) return false;
    if (filter.domain != null && user.domain != filter.domain) return false;
    return true;
  }).toList();
}

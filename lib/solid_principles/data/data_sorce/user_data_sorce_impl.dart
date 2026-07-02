import 'package:flutter/widgets.dart';
import 'package:learn_more/api/api_provider.dart';
import 'package:learn_more/solid_principles/data/data_sorce/user_data_sorce.dart';

class UserDataSorceImpl extends UserDataSorce {
  @override
  Future<dynamic> getUserData(BuildContext context) =>
      ApiProvider().get(context, "url", {});
}

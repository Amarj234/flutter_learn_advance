import 'package:flutter/cupertino.dart';
import 'package:learn_more/api/api_provider.dart';
import 'package:learn_more/solid_principles/domain/reposetory/reposetory.dart';

import '../../data/data_sorce/user_data_sorce.dart';

class ReposetoryImpl implements UserReposetory {
  final UserDataSorce userDataSorce;
  ReposetoryImpl(this.userDataSorce);
  @override
  Future<dynamic> getUserDetails(BuildContext context) =>
      userDataSorce.getUserData(context);
}

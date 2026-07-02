import 'package:flutter/material.dart';

import '../reposetory/reposetory.dart';

class UserUsecase {
  final UserReposetory userReposetory;
  UserUsecase(this.userReposetory);

  getUser(BuildContext context) {
    return userReposetory.getUserDetails(context);
  }
}

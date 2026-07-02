import 'package:flutter/cupertino.dart';

import '../../data/data_sorce/user_data_sorce.dart';

abstract class UserReposetory {
  Future<dynamic> getUserDetails(BuildContext context);
}

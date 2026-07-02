abstract class UserEvents {}

class GetUser extends UserEvents {
  GetUser(this.id);

  final String id;
}

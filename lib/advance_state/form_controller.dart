class FormFieldState<T> {
  T value;
  String? error;

  FormFieldState({required this.value, this.error});
}

class LoginFormController {
  final email = FormFieldState<String>(value: '');
  final password = FormFieldState<String>(value: '');

  bool validate() {
    email.error = email.value.contains('@') ? null : 'Invalid email';
    password.error = password.value.length >= 6 ? null : 'Password too short';
    return email.error == null && password.error == null;
  }
}


void main(){

  final form = LoginFormController();

  if (form.validate()) {
    print('Form is valid!');
  } else {
    print('Email error: ${form.email.error}');
    print('Password error: ${form.password.error}');
  }


}
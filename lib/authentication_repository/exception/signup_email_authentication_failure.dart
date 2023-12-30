class SignUpWithEmailAndPasswordFailure {
  final String message;

  SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown Error Occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch (code) {
      case 'weak_password':
        return SignUpWithEmailAndPasswordFailure(
            ('Please enter a stronger password'));
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            ('Email is not valid or badly formatted'));
      case 'email_already-in-use':
        return SignUpWithEmailAndPasswordFailure(
            ('An account already exists for that email'));
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
            ('Operation is not allowed. Please contact support'));
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
            ('This user has been disabled. Please contact support for help'));
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
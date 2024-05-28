import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome, 
    required String email, 
    required String senha,
  }) async {
    try {
      UserCredential userCredential =
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: senha,
      );
      //await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'O usuário já está cadastrado.';
      }

      return 'Erro ao cadastrar usuário.';
    }
  }

  Future<String?> logarUsuario({
    required String email, 
    required String senha,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
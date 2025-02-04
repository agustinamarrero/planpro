import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantelpro/users/coach.dart';
import 'package:plantelpro/users/player.dart';

class AuthRepository {
  AuthRepository({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  Future<User?> registerPlayer(Player player, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: player.email,
        password: password,
      );

      await _firestore
          .collection('players')
          .doc(userCredential.user!.uid)
          .set(player.toJson());

      return userCredential.user;
    } catch (e) {
      throw Exception('Error al registrar el jugador: $e');
    }
  }

  Future<User?> registerCoach(Coach coach, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: coach.email,
        password: password,
      );

      await _firestore
          .collection('coaches')
          .doc(userCredential.user!.uid)
          .set(coach.toJson());

      return userCredential.user;
    } catch (e) {
      throw Exception('Error al registrar el entrenador: $e');
    }
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get userStream => _firebaseAuth.authStateChanges();
}

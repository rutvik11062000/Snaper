import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot> getAddFriendList() {
  return FirebaseFirestore.instance
      .collection('global')
      .doc('users_list')
      .get();
}

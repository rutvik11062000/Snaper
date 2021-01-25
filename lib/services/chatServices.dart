import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference chatroom = FirebaseFirestore.instance
    .collection('chats')
    .doc('USER1_USER2')
    .collection('messages');

Query chatroomsnapshot(String chat_room_key) {
  return FirebaseFirestore.instance
      .collection('chats')
      .doc(chat_room_key)
      .collection('messages')
      .orderBy('timestamp', descending: true);
}

Stream<QuerySnapshot> chatroomsnapsnapshot(String chat_room_key) {
  return FirebaseFirestore.instance
      .collection('chats')
      .doc(chat_room_key)
      .collection('snaps')
      .where('seen', isEqualTo: false)
      .snapshots();
}

Stream<DocumentSnapshot> userSnapshot() {
  return FirebaseFirestore.instance.collection('user').doc('USER1').snapshots();
}

Future<DocumentSnapshot> user() {
  return FirebaseFirestore.instance.collection('user').doc('USER1').get();
}

Future<void> addMessage(String sender_ID, String text) async {
  if (text.length == 0) return;
  var data = {
    'last': true,
    'sender_ID': sender_ID,
    'timestamp': DateTime.now(),
    'texts': text,
    'save': false,
    'seen': false,
  };
  await chatroom.add(data);
}

Future<void> updateSaveProperty(DocumentSnapshot doc) async {
  bool prev = doc['save'];
  await doc.reference.update({'save': !prev});
}

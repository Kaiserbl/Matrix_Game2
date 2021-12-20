import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  final _firestore = FirebaseFirestore.instance;

  FirebaseFirestore get databaseInstance => _firestore;

  Future<void> add(
      {required String collectionPath,
      required Map<String, dynamic> data}) async {
    await _firestore.collection(collectionPath).add(data);
  }

  Future<void> addWithID(
      // Se crea un archivo con un ID que ya conocemos
      {
    required String collectionPath,
    required Map<String, dynamic> data,
    required String idDoc,
  }) async {
    await _firestore.collection(collectionPath).doc(idDoc).set(
        data); //se asigna dato al documento (idoc) que se encuentra en la colectción
  }

  Future<void> deleteDoc({required String documentPath}) async {
    await _firestore.doc(documentPath).delete();
  }

  Future<Map<String, dynamic>?> readDoc({required String documentPath}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.doc(documentPath).get();
    return snapshot.data();
  }

  Future<List<Map<String, dynamic>>> readCollection(
      {required String collectionPath}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection(collectionPath).get();
    List<Map<String, dynamic>> docs = [];
    for (var document in snapshot.docs) {
      docs.add({
        "ref": document.reference,
        "data": document.data(),
      });
    }
    return docs;
  }

  Future<void> updateDoc(
      {required String documentPath,
      required Map<String, dynamic> data}) async {
    await _firestore.doc(documentPath).update(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listenCollection(
      {required String collectionPath}) {
    const lifeSpan = 24 * 60 * 60 * 1000;
    final minimumTimestamp = Timestamp.fromMillisecondsSinceEpoch(
        Timestamp.now().millisecondsSinceEpoch - lifeSpan);

    return FirebaseFirestore.instance
        .collection(collectionPath)
        .where('timestamp', isGreaterThanOrEqualTo: minimumTimestamp)
        .orderBy('timestamp', descending: true)
        .limit(15)
        .snapshots();
  }

  List<Map<String, dynamic>> extractDocs(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    List<Map<String, dynamic>> docs = [];
    for (var document in snapshot.docs) {
      docs.add({
        "ref": document.reference.path,
        "data": document.data(),
      });
    }
    return docs;
  }
}

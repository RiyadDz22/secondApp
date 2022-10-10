import 'package:cloud_firestore/cloud_firestore.dart';
import 'cloud_constant.dart';
import 'cloud_task.dart';
import 'exceptions.dart';

class FirebaseCloudStorage {
  final tasks = FirebaseFirestore.instance.collection('tasks');

  Future<void> deleteTask({required String documentId}) async {
    try {
      await tasks.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteTaskException();
    }
  }

  Future<void> updateTask(
      {required String documentId, required String text}) async {
    try {
      tasks.doc(documentId).update({textFieldName: text});
    } catch (e) {
      throw CouldNotUpdateTasksException();
    }
  }

  Stream<Iterable<CloudTask>> allTask({required String ownerUserId}) =>
      tasks.snapshots().map((event) => event.docs
          .map(
            (doc) => CloudTask.fromSnapshot(doc),
          )
          .where((task) => task.ownerUserId == ownerUserId));

  Future<Iterable<CloudTask>> getTasks({required String ownerUserId}) async {
    try {
      return await tasks
          .where(ownerUserIdFieldName, isEqualTo: ownerUserId)
          .get()
          .then(
            (value) => value.docs.map(
              (doc) => CloudTask.fromSnapshot(doc),
            ),
          );
    } catch (e) {
      throw CouldNotGetAllTasksException();
    }
  }

  Future<CloudTask> createNewTask({required String ownerUserId}) async {
    final document = await tasks.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: '',
    });
    final fetchedTask = await document.get();
    return CloudTask(
      documentId: fetchedTask.id,
      ownerUserId: ownerUserId,
      text: '',
    );
  }

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();

  FirebaseCloudStorage._sharedInstance();

  factory FirebaseCloudStorage() => _shared;
}

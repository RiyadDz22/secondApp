
import 'package:flutter/foundation.dart';

@immutable
class CloudStorageException implements Exception{
  const CloudStorageException();
}

class CouldNotCreateTaskException extends CloudStorageException{}
class CouldNotGetAllTasksException extends CloudStorageException{}
class CouldNotUpdateTasksException extends CloudStorageException{}
class CouldNotDeleteTaskException extends CloudStorageException{}
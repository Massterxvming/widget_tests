

// abstract class ObjectDataInterface {
//   Store singleStore;
//
//   String dbName;
//
//   Future<void> loadData()async{
//
//   }
//
// }

class ObjectData {
  ObjectData._();
  static ObjectData get  _instance => ObjectData._();

  static ObjectData instance = _instance;

  Future<void> init () async {

  }
}
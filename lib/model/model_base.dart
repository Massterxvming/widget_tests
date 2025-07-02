

abstract class ModelBase{

  dynamic toJson();

  @override
  String toString()=>toJson().toString();


}
class DataPart{
  late int num;

  DataPart init(){
    return DataPart()..num=1;
  }

  DataPart clone(){
    return DataPart()..num=num;
  }
}
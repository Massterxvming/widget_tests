import 'package:bot_toast/bot_toast.dart';
import 'package:ews/Core/ExchangeService.dart';
import 'package:ews/Core/ServiceObjects/Folders/Folder.dart';
import 'package:ews/Enumerations/ExchangeVersion.dart';
import 'package:ews/Enumerations/TraceFlags.dart';
import 'package:ews/Enumerations/WellKnownFolderName.dart';
import 'package:ews/Http/BasicCredentials.dart';

class AppController{
  AppController._internal(){
    // init();
  }

  static final AppController _instance = AppController._internal();

  factory AppController() {
    return _instance;
  }

  static AppController get instance=> _instance;

  Future<void> init()async{

  }

  Future<void> initEws() async {
    try{
      final credentials = BasicCredentials(
        'administrator',
        'Neathub@2024',
        'http://192.168.1.102/EWS/Exchange.asmx',
      );
      final service = ExchangeService.withVersion(ExchangeVersion.Exchange2013_SP1)
        ..Url = Uri.parse("http://192.168.1.102/EWS/Exchange.asmx")
        // ..Url = Uri.parse("https://outlook.office365.com/ews/exchange.asmx")
        ..Credentials = credentials
        ..TraceFlags = [TraceFlags.EwsRequest, TraceFlags.EwsResponse]
        ..TraceEnabled = true;
      final folder = Folder(service)..DisplayName = "My Folder";
      await folder.SaveWithWellKnownFolderName(WellKnownFolderName.Notes);
      print("Folder created successfully:${folder.DisplayName}");
    } catch(e){
      BotToast.showText(text: e.toString());
    }
  }

}

AppController appController = AppController.instance;
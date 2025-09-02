import 'dart:convert';
import 'dart:io';

import 'package:mmkv/mmkv.dart';
import 'package:path_provider/path_provider.dart';

class MMKVData {
  static MMKV? _mmkv;

  static String? _path;

  static Future<void> init() async {
    if (Platform.isIOS) {
      //使用文件路径
      final groupDir = getApplicationCacheDirectory().then((value) {
        _path = value.path;
      });
    } else if (Platform.isAndroid) {
      // groupDir = "$path/mmkv_group";
    }

    // test NameSpace before MMKV.initialize()
    // await _testNameSpace();

    // must wait for MMKV to finish initialization
    final rootDir = await MMKV.initialize(groupDir: '$_path/mmkv_namespace', handler: MyMMKVHandler());
    print("MMKV for flutter with rootDir = $rootDir");
    _mmkv ??= MMKV.defaultMMKV();
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is int) {
      await _mmkv!.encodeInt(key, value);
    } else if (value is double) {
      await _mmkv!.encodeDouble(key, value);
    } else if (value is bool) {
      await _mmkv!.encodeBool(key, value);
    } else if (value is String) {
      await _mmkv!.encodeString(key, value);
    } else if (value is List<String>) {
      final MMBuffer? buffer = MMBuffer.fromList(const Utf8Encoder().convert(value.toString()));
      final String encoded = jsonEncode(value);
      await _mmkv!.encodeBytes(key, buffer);
    }
  }

  static Future<dynamic> getValue(String key) async {
    return _mmkv!.decodeString(key);
  }

  static Future<void> removeValue(String key) async {
    _mmkv!.removeValue(key);
  }

  static Future<void> clearAll() async {
    _mmkv!.removeValues([]);
  }
}

class MyMMKVHandler extends MMKVHandler {
  @override
  bool wantLogRedirect() {
    print("MyMMKVHandler.wantLogRedirect() is called");
    return true;
  }

  @override
  void mmkvLog(MMKVLogLevel level, String file, int line, String function, String message) {
    print("mmkv-redirect <$file:$line::$function> $message");
  }

  @override
  MMKVRecoverStrategic onMMKVCRCCheckFail(String mmapID) {
    print("onMMKVCRCCheckFail: $mmapID");
    return MMKVRecoverStrategic.OnErrorRecover;
  }

  @override
  MMKVRecoverStrategic onMMKVFileLengthError(String mmapID) {
    print("onMMKVFileLengthError: $mmapID");
    return MMKVRecoverStrategic.OnErrorRecover;
  }

  @override
  bool wantContentChangeNotification() {
    print("MyMMKVHandler.wantContentChangeNotification() is called");
    return true;
  }

  @override
  void onContentChangedByOuterProcess(String mmapID) {
    print("onContentChangedByOuterProcess: $mmapID");
  }
}

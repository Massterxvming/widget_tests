import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_test/bloc_test/single_page/data_part.dart';
import 'package:widget_test/bloc_test/single_page/single_event.dart';

class SingleBloc extends Bloc<SingleEventBase, DataPart> {
//  使用SingleEventBase作为事件类型，DataPart作为状态类型
  SingleBloc():super(DataPart().init()) {
    on<InitSingleEvent>(_init);
    on<LoadSingleEvent>(_add);
  }

  /// 私有化逻辑方法 暴露Event事件即可
  void _init(InitSingleEvent event, Emitter<DataPart> emit) {
    // emit方法，通知更新状态 类似于 ChangeNotifier的notifyListeners方法。
    emit(state.clone());
  }

  void _add(LoadSingleEvent event, Emitter<DataPart> emit) {
    state.num++;
    // 调用emit方法更新状态
    emit(state.clone());
  }
}
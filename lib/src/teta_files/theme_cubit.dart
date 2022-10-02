import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
//false = dark_mode
//true = light mode
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false){
    init();
  }

  Future init() async {
    final box = await Hive.openBox<dynamic>('theme_data');
    if (box.containsKey('flag')) {
      final val = box.get('flag');
      emit(val as bool);
    } else {
      box.put('flag', false);
      emit(false);
    }
  }

  Future changeVal() async {
    final box = await Hive.openBox<dynamic>('theme_data');
    var val = state;
    val = !val;
    box.put('flag', val);
    emit(val);
  }
}

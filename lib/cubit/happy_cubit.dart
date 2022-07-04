import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class HappyCubit extends Cubit<bool> {
  HappyCubit() : super(true);

  void happy() => emit(true);

  void sad() => emit(false);
}

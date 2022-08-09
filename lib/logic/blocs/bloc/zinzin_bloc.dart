import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'zinzin_event.dart';
part 'zinzin_state.dart';

class ZinzinBloc extends Bloc<ZinzinEvent, ZinzinState> {
  ZinzinBloc() : super(ZinzinInitial()) {
    on<ZinzinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

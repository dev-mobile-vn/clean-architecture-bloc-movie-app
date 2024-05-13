import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'well_come_event.dart';
part 'well_come_state.dart';

class WellComeBloc extends Bloc<WellComeEvent, WellComeState> {
  WellComeBloc() : super(WellComeInitial(changeIndex: 0)) {
    on<WellComeEvent>((event, emit) {
      if (event is ViewChangeEvent) {
        emit(WellComeInitial(changeIndex: event.index));
      }

      if (event is ActionButtonEvent) {
        emit(WellComeActionButton());
      }

      if (event is CheckboxEvent) {
        emit(CheckboxState(event.value));
      }
    });
  }
}

part of 'well_come_bloc.dart';

@immutable
abstract class WellComeEvent {}

class ViewChangeEvent extends WellComeEvent {
  final int index;

  ViewChangeEvent({required this.index});
}

class ActionButtonEvent extends WellComeEvent {}

class CheckboxEvent extends WellComeEvent {
  final bool value;

  CheckboxEvent(this.value);
}

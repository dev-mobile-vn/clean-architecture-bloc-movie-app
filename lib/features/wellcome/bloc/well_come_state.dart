part of 'well_come_bloc.dart';

@immutable
abstract class WellComeState {}

class WellComeInitial extends WellComeState {
  final int changeIndex;

  WellComeInitial({required this.changeIndex});
}

class WellComeActionButton extends WellComeState {}

class CheckboxState extends WellComeState {
  final bool value;

  CheckboxState(this.value);
}

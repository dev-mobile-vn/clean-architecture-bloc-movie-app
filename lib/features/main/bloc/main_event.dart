
abstract class MainEvent {}

class TabChangeEvent extends MainEvent {
  final int tabIndex;

  TabChangeEvent(this.tabIndex);
}

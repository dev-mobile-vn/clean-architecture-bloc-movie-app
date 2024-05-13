
/// Checks if item is enum
bool isEnum(item) {
  final split = item.toString().split('.');
  return split.length > 1 && split[0] == item.runtimeType.toString();
}

/// Convert an enum to a string
String enumToString(dynamic enumItem) {
  assert(enumItem != null);
  assert(isEnum(enumItem),
      'Item $enumItem of type ${enumItem.runtimeType.toString()} is not enum');
  return enumItem.toString().split('.')[1];
}

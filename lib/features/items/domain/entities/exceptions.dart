class CantReturnAvailableItemException implements Exception{
  @override
  String toString() {
    return "Cant return an available item.";
  }
}
class CantReserveAlreadyReservedItemException implements Exception{
  @override
  String toString() {
    return "Cant reserve an already reserved item.";
  }
}

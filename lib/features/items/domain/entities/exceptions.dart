class CantReturnAvailableItemException implements Exception{
  @override
  String toString() {
    return "Cant return an available item.";
  }
}
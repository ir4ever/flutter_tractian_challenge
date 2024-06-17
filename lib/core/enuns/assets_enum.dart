enum TypeItemEnum {
  LOCATION(typeName: 'Location', pathIcon: 'assets/icons/location.png'),
  SUBLOCATION(typeName: 'Sub-Location', pathIcon: 'assets/icons/location.png'),
  ASSET(typeName: 'Asset', pathIcon: 'assets/icons/asset.png'),
  SUBASSET(typeName: 'Sub-Asset', pathIcon: 'assets/icons/asset.png'),
  COMPONENT(typeName: 'Component', pathIcon: 'assets/icons/component.png');

  final String typeName;
  final String pathIcon;

  const TypeItemEnum({required this.typeName, required this.pathIcon});
}

enum AssetStatusEnum { ON, OFF }

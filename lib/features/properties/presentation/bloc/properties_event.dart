part of 'properties_bloc.dart';
 @immutable
abstract class PropertiesPageEvent extends BaseEvent {}


class PropertiesAddBlockClickedEvent extends PropertiesPageEvent{

  final SecureAccessBlocksModel secureAccessBlocksModel;

  PropertiesAddBlockClickedEvent({required this.secureAccessBlocksModel});
}

class PropertiesGetBlocksEvent extends PropertiesPageEvent{

}

class PropertiesDeleteBlockEvent extends PropertiesGetBlocksEvent{

   final String blockid;

   PropertiesDeleteBlockEvent({required this.blockid});
}
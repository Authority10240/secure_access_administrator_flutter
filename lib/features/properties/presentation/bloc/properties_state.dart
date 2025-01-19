part of 'properties_bloc.dart';
@immutable
abstract class PropertiesPageState extends BaseState {

  PropertiesPageState({super.errorCode, super.errorMessage, this.residenceBlock});

  Stream<QuerySnapshot<SecureAccessBlocksModel?>>? residenceBlock;
}

class PropertiesPageInitState extends PropertiesPageState  {
}

class PropertiesAddBlockClickedState extends PropertiesPageState{
  PropertiesAddBlockClickedState({ super.errorCode, super.errorMessage, super.residenceBlock});
}

class PropertiesGetBlocksState extends PropertiesPageState{

  PropertiesGetBlocksState({super.errorCode, super.errorMessage, super.residenceBlock});
}

class PropertiesDeleteBlockState extends PropertiesPageState{

  PropertiesDeleteBlockState({super.errorCode, super.errorMessage, super.residenceBlock});
}


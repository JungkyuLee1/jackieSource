import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  final String plugin;

  CustomError({this.code = '', this.message = '', this.plugin = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [code, message, plugin];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

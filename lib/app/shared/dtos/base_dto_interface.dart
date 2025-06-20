import 'package:coin_control/app/shared/dtos/base_dto.dart';

abstract class IBaseDto {
  late BaseDto baseDto;

  Map<String, dynamic> toMap();
}



import 'package:flutter_clean_arch/core/error/Failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType , Params>{
  Future<Either <Failure , SuccessType>> call(Params params);
}
import 'package:boostfin/network_layer/error_parser.dart';
import 'package:dartz/dartz.dart';

typedef RequestPayload = Map<String, dynamic>;
typedef EitherErrorOrResponse<T> = Either<ErrorParser?, T>;

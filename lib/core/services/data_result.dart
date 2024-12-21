import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_result.freezed.dart';

@freezed
abstract class DataResult<T> with _$DataResult<T> {
  const factory DataResult.success(T data) = Success<T>;
  const factory DataResult.failure(String error) = Failure<T>;
}

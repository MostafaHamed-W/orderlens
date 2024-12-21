import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orderlens/features/metrics/data/models/orders_metrics_model.dart';
part 'order_metrics_state.freezed.dart';

@freezed
class OrderMetricsState with _$OrderMetricsState {
  const factory OrderMetricsState.initial() = OrderMetricsInitial;
  const factory OrderMetricsState.loading() = OrderMetricsLoading;
  const factory OrderMetricsState.success(OrderMetricsModel metrics) = OrderMetricsSuccess;
  const factory OrderMetricsState.failure(String error) = OrderMetricsFailure;
}

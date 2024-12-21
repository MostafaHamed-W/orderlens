import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderlens/features/metrics/data/repos/order_metrics_repo.dart';
import 'package:orderlens/features/metrics/logic/cubit/order_metrics_state.dart';

class OrderMetricsCubit extends Cubit<OrderMetricsState> {
  final OrderMetricsRepository _repository;

  OrderMetricsCubit(this._repository) : super(const OrderMetricsState.initial());

  Future<void> fetchMetrics() async {
    emit(const OrderMetricsState.loading());

    await Future.delayed(const Duration(milliseconds: 300));

    final result = await _repository.getOrderMetrics();
    result.when(
      success: (metrics) => emit(OrderMetricsState.success(metrics)),
      failure: (error) => emit(OrderMetricsState.failure(error)),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orderlens/features/graph/data/models/grouped_orders_model.dart';
part 'orders_state.freezed.dart';

@freezed
class OrdersState<T> with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = OrderLoading;
  const factory OrdersState.success(List<GroupedOrdersModel> groupedOrders) = OrderSuccess<T>;
  const factory OrdersState.failure(String message) = OrderFailure;
}

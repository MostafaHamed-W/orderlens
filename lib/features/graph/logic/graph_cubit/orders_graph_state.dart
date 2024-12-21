import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orderlens/features/graph/data/models/grouped_orders_graph_model.dart';
part 'orders_graph_state.freezed.dart';

@freezed
class OrdersGraphState<T> with _$OrdersGraphState {
  const factory OrdersGraphState.initial() = _Initial;
  const factory OrdersGraphState.loading() = OrderLoading;
  const factory OrdersGraphState.success(List<GroupedOrdersGraphModel> groupedOrders) = OrderSuccess<T>;
  const factory OrdersGraphState.failure(String message) = OrderFailure;
}

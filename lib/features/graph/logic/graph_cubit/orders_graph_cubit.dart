import 'package:orderlens/features/graph/data/repos/order_graph_repo.dart';
import 'package:orderlens/features/graph/logic/graph_cubit/orders_graph_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersGraphCubit extends Cubit<OrdersGraphState> {
  final OrderGraphRepo _orderGraphRepo;

  OrdersGraphCubit(this._orderGraphRepo) : super(const OrdersGraphState.initial());

  Future<void> fetchOrders() async {
    emit(const OrdersGraphState.loading());
    await Future.delayed(const Duration(milliseconds: 200));

    final result = await _orderGraphRepo.getOrdersGroupedByMonth();
    result.when(
      success: (groupedOrders) => emit(OrdersGraphState.success(groupedOrders)),
      failure: (message) => emit(OrdersGraphState.failure(message)),
    );
  }
}

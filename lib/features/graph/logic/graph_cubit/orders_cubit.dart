import 'package:orderlens/features/graph/data/repos/order_repo.dart';
import 'package:orderlens/features/graph/logic/graph_cubit/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepo _orderRepo;

  OrdersCubit(this._orderRepo) : super(const OrdersState.initial());

  Future<void> fetchOrders() async {
    emit(const OrdersState.loading());
    await Future.delayed(const Duration(milliseconds: 300));

    final result = await _orderRepo.getOrdersGroupedByMonth();
    result.when(
      success: (groupedOrders) => emit(OrdersState.success(groupedOrders)),
      failure: (message) => emit(OrdersState.failure(message)),
    );
  }
}

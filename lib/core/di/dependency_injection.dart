import 'package:get_it/get_it.dart';
import 'package:orderlens/core/services/local_data_service.dart';
import 'package:orderlens/features/graph/data/repos/order_repo.dart';
import 'package:orderlens/features/graph/logic/graph_cubit/orders_cubit.dart';
import 'package:orderlens/features/metrics/data/repos/order_metrics_repo.dart';
import 'package:orderlens/features/metrics/logic/cubit/order_metrics_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register LocalDataService
  final localDataService = LocalDataService();
  getIt.registerLazySingleton<LocalDataService>(() => localDataService);

  //* We made the Cubits ((Only Cubits)) => (registerFactory) not (registerLazySingleton), bsecause (lazySingelton) will make one instance
  //* Then if we disposed that instance it will cause an error if there are controllers inside the cubit
  //* But (registerFactory) will make an instance when we want to use the cubit
  //* As cubits are lazy instances as we do not consume resources when we do this because cubits are lazy
  //* As when we want to use it again it will be mounted, and it distroys itself when it's no longer used

  // Orders
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));
  getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt()));

  getIt.registerLazySingleton<OrderMetricsRepository>(() => OrderMetricsRepository(getIt()));
  getIt.registerFactory<OrderMetricsCubit>(() => OrderMetricsCubit(getIt()));
}

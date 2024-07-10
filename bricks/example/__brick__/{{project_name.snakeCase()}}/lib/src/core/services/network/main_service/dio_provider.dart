part of 'network_service.dart';

@Riverpod(keepAlive: true)
Dio _dio(_DioRef ref) {
  final logger = Logger('Dio')..level = Level.FINEST;
  final sub = logger.onRecord.listen((record) => record.logMessage());

  ref.onDispose(sub.cancel);

  final mainInterceptors = ref.watch(apiInterceptorsProvider);

  final dio = Dio(ApiConfig.baseOptions)
    ..interceptors.addAll([
      ...mainInterceptors,
      if (kDebugMode) dioInterceptor,
    ]);

  return dio;
}

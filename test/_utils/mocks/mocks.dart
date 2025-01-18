import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:task_manager_app/core/network/dio_client.dart';
import 'package:task_manager_app/data/datasources/export_datasources.dart';
import 'package:task_manager_app/domain/repositories/export_repositories.dart';
import 'package:task_manager_app/domain/usecases/export_usecases.dart';

@GenerateMocks([
  DioClient,
  AuthRemoteDataSource,
  AuthLocalDataSource,
  TodoRemoteDataSource,
  TodoLocalDataSource,
  AuthRepository,
  TodoRepository,
  AuthUsecases,
  TodoUsecases,
  Connectivity,
])
void main() {}

const MethodChannel channel = MethodChannel('dev.fluttercommunity.plus/connectivity');

void mockConnectivityChannel() {
  TestWidgetsFlutterBinding.ensureInitialized();
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'check') {
      // Mock the connectivity result; you can change this to test other states.
      return 'wifi'; // Possible values: 'wifi', 'mobile', 'none'.
    }
    return null;
  });
}

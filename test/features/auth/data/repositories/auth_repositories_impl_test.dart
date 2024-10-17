import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:aladia_flutter_test/core/network/network_info.dart';

// Mock class for InternetConnectionChecker
class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

// Mock class for NetworkInfoImpl
class MockNetworkInfoImpl extends Mock implements NetworkInfoImpl {}

void main() {
  late MockInternetConnectionChecker mockConnectionChecker;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    mockConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });

  group('Network Info', () {
    test('should return true when there is an internet connection', () async {
      // Arrange
      when(() => mockConnectionChecker.hasConnection).thenAnswer((_) async => true);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, true);
      verify(() => mockConnectionChecker.hasConnection).called(1);
    });

    test('should return false when there is no internet connection', () async {
      // Arrange
      when(() => mockConnectionChecker.hasConnection).thenAnswer((_) async => false);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, false);
      verify(() => mockConnectionChecker.hasConnection).called(1);
    });
  });
}

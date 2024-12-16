import 'package:class_plan_flutter/core/entity/http_response_entity.dart';
import 'package:class_plan_flutter/core/service/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixture/library/fixture_helper.dart';

final class _MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late final IHttpClient tHttpClient;
  late final String tUrl;
  late final dynamic tDataGet;
  late final dynamic tDataPost;
  late final dynamic tDataPut;
  late final dynamic tDataPatch;

  setUpAll(() {
    tHttpClient = _MockHttpClient();
    tUrl = 'https://api.example.com';
    tDataGet = FixtureHelper.fetchStudentsMap();
    tDataPost = FixtureHelper.fetchStudentsClassA().first.toMap();
    tDataPut = FixtureHelper.fetchStudentsClassA().first.toMap();
    tDataPatch = FixtureHelper.fetchStudentsClassA().first.toMap();
  });

  test('should perform GET request successfully', () async {
    // Arrange
    final tResponse = HttpResponseEntity(statusCode: 200, data: tDataGet);
    when(tHttpClient.get(tUrl)).thenAnswer((_) async => tResponse);

    // Act
    final response = await tHttpClient.get(tUrl)!;

    // Assert
    expect(response.statusCode, 200);
    expect(response.data, tDataGet);
    verify(tHttpClient.get(tUrl)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });

  test('should perform POST request successfully', () async {
    // Arrange
    final tResponse = HttpResponseEntity(statusCode: 201, data: tDataPost);
    when(tHttpClient.post(tUrl, data: tDataPost)).thenAnswer((_) async => tResponse);

    // Act
    final response = await tHttpClient.post(tUrl, data: tDataPost)!;

    // Assert
    expect(response.statusCode, 201);
    expect(response.data, tDataPost);
    verify(tHttpClient.post(tUrl, data: tDataPost)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });

  test('should perform PUT request successfully', () async {
    // Arrange
    final tResponse = HttpResponseEntity(statusCode: 200, data: tDataPut);
    when(tHttpClient.put(tUrl, data: tDataPut)).thenAnswer((_) async => tResponse);

    // Act
    final response = await tHttpClient.put(tUrl, data: tDataPut)!;

    // Assert
    expect(response.statusCode, 200);
    expect(response.data, tDataPut);
    verify(tHttpClient.put(tUrl, data: tDataPut)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });

  test('should perform PATCH request successfully', () async {
    // Arrange
    final tResponse = HttpResponseEntity(statusCode: 200, data: tDataPatch);
    when(tHttpClient.patch(tUrl, data: tDataPatch)).thenAnswer((_) async => tResponse);

    // Act
    final response = await tHttpClient.patch(tUrl, data: tDataPatch)!;

    // Assert
    expect(response.statusCode, 200);
    expect(response.data, tDataPatch);
    verify(tHttpClient.patch(tUrl, data: tDataPatch)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });

  test('should perform DELETE request successfully', () async {
    // Arrange
    final tResponse = HttpResponseEntity(statusCode: 200);
    when(tHttpClient.delete(tUrl)).thenAnswer((_) async => tResponse);

    // Act
    final response = await tHttpClient.delete(tUrl)!;

    // Assert
    expect(response.statusCode, 200);
    verify(tHttpClient.delete(tUrl)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });
}

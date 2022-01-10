// Mocks generated by Mockito 5.0.17 from annotations
// in aula9/test/app/modules/converter/infra/datasources/currency_datasource_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:aula9/app/commons/adapters/http_client/http_client_adapter.dart'
    as _i3;
import 'package:aula9/app/commons/adapters/http_client/http_response.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHttpResponse_0 extends _i1.Fake implements _i2.HttpResponse {}

/// A class which mocks [IHttpClientAdapter].
///
/// See the documentation for Mockito's code generation for more information.
class MockIHttpClientAdapter extends _i1.Mock
    implements _i3.IHttpClientAdapter {
  MockIHttpClientAdapter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HttpResponse> get(String? path,
          {Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [path],
                  {#queryParameters: queryParameters, #headers: headers}),
              returnValue:
                  Future<_i2.HttpResponse>.value(_FakeHttpResponse_0()))
          as _i4.Future<_i2.HttpResponse>);
  @override
  _i4.Future<_i2.HttpResponse> post(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue:
                  Future<_i2.HttpResponse>.value(_FakeHttpResponse_0()))
          as _i4.Future<_i2.HttpResponse>);
  @override
  _i4.Future<_i2.HttpResponse> put(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue:
                  Future<_i2.HttpResponse>.value(_FakeHttpResponse_0()))
          as _i4.Future<_i2.HttpResponse>);
  @override
  _i4.Future<_i2.HttpResponse> delete(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue:
                  Future<_i2.HttpResponse>.value(_FakeHttpResponse_0()))
          as _i4.Future<_i2.HttpResponse>);
}

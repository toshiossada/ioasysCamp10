import 'package:aula9/app/commons/adapters/http_client/http_client_adapter.dart';
import 'package:aula9/app/commons/adapters/http_client/http_response.dart';
import 'package:aula9/app/commons/errors.dart';
import 'package:aula9/app/modules/converter/infra/datasources/currency_datasource.dart';
import 'package:aula9/app/modules/converter/infra/repositories/models/currency_info_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../utils/mock.dart';
import 'currency_datasource_test.mocks.dart';

@GenerateMocks([IHttpClientAdapter])
void main() {
  late CurrencyDataSource _dataSource;
  final _http = MockIHttpClientAdapter();

  setUp(() {
    _dataSource = CurrencyDataSource(httpClient: _http);
  });
  test('currency datasource ...', () async {
    when(_http.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
            (_) async => HttpResponse(statusCode: 200, data: responsePayload));

    var result = await _dataSource.getCurrencies();

    expect(result, isA<CurrencyInfoModel>());
    expect(result.euroValue, 6);
    expect(result.dollarValue, 5);
  });

  test('currency datasource ...', () async {
    when(_http.get(any, queryParameters: anyNamed('queryParameters')))
        .thenThrow(
      (_) async => HttpClientError(
        message: '',
        requestOptions: RequestOptions(path: ''),
        statusCode: 400,
        type: DioErrorType.connectTimeout,
      ),
    );

    var result = _dataSource.getCurrencies();

    expect(result, throwsA(isA<DatasourceError>()));
  });
}

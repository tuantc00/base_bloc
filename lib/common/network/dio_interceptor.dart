import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:clean_architecture_bloc/core/app_extension.dart';
import 'package:clean_architecture_bloc/core/app_style.dart' show logger;

class DioInterceptor extends Interceptor {
  static const int _maxLogLineLength = 120;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('====================START====================');
    buffer.writeln('HTTP method => ${options.method}');
    buffer.writeln('Request => ${options.baseUrl}${options.path}${options.queryParameters.format}');
    _appendSection(buffer, 'Header', _formatData(options.headers));
    _appendSection(buffer, 'Body', _formatData(options.data));
    logger.i(buffer.toString().trimRight());
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final buffer = StringBuffer();
    buffer.writeln('HTTP method => ${options.method}');
    buffer.writeln('Error: ${err.error}, Message: ${err.message}');
    _appendSection(buffer, 'Error data', _formatData(err.response?.data));
    logger.e(buffer.toString().trimRight());
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln('Response => StatusCode: ${response.statusCode}');
    _appendSection(buffer, 'Response Body', _formatData(response.data));
    logger.i(buffer.toString().trimRight());
    return super.onResponse(response, handler);
  }

  void _appendSection(StringBuffer buffer, String label, String content) {
    if (content.isEmpty) return;
    final formatted = _splitLongLines(content, maxLength: _maxLogLineLength);
    final lines = formatted.split('\n');
    for (var i = 0; i < lines.length; i++) {
      final prefix = i == 0 ? '$label => ' : ' '.padRight(label.length + 4);
      buffer.writeln('$prefix${lines[i]}');
    }
  }

  String _formatData(dynamic data) {
    if (data == null) return '';

    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }

      if (data is String) {
        final trimmed = data.trim();
        if (trimmed.isEmpty) return '';
        try {
          final decoded = jsonDecode(trimmed);
          if (decoded is Map || decoded is List) {
            return const JsonEncoder.withIndent('  ').convert(decoded);
          }
        } catch (_) {}
        return trimmed;
      }

      return data.toString();
    } catch (_) {
      return data.toString();
    }
  }

  String _splitLongLines(String input, {int maxLength = 120}) {
    final buffer = StringBuffer();
    for (final rawLine in input.split('\n')) {
      var line = rawLine;
      while (line.length > maxLength) {
        buffer.writeln(line.substring(0, maxLength));
        line = line.substring(maxLength);
      }
      buffer.writeln(line);
    }
    return buffer.toString().trimRight();
  }
}

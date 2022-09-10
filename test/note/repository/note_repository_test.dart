// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: unused_import
import 'package:note_app/features/login/model/search_model.dart';
import 'package:note_app/network/endpoint.dart';
import 'package:note_app/network/repository.dart';

void main() {
  group('Note Repository Test / ', () {
    late NoteRepository _noteRepository;
    setUp(() {
      _noteRepository =
          NoteRepository(Dio(BaseOptions(baseUrl: EndPoint.baseUrl)));
    });
    String? _token;

    test('POST: /login request', () async {
      try {
        final response = await _noteRepository.login('admin', 'admin');

        if (response.message != null) {
          _token = response.message!;
        }

        debugPrint(response.message.toString());
        debugPrint(response.statusCode.toString());

        expect(response.message, isNotNull);
        expect(response.statusCode, equals('200'));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    test('GET: /register request', () async {
      try {
        final response = await _noteRepository.register('admine', 'admine');

        if (response.message != null) {
          _token = response.message!;
        }

        debugPrint(response.message.toString());
        debugPrint(response.statusCode.toString());

        expect(response.message, isNotNull);
        expect(response.statusCode, equals('200'));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    test('GET: /search request', () async {
      try {
        debugPrint(_token.toString());
        expect(_token, isNotNull);
        if (_token != null) {
          final response = await _noteRepository.search(
            name: 't',
            token: _token!,
          );

          debugPrint(response.message.toString());
          debugPrint(response.statusCode.toString());

          expect(response.message, isNotNull);
          expect(response.statusCode, equals('200'));
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });

    test('GET: /getTask request', () async {
      try {
        debugPrint(_token.toString());
        expect(_token, isNotNull);
        if (_token != null) {
          final response = await _noteRepository.taskget();

          debugPrint(response.message.toString());
          debugPrint(response.statusCode.toString());

          expect(response.message, isNotNull);
          expect(response.statusCode, equals('200'));
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  });
}

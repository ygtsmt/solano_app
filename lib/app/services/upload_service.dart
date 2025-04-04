// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:solano_app/core/clients/network/network_client.dart';

// class UploadService {
//   UploadService({required NetworkClient networkClient})
//       : _networkClient = networkClient;
//   final NetworkClient _networkClient;

//   Future<String?> uploadFile(File file) async {
//     final result = await convertFileToFormData(file);
//     if (result == null) return null;
//     final response = await _networkClient
//         .post('https://tradesight-reload.mindmons.com/upload', data: result);

//     if (response.data != null && response.data['url'] != null) {
//       return response.data['url'] as String;
//     }
//     return null;
//   }

//   Future<FormData?> convertFileToFormData(File file) async {
//     if (await file.exists()) {
//       final bytes = await file.readAsBytes();
//       String base64String = base64Encode(bytes);

//       final formData = FormData.fromMap({
//         "file": await MultipartFile.fromFile(file.path,
//             filename: file.path.split('/').last),
//       });

//       return formData;
//     }
//     return null;
//   }
// }

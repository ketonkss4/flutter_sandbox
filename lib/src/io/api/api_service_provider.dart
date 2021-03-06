import 'package:dio/dio.dart';
import 'package:flutter_sandbox/src/io/api/repo_response.dart';

class GithubApiService {
  final String _domain = "https://api.github.com/";
  final Dio _dioClient = Dio();

  Future<RepoResponse> getReposForOrganization(org) async {
    try {
      Response response = await _dioClient.get(_createEndpoint(org));
      List<dynamic> json = response.data[0];
      return RepoResponse.fromJson(json);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RepoResponse.onError(error);
    }
  }

  String _createEndpoint(org) =>
      _domain + "/orgs/$org/repos?type=public?sort=updated?direction=desc";
}

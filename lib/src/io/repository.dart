import 'package:flutter_sandbox/src/io/api/api_service_provider.dart';
import 'package:flutter_sandbox/src/io/api/repo_response.dart';

class Repository {
  final GithubApiService _apiService;

  Repository(this._apiService);

  Future<RepoResponse> getPopularReposForOrg(org) async {
    return await _apiService.getReposForOrganization(org);
  }
}

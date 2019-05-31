import 'package:flutter_sandbox/src/io/models/git_repo_models.dart';

class RepoResponse {
  final List<Repo> results;
  final String error;

  RepoResponse(this.results, this.error);

  RepoResponse.fromJson(List<dynamic> json)
      : results = json.map((i) => new Repo.fromJson(i)).toList(),
        error = null;

  RepoResponse.onError(error)
      : error = error,
        results = List();
}

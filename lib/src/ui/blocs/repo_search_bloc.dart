import 'package:flutter_sandbox/src/io/api/repo_response.dart';
import 'package:flutter_sandbox/src/io/models/git_repo_models.dart';
import 'package:flutter_sandbox/src/ui/models/error_model.dart';
import 'package:flutter_sandbox/src/ui/models/pop_repo.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_sandbox/src/io/repository.dart';

class RepoSearchPageBloc {
  final Repository _repository;
  final BehaviorSubject<SearchData> _resultSubject =
      BehaviorSubject<SearchData>();
  get repoDataObservable => _resultSubject;

  RepoSearchPageBloc(this._repository);

  getPopularRepos(String org) async {
    if (org == null || org.isEmpty)
      return _resultSubject.add(SearchData(List(), null));
    RepoResponse response = await _repository.getPopularReposForOrg(org);
    if (response.error == null) {
      List<Repo> repoList = response.results;
      repoList.sort((a, b) => a.stargazersCount.compareTo(b.stargazersCount));
      List<PopRepo> uiRepoList = _mapToUiModel(repoList);
      _resultSubject.add(SearchData(uiRepoList, null));
    } else {
      ErrorState error = ErrorState(response.error);
      _resultSubject.add(SearchData(List(), error));
    }
  }

  List<PopRepo> _mapToUiModel(List<Repo> repoList) {
    var uiRepoList = repoList
        .map((repo) => PopRepo(repo.owner.avatarUrl, repo.name,
            repo.description, "Stars: ${repo.stargazersCount}"))
        .take(3)
        .toList();
    return uiRepoList;
  }

  dispose() {
    _resultSubject.close();
  }
}

class SearchData {
  final List<PopRepo> results;
  final ErrorState errorState;

  SearchData(this.results, this.errorState);
}

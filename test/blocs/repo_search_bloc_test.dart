import 'dart:async';

import 'package:flutter_sandbox/src/io/api/repo_response.dart';
import 'package:flutter_sandbox/src/io/models/git_repo_models.dart';
import 'package:flutter_sandbox/src/io/repository.dart';
import 'package:flutter_sandbox/src/ui/blocs/repo_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

main() => {
      test('test stream should emit test repo', () async {
        final testOwner = Owner(1010, "testLink");
        final testRepo =
            Repo(101, testOwner, "testRepo", "description", 'htmlUrl', 500);
        final testRepoResponse = RepoResponse(List.from([testRepo]), null);

        final Repository mockRepository = _MockRepository();

        when(mockRepository.getPopularReposForOrg("org"))
            .thenAnswer((_) => Future.value(testRepoResponse));

        final repoSearchBloc = RepoSearchPageBloc(mockRepository);
        await repoSearchBloc.getPopularRepos("org");

        expectLater(
            (await repoSearchBloc.repoDataObservable.stream.first)
                .results[0]
                .repoName,
            testRepo.name);
      }),
      test('test stream should emit 3 test repos', () async {
        final testOwner = Owner(1010, "testLink");
        final testRepo =
            Repo(101, testOwner, "testRepo", "description", 'htmlUrl', 500);
        final testRepo2 =
            Repo(102, testOwner, "testRepo", "description", 'htmlUrl', 400);
        final testRepo3 =
            Repo(103, testOwner, "testRepo", "description", 'htmlUrl', 300);
        final testRepo4 =
            Repo(104, testOwner, "testRepo", "description", 'htmlUrl', 200);

        final testRepoResponse = RepoResponse(
            List.from([testRepo, testRepo2, testRepo3, testRepo4]), null);

        final Repository mockRepository = _MockRepository();

        when(mockRepository.getPopularReposForOrg("org"))
            .thenAnswer((_) => Future.value(testRepoResponse));

        final repoSearchBloc = RepoSearchPageBloc(mockRepository);
        await repoSearchBloc.getPopularRepos("org");

        expectLater(
            (await repoSearchBloc.repoDataObservable.stream.first)
                .results
                .length,
            3);
      })
    };

class _MockRepository extends Mock implements Repository {}

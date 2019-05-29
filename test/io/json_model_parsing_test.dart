import 'package:flutter_sandbox/src/io/models/git_repo_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'dart:io';

main() => {
      test('parse sample repo search json', () async {
        final file = new File('assets/sample_json/sample_repo_search.json');
        final List<dynamic> responseJson = json.decode(await file.readAsString());
        final testRepoJson = responseJson.first;
        final Repo repo = Repo.fromJson(testRepoJson);
        
        expect(repo.name, "cups");
        expect(repo.stargazersCount, 736);
        expect(repo.description, "Official CUPS Sources");
        expect(repo.htmlUrl, "https://github.com/apple/cups");
        expect(repo.id, 44137852);
        expect(repo.owner.id, 10639145);
        expect(repo.owner.avatarUrl, "https://avatars0.githubusercontent.com/u/10639145?v=4");
      })
    };

import 'package:flutter_sandbox/src/io/api/repo_response.dart';
import 'package:flutter_sandbox/src/io/models/git_repo_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'dart:io';

main() => {
      test('parse sample repo search json', () async {
        List sampleJson = await decodeSampleJson();
        final sampleRepoJson = sampleJson.first;
        final Repo repo = Repo.fromJson(sampleRepoJson);

        expect(repo.name, "cups");
        expect(repo.stargazersCount, 736);
        expect(repo.description, "Official CUPS Sources");
        expect(repo.htmlUrl, "https://github.com/apple/cups");
        expect(repo.id, 44137852);
        expect(repo.owner.id, 10639145);
        expect(repo.owner.avatarUrl,
            "https://avatars0.githubusercontent.com/u/10639145?v=4");
      }),
      test('test repo response model parsing', () async {
        List sampleJson = await decodeSampleJson();
        final response = RepoResponse.fromJson(sampleJson);
        expect(response.results.length, 3);
      })
    };

Future<List> decodeSampleJson() async {
  final file = new File('assets/sample_json/sample_repo_search.json');
  final List<dynamic> responseJson = json.decode(await file.readAsString());
  return responseJson;
}

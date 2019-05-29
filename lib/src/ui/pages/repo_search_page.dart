import 'package:flutter/material.dart';
import 'package:flutter_sandbox/src/io/api/api_service_provider.dart';
import 'package:flutter_sandbox/src/io/repository.dart';
import 'package:flutter_sandbox/src/ui/blocs/repo_search_bloc.dart';
import 'package:flutter_sandbox/src/ui/models/pop_repo.dart';

class RepoSearchPage extends StatefulWidget {
  static const String routeName = "/repoSearchPage";

  @override
  State<StatefulWidget> createState() => RepoSearchPageState();
}

class RepoSearchPageState extends State<RepoSearchPage> {
  bool hasLoaded = true;
  List<PopRepo> dataList = List();
  RepoSearchPageBloc bloc =
      new RepoSearchPageBloc(Repository(GithubApiService()));

  @override
  void initState() {
    super.initState();
    bloc.getPopularRepos("");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.repoDataObservable().stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          SearchData data = snapshot.data;
          dataList = data.results;
        });
  }

  Widget _buildSearchPageUi() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Github Repos Searcher"),
      ),
      body: Container(
        
      ),
    );
  }

  Widget _buildLoadingWidget(String org) {
    return Center(
      child: (org != null && org.isNotEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Searching Repos for $org"),
                CircularProgressIndicator()
              ],
            )
          : Container(),
    );
  }
}

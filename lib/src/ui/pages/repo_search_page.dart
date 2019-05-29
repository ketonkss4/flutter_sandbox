import 'package:flutter/material.dart';
import 'package:flutter_sandbox/src/ui/blocs/repo_search_bloc.dart';

class RepoSearchPage extends StatefulWidget {
  static const String routeName = "/repoSearchPage";

  @override
  State<StatefulWidget> createState() => RepoSearchPageState();
  
  }
  
  class RepoSearchPageState extends State<RepoSearchPage> {
    bool hasLoaded = true;
    RepoSearchPageBloc bloc = new RepoSearchPageBloc();  
  @override
  Widget build(BuildContext context) {
    
    return null;
  }
}

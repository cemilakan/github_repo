import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:githubrepo/model/Repo.dart';
import 'dart:io';

String url = 'https://api.github.com/users/cemilakan/repos';
List<Repo> repos;

Future<List<Repo>> getAllRepos() async {
  final response = await http.get(url);
  repos=allReposFromJson(response.body);
  return allReposFromJson(response.body);
}

Future<Repo> getRepo(String author,String repo) async{
  final response = await http.get('/$author/$repo');
  return repoFromJson(response.body);
}

Future<http.Response> createPost(Repo repo) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: repoToJson(repo)
  );
  return response;
}


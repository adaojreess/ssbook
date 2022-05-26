import 'package:desafio_studio_sol/src/models/response_model.dart';
import 'package:desafio_studio_sol/src/services/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/ast.dart';

class APIGraphQL implements API {
  HttpLink httpLink =
      HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL');
  late GraphQLClient client;
  APIGraphQL(this.apiUrl) {
    client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    );
  }

  @override
  String? apiUrl;

  @override
  Future<ResponseModel<QueryResult<Object?>>> get(String path) async {
    final result = await client.query(QueryOptions(document: gql(path)));
    return ResponseModel(response: result);
  }
}

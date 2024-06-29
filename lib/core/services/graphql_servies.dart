import 'package:github_app/core/constents/graphql_query.dart';
import 'package:github_app/core/utils/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class GraphQLServices {
  final GraphQlConfig graphQlConfig;
  late final GraphQLClient client;

  GraphQLServices({required this.graphQlConfig}) {
    client = graphQlConfig.initClient();
  }

  Future<QueryResult> getPopularRepositories() async {
    try {
      final QueryResult result = await client.query(
        QueryOptions(document: gql(popularRepositoryQuery)),
      );

      if (result.hasException) {
        throw result.exception!;
      }
      return result;
    } catch (e) {
      throw Exception("Error with Query: $e");
    }
  }
}



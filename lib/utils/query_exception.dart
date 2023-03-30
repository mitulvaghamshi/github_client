import 'package:gql_exec/gql_exec.dart';

class QueryException implements Exception {
  const QueryException(this.errors);

  final List<GraphQLError> errors;

  @override
  String toString() {
    var error = errors.map((error) => '$error').join(',');
    return 'Query Exception: $error';
  }
}

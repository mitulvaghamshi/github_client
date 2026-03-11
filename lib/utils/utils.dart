import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:github_client/src/github_gql/github_gql.dart';
import 'package:github_client/utils/request_handler.dart';

typedef AuthBuilder =
    Widget Function(
      BuildContext context,
      AsyncCallback onLogout,
      RequestHandler handler,
    );

typedef AsyncList<T> = AsyncValueGetter<Iterable<T>>;

typedef ValueBuilder<T> = Widget Function(BuildContext context, T items);

typedef Viewer = GViewerDetailData_viewer;
typedef Repo = GRepositoriesData_viewer_repositories_nodes;
typedef Issue = GAssignedIssuesData_search_edges_node__asIssue;
typedef PullReq = GPullRequestsData_viewer_pullRequests_edges_node;

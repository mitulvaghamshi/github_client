// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_client/src/github_gql_schema/__generated__/serializers.gql.dart'
    as _i1;

part 'github_queries.var.gql.g.dart';

abstract class GViewerDetailVars
    implements Built<GViewerDetailVars, GViewerDetailVarsBuilder> {
  GViewerDetailVars._();

  factory GViewerDetailVars(
          [void Function(GViewerDetailVarsBuilder b) updates]) =
      _$GViewerDetailVars;

  static Serializer<GViewerDetailVars> get serializer =>
      _$gViewerDetailVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GViewerDetailVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GViewerDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GViewerDetailVars.serializer,
        json,
      );
}

abstract class GPullRequestsVars
    implements Built<GPullRequestsVars, GPullRequestsVarsBuilder> {
  GPullRequestsVars._();

  factory GPullRequestsVars(
          [void Function(GPullRequestsVarsBuilder b) updates]) =
      _$GPullRequestsVars;

  int get count;
  static Serializer<GPullRequestsVars> get serializer =>
      _$gPullRequestsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPullRequestsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPullRequestsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPullRequestsVars.serializer,
        json,
      );
}

abstract class GAssignedIssuesVars
    implements Built<GAssignedIssuesVars, GAssignedIssuesVarsBuilder> {
  GAssignedIssuesVars._();

  factory GAssignedIssuesVars(
          [void Function(GAssignedIssuesVarsBuilder b) updates]) =
      _$GAssignedIssuesVars;

  String get query;
  int get count;
  static Serializer<GAssignedIssuesVars> get serializer =>
      _$gAssignedIssuesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAssignedIssuesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAssignedIssuesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAssignedIssuesVars.serializer,
        json,
      );
}

abstract class GRepositoriesVars
    implements Built<GRepositoriesVars, GRepositoriesVarsBuilder> {
  GRepositoriesVars._();

  factory GRepositoriesVars(
          [void Function(GRepositoriesVarsBuilder b) updates]) =
      _$GRepositoriesVars;

  int get count;
  static Serializer<GRepositoriesVars> get serializer =>
      _$gRepositoriesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRepositoriesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRepositoriesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRepositoriesVars.serializer,
        json,
      );
}

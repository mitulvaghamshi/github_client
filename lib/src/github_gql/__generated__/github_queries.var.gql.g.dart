// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_queries.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerDetailVars> _$gViewerDetailVarsSerializer =
    _$GViewerDetailVarsSerializer();
Serializer<GPullRequestsVars> _$gPullRequestsVarsSerializer =
    _$GPullRequestsVarsSerializer();
Serializer<GAssignedIssuesVars> _$gAssignedIssuesVarsSerializer =
    _$GAssignedIssuesVarsSerializer();
Serializer<GRepositoriesVars> _$gRepositoriesVarsSerializer =
    _$GRepositoriesVarsSerializer();

class _$GViewerDetailVarsSerializer
    implements StructuredSerializer<GViewerDetailVars> {
  @override
  final Iterable<Type> types = const [GViewerDetailVars, _$GViewerDetailVars];
  @override
  final String wireName = 'GViewerDetailVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GViewerDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return GViewerDetailVarsBuilder().build();
  }
}

class _$GPullRequestsVarsSerializer
    implements StructuredSerializer<GPullRequestsVars> {
  @override
  final Iterable<Type> types = const [GPullRequestsVars, _$GPullRequestsVars];
  @override
  final String wireName = 'GPullRequestsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPullRequestsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GPullRequestsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPullRequestsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAssignedIssuesVarsSerializer
    implements StructuredSerializer<GAssignedIssuesVars> {
  @override
  final Iterable<Type> types = const [
    GAssignedIssuesVars,
    _$GAssignedIssuesVars
  ];
  @override
  final String wireName = 'GAssignedIssuesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAssignedIssuesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAssignedIssuesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GAssignedIssuesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GRepositoriesVarsSerializer
    implements StructuredSerializer<GRepositoriesVars> {
  @override
  final Iterable<Type> types = const [GRepositoriesVars, _$GRepositoriesVars];
  @override
  final String wireName = 'GRepositoriesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRepositoriesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GRepositoriesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GRepositoriesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerDetailVars extends GViewerDetailVars {
  factory _$GViewerDetailVars(
          [void Function(GViewerDetailVarsBuilder)? updates]) =>
      (GViewerDetailVarsBuilder()..update(updates))._build();

  _$GViewerDetailVars._() : super._();
  @override
  GViewerDetailVars rebuild(void Function(GViewerDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerDetailVarsBuilder toBuilder() =>
      GViewerDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerDetailVars;
  }

  @override
  int get hashCode {
    return 947680460;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GViewerDetailVars').toString();
  }
}

class GViewerDetailVarsBuilder
    implements Builder<GViewerDetailVars, GViewerDetailVarsBuilder> {
  _$GViewerDetailVars? _$v;

  GViewerDetailVarsBuilder();

  @override
  void replace(GViewerDetailVars other) {
    _$v = other as _$GViewerDetailVars;
  }

  @override
  void update(void Function(GViewerDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerDetailVars build() => _build();

  _$GViewerDetailVars _build() {
    final _$result = _$v ?? _$GViewerDetailVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GPullRequestsVars extends GPullRequestsVars {
  @override
  final int count;

  factory _$GPullRequestsVars(
          [void Function(GPullRequestsVarsBuilder)? updates]) =>
      (GPullRequestsVarsBuilder()..update(updates))._build();

  _$GPullRequestsVars._({required this.count}) : super._();
  @override
  GPullRequestsVars rebuild(void Function(GPullRequestsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPullRequestsVarsBuilder toBuilder() =>
      GPullRequestsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPullRequestsVars && count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPullRequestsVars')
          ..add('count', count))
        .toString();
  }
}

class GPullRequestsVarsBuilder
    implements Builder<GPullRequestsVars, GPullRequestsVarsBuilder> {
  _$GPullRequestsVars? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GPullRequestsVarsBuilder();

  GPullRequestsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPullRequestsVars other) {
    _$v = other as _$GPullRequestsVars;
  }

  @override
  void update(void Function(GPullRequestsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPullRequestsVars build() => _build();

  _$GPullRequestsVars _build() {
    final _$result = _$v ??
        _$GPullRequestsVars._(
          count: BuiltValueNullFieldError.checkNotNull(
              count, r'GPullRequestsVars', 'count'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GAssignedIssuesVars extends GAssignedIssuesVars {
  @override
  final String query;
  @override
  final int count;

  factory _$GAssignedIssuesVars(
          [void Function(GAssignedIssuesVarsBuilder)? updates]) =>
      (GAssignedIssuesVarsBuilder()..update(updates))._build();

  _$GAssignedIssuesVars._({required this.query, required this.count})
      : super._();
  @override
  GAssignedIssuesVars rebuild(
          void Function(GAssignedIssuesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAssignedIssuesVarsBuilder toBuilder() =>
      GAssignedIssuesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAssignedIssuesVars &&
        query == other.query &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, query.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAssignedIssuesVars')
          ..add('query', query)
          ..add('count', count))
        .toString();
  }
}

class GAssignedIssuesVarsBuilder
    implements Builder<GAssignedIssuesVars, GAssignedIssuesVarsBuilder> {
  _$GAssignedIssuesVars? _$v;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GAssignedIssuesVarsBuilder();

  GAssignedIssuesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _query = $v.query;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAssignedIssuesVars other) {
    _$v = other as _$GAssignedIssuesVars;
  }

  @override
  void update(void Function(GAssignedIssuesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAssignedIssuesVars build() => _build();

  _$GAssignedIssuesVars _build() {
    final _$result = _$v ??
        _$GAssignedIssuesVars._(
          query: BuiltValueNullFieldError.checkNotNull(
              query, r'GAssignedIssuesVars', 'query'),
          count: BuiltValueNullFieldError.checkNotNull(
              count, r'GAssignedIssuesVars', 'count'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GRepositoriesVars extends GRepositoriesVars {
  @override
  final int count;

  factory _$GRepositoriesVars(
          [void Function(GRepositoriesVarsBuilder)? updates]) =>
      (GRepositoriesVarsBuilder()..update(updates))._build();

  _$GRepositoriesVars._({required this.count}) : super._();
  @override
  GRepositoriesVars rebuild(void Function(GRepositoriesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRepositoriesVarsBuilder toBuilder() =>
      GRepositoriesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRepositoriesVars && count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRepositoriesVars')
          ..add('count', count))
        .toString();
  }
}

class GRepositoriesVarsBuilder
    implements Builder<GRepositoriesVars, GRepositoriesVarsBuilder> {
  _$GRepositoriesVars? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GRepositoriesVarsBuilder();

  GRepositoriesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRepositoriesVars other) {
    _$v = other as _$GRepositoriesVars;
  }

  @override
  void update(void Function(GRepositoriesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRepositoriesVars build() => _build();

  _$GRepositoriesVars _build() {
    final _$result = _$v ??
        _$GRepositoriesVars._(
          count: BuiltValueNullFieldError.checkNotNull(
              count, r'GRepositoriesVars', 'count'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

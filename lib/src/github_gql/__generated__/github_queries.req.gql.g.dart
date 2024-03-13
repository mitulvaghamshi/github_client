// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_queries.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerDetail> _$gViewerDetailSerializer =
    _$GViewerDetailSerializer();
Serializer<GPullRequests> _$gPullRequestsSerializer =
    _$GPullRequestsSerializer();
Serializer<GAssignedIssues> _$gAssignedIssuesSerializer =
    _$GAssignedIssuesSerializer();
Serializer<GRepositories> _$gRepositoriesSerializer =
    _$GRepositoriesSerializer();

class _$GViewerDetailSerializer implements StructuredSerializer<GViewerDetail> {
  @override
  final Iterable<Type> types = const [GViewerDetail, _$GViewerDetail];
  @override
  final String wireName = 'GViewerDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GViewerDetailVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GViewerDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GViewerDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GViewerDetailVars))!
              as _i3.GViewerDetailVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GPullRequestsSerializer implements StructuredSerializer<GPullRequests> {
  @override
  final Iterable<Type> types = const [GPullRequests, _$GPullRequests];
  @override
  final String wireName = 'GPullRequests';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPullRequests object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPullRequestsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GPullRequests deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPullRequestsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GPullRequestsVars))!
              as _i3.GPullRequestsVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GAssignedIssuesSerializer
    implements StructuredSerializer<GAssignedIssues> {
  @override
  final Iterable<Type> types = const [GAssignedIssues, _$GAssignedIssues];
  @override
  final String wireName = 'GAssignedIssues';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAssignedIssues object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAssignedIssuesVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GAssignedIssues deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GAssignedIssuesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAssignedIssuesVars))!
              as _i3.GAssignedIssuesVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GRepositoriesSerializer implements StructuredSerializer<GRepositories> {
  @override
  final Iterable<Type> types = const [GRepositories, _$GRepositories];
  @override
  final String wireName = 'GRepositories';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRepositories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GRepositoriesVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GRepositories deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GRepositoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GRepositoriesVars))!
              as _i3.GRepositoriesVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerDetail extends GViewerDetail {
  @override
  final _i3.GViewerDetailVars vars;
  @override
  final _i1.Operation operation;

  factory _$GViewerDetail([void Function(GViewerDetailBuilder)? updates]) =>
      (GViewerDetailBuilder()..update(updates))._build();

  _$GViewerDetail._({required this.vars, required this.operation}) : super._();
  @override
  GViewerDetail rebuild(void Function(GViewerDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerDetailBuilder toBuilder() => GViewerDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerDetail &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerDetail')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GViewerDetailBuilder
    implements Builder<GViewerDetail, GViewerDetailBuilder> {
  _$GViewerDetail? _$v;

  _i3.GViewerDetailVarsBuilder? _vars;
  _i3.GViewerDetailVarsBuilder get vars =>
      _$this._vars ??= _i3.GViewerDetailVarsBuilder();
  set vars(_i3.GViewerDetailVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GViewerDetailBuilder() {
    GViewerDetail._initializeBuilder(this);
  }

  GViewerDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerDetail other) {
    _$v = other as _$GViewerDetail;
  }

  @override
  void update(void Function(GViewerDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerDetail build() => _build();

  _$GViewerDetail _build() {
    _$GViewerDetail _$result;
    try {
      _$result = _$v ??
          _$GViewerDetail._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GViewerDetail', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GViewerDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPullRequests extends GPullRequests {
  @override
  final _i3.GPullRequestsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GPullRequests([void Function(GPullRequestsBuilder)? updates]) =>
      (GPullRequestsBuilder()..update(updates))._build();

  _$GPullRequests._({required this.vars, required this.operation}) : super._();
  @override
  GPullRequests rebuild(void Function(GPullRequestsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPullRequestsBuilder toBuilder() => GPullRequestsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPullRequests &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPullRequests')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GPullRequestsBuilder
    implements Builder<GPullRequests, GPullRequestsBuilder> {
  _$GPullRequests? _$v;

  _i3.GPullRequestsVarsBuilder? _vars;
  _i3.GPullRequestsVarsBuilder get vars =>
      _$this._vars ??= _i3.GPullRequestsVarsBuilder();
  set vars(_i3.GPullRequestsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GPullRequestsBuilder() {
    GPullRequests._initializeBuilder(this);
  }

  GPullRequestsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPullRequests other) {
    _$v = other as _$GPullRequests;
  }

  @override
  void update(void Function(GPullRequestsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPullRequests build() => _build();

  _$GPullRequests _build() {
    _$GPullRequests _$result;
    try {
      _$result = _$v ??
          _$GPullRequests._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GPullRequests', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPullRequests', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAssignedIssues extends GAssignedIssues {
  @override
  final _i3.GAssignedIssuesVars vars;
  @override
  final _i1.Operation operation;

  factory _$GAssignedIssues([void Function(GAssignedIssuesBuilder)? updates]) =>
      (GAssignedIssuesBuilder()..update(updates))._build();

  _$GAssignedIssues._({required this.vars, required this.operation})
      : super._();
  @override
  GAssignedIssues rebuild(void Function(GAssignedIssuesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAssignedIssuesBuilder toBuilder() => GAssignedIssuesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAssignedIssues &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAssignedIssues')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GAssignedIssuesBuilder
    implements Builder<GAssignedIssues, GAssignedIssuesBuilder> {
  _$GAssignedIssues? _$v;

  _i3.GAssignedIssuesVarsBuilder? _vars;
  _i3.GAssignedIssuesVarsBuilder get vars =>
      _$this._vars ??= _i3.GAssignedIssuesVarsBuilder();
  set vars(_i3.GAssignedIssuesVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GAssignedIssuesBuilder() {
    GAssignedIssues._initializeBuilder(this);
  }

  GAssignedIssuesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAssignedIssues other) {
    _$v = other as _$GAssignedIssues;
  }

  @override
  void update(void Function(GAssignedIssuesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAssignedIssues build() => _build();

  _$GAssignedIssues _build() {
    _$GAssignedIssues _$result;
    try {
      _$result = _$v ??
          _$GAssignedIssues._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GAssignedIssues', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GAssignedIssues', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GRepositories extends GRepositories {
  @override
  final _i3.GRepositoriesVars vars;
  @override
  final _i1.Operation operation;

  factory _$GRepositories([void Function(GRepositoriesBuilder)? updates]) =>
      (GRepositoriesBuilder()..update(updates))._build();

  _$GRepositories._({required this.vars, required this.operation}) : super._();
  @override
  GRepositories rebuild(void Function(GRepositoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRepositoriesBuilder toBuilder() => GRepositoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRepositories &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRepositories')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GRepositoriesBuilder
    implements Builder<GRepositories, GRepositoriesBuilder> {
  _$GRepositories? _$v;

  _i3.GRepositoriesVarsBuilder? _vars;
  _i3.GRepositoriesVarsBuilder get vars =>
      _$this._vars ??= _i3.GRepositoriesVarsBuilder();
  set vars(_i3.GRepositoriesVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GRepositoriesBuilder() {
    GRepositories._initializeBuilder(this);
  }

  GRepositoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRepositories other) {
    _$v = other as _$GRepositories;
  }

  @override
  void update(void Function(GRepositoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRepositories build() => _build();

  _$GRepositories _build() {
    _$GRepositories _$result;
    try {
      _$result = _$v ??
          _$GRepositories._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GRepositories', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GRepositories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

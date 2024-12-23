// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraftOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(int id) detail,
    required TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)
        addDraft,
    required TResult Function(int id, String status, String paymentStatus)
        editDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(int id)? detail,
    TResult? Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult? Function(int id, String status, String paymentStatus)? editDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(int id)? detail,
    TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult Function(int id, String status, String paymentStatus)? editDraft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Detail value) detail,
    required TResult Function(_AddDraft value) addDraft,
    required TResult Function(_EditDraft value) editDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_AddDraft value)? addDraft,
    TResult? Function(_EditDraft value)? editDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Detail value)? detail,
    TResult Function(_AddDraft value)? addDraft,
    TResult Function(_EditDraft value)? editDraft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftOrderEventCopyWith<$Res> {
  factory $DraftOrderEventCopyWith(
          DraftOrderEvent value, $Res Function(DraftOrderEvent) then) =
      _$DraftOrderEventCopyWithImpl<$Res, DraftOrderEvent>;
}

/// @nodoc
class _$DraftOrderEventCopyWithImpl<$Res, $Val extends DraftOrderEvent>
    implements $DraftOrderEventCopyWith<$Res> {
  _$DraftOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$DraftOrderEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'DraftOrderEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(int id) detail,
    required TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)
        addDraft,
    required TResult Function(int id, String status, String paymentStatus)
        editDraft,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(int id)? detail,
    TResult? Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult? Function(int id, String status, String paymentStatus)? editDraft,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(int id)? detail,
    TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult Function(int id, String status, String paymentStatus)? editDraft,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Detail value) detail,
    required TResult Function(_AddDraft value) addDraft,
    required TResult Function(_EditDraft value) editDraft,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_AddDraft value)? addDraft,
    TResult? Function(_EditDraft value)? editDraft,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Detail value)? detail,
    TResult Function(_AddDraft value)? addDraft,
    TResult Function(_EditDraft value)? editDraft,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DraftOrderEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$DraftOrderEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'DraftOrderEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(int id) detail,
    required TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)
        addDraft,
    required TResult Function(int id, String status, String paymentStatus)
        editDraft,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(int id)? detail,
    TResult? Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult? Function(int id, String status, String paymentStatus)? editDraft,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(int id)? detail,
    TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult Function(int id, String status, String paymentStatus)? editDraft,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Detail value) detail,
    required TResult Function(_AddDraft value) addDraft,
    required TResult Function(_EditDraft value) editDraft,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_AddDraft value)? addDraft,
    TResult? Function(_EditDraft value)? editDraft,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Detail value)? detail,
    TResult Function(_AddDraft value)? addDraft,
    TResult Function(_EditDraft value)? editDraft,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements DraftOrderEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DraftOrderEventCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DetailImpl implements _Detail {
  const _$DetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'DraftOrderEvent.detail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(int id) detail,
    required TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)
        addDraft,
    required TResult Function(int id, String status, String paymentStatus)
        editDraft,
  }) {
    return detail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(int id)? detail,
    TResult? Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult? Function(int id, String status, String paymentStatus)? editDraft,
  }) {
    return detail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(int id)? detail,
    TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult Function(int id, String status, String paymentStatus)? editDraft,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Detail value) detail,
    required TResult Function(_AddDraft value) addDraft,
    required TResult Function(_EditDraft value) editDraft,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_AddDraft value)? addDraft,
    TResult? Function(_EditDraft value)? editDraft,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Detail value)? detail,
    TResult Function(_AddDraft value)? addDraft,
    TResult Function(_EditDraft value)? editDraft,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }
}

abstract class _Detail implements DraftOrderEvent {
  const factory _Detail(final int id) = _$DetailImpl;

  int get id;

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddDraftImplCopyWith<$Res> {
  factory _$$AddDraftImplCopyWith(
          _$AddDraftImpl value, $Res Function(_$AddDraftImpl) then) =
      __$$AddDraftImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int userId,
      String customerNote,
      String orderNumber,
      int total,
      String status,
      String paymentStatus,
      String paymentType,
      List<DraftOrderItemModel> items});
}

/// @nodoc
class __$$AddDraftImplCopyWithImpl<$Res>
    extends _$DraftOrderEventCopyWithImpl<$Res, _$AddDraftImpl>
    implements _$$AddDraftImplCopyWith<$Res> {
  __$$AddDraftImplCopyWithImpl(
      _$AddDraftImpl _value, $Res Function(_$AddDraftImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? customerNote = null,
    Object? orderNumber = null,
    Object? total = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentType = null,
    Object? items = null,
  }) {
    return _then(_$AddDraftImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      customerNote: null == customerNote
          ? _value.customerNote
          : customerNote // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DraftOrderItemModel>,
    ));
  }
}

/// @nodoc

class _$AddDraftImpl implements _AddDraft {
  const _$AddDraftImpl(
      {required this.userId,
      required this.customerNote,
      required this.orderNumber,
      required this.total,
      required this.status,
      required this.paymentStatus,
      required this.paymentType,
      required final List<DraftOrderItemModel> items})
      : _items = items;

  @override
  final int userId;
  @override
  final String customerNote;
  @override
  final String orderNumber;
  @override
  final int total;
  @override
  final String status;
  @override
  final String paymentStatus;
  @override
  final String paymentType;
  final List<DraftOrderItemModel> _items;
  @override
  List<DraftOrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DraftOrderEvent.addDraft(userId: $userId, customerNote: $customerNote, orderNumber: $orderNumber, total: $total, status: $status, paymentStatus: $paymentStatus, paymentType: $paymentType, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDraftImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.customerNote, customerNote) ||
                other.customerNote == customerNote) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      customerNote,
      orderNumber,
      total,
      status,
      paymentStatus,
      paymentType,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDraftImplCopyWith<_$AddDraftImpl> get copyWith =>
      __$$AddDraftImplCopyWithImpl<_$AddDraftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(int id) detail,
    required TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)
        addDraft,
    required TResult Function(int id, String status, String paymentStatus)
        editDraft,
  }) {
    return addDraft(userId, customerNote, orderNumber, total, status,
        paymentStatus, paymentType, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(int id)? detail,
    TResult? Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult? Function(int id, String status, String paymentStatus)? editDraft,
  }) {
    return addDraft?.call(userId, customerNote, orderNumber, total, status,
        paymentStatus, paymentType, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(int id)? detail,
    TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult Function(int id, String status, String paymentStatus)? editDraft,
    required TResult orElse(),
  }) {
    if (addDraft != null) {
      return addDraft(userId, customerNote, orderNumber, total, status,
          paymentStatus, paymentType, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Detail value) detail,
    required TResult Function(_AddDraft value) addDraft,
    required TResult Function(_EditDraft value) editDraft,
  }) {
    return addDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_AddDraft value)? addDraft,
    TResult? Function(_EditDraft value)? editDraft,
  }) {
    return addDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Detail value)? detail,
    TResult Function(_AddDraft value)? addDraft,
    TResult Function(_EditDraft value)? editDraft,
    required TResult orElse(),
  }) {
    if (addDraft != null) {
      return addDraft(this);
    }
    return orElse();
  }
}

abstract class _AddDraft implements DraftOrderEvent {
  const factory _AddDraft(
      {required final int userId,
      required final String customerNote,
      required final String orderNumber,
      required final int total,
      required final String status,
      required final String paymentStatus,
      required final String paymentType,
      required final List<DraftOrderItemModel> items}) = _$AddDraftImpl;

  int get userId;
  String get customerNote;
  String get orderNumber;
  int get total;
  String get status;
  String get paymentStatus;
  String get paymentType;
  List<DraftOrderItemModel> get items;

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDraftImplCopyWith<_$AddDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditDraftImplCopyWith<$Res> {
  factory _$$EditDraftImplCopyWith(
          _$EditDraftImpl value, $Res Function(_$EditDraftImpl) then) =
      __$$EditDraftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String status, String paymentStatus});
}

/// @nodoc
class __$$EditDraftImplCopyWithImpl<$Res>
    extends _$DraftOrderEventCopyWithImpl<$Res, _$EditDraftImpl>
    implements _$$EditDraftImplCopyWith<$Res> {
  __$$EditDraftImplCopyWithImpl(
      _$EditDraftImpl _value, $Res Function(_$EditDraftImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? paymentStatus = null,
  }) {
    return _then(_$EditDraftImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditDraftImpl implements _EditDraft {
  const _$EditDraftImpl(
      {required this.id, required this.status, required this.paymentStatus});

  @override
  final int id;
  @override
  final String status;
  @override
  final String paymentStatus;

  @override
  String toString() {
    return 'DraftOrderEvent.editDraft(id: $id, status: $status, paymentStatus: $paymentStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditDraftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status, paymentStatus);

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditDraftImplCopyWith<_$EditDraftImpl> get copyWith =>
      __$$EditDraftImplCopyWithImpl<_$EditDraftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetch,
    required TResult Function(int id) detail,
    required TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)
        addDraft,
    required TResult Function(int id, String status, String paymentStatus)
        editDraft,
  }) {
    return editDraft(id, status, paymentStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetch,
    TResult? Function(int id)? detail,
    TResult? Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult? Function(int id, String status, String paymentStatus)? editDraft,
  }) {
    return editDraft?.call(id, status, paymentStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetch,
    TResult Function(int id)? detail,
    TResult Function(
            int userId,
            String customerNote,
            String orderNumber,
            int total,
            String status,
            String paymentStatus,
            String paymentType,
            List<DraftOrderItemModel> items)?
        addDraft,
    TResult Function(int id, String status, String paymentStatus)? editDraft,
    required TResult orElse(),
  }) {
    if (editDraft != null) {
      return editDraft(id, status, paymentStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Detail value) detail,
    required TResult Function(_AddDraft value) addDraft,
    required TResult Function(_EditDraft value) editDraft,
  }) {
    return editDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_AddDraft value)? addDraft,
    TResult? Function(_EditDraft value)? editDraft,
  }) {
    return editDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Detail value)? detail,
    TResult Function(_AddDraft value)? addDraft,
    TResult Function(_EditDraft value)? editDraft,
    required TResult orElse(),
  }) {
    if (editDraft != null) {
      return editDraft(this);
    }
    return orElse();
  }
}

abstract class _EditDraft implements DraftOrderEvent {
  const factory _EditDraft(
      {required final int id,
      required final String status,
      required final String paymentStatus}) = _$EditDraftImpl;

  int get id;
  String get status;
  String get paymentStatus;

  /// Create a copy of DraftOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditDraftImplCopyWith<_$EditDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DraftOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftOrderStateCopyWith<$Res> {
  factory $DraftOrderStateCopyWith(
          DraftOrderState value, $Res Function(DraftOrderState) then) =
      _$DraftOrderStateCopyWithImpl<$Res, DraftOrderState>;
}

/// @nodoc
class _$DraftOrderStateCopyWithImpl<$Res, $Val extends DraftOrderState>
    implements $DraftOrderStateCopyWith<$Res> {
  _$DraftOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DraftOrderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DraftOrderState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DraftOrderState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DraftOrderStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DraftOrderState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DraftOrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftOrdersResponseModel data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$DraftOrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DraftOrdersResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.data);

  @override
  final DraftOrdersResponseModel data;

  @override
  String toString() {
    return 'DraftOrderState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements DraftOrderState {
  const factory _Success(final DraftOrdersResponseModel data) = _$SuccessImpl;

  DraftOrdersResponseModel get data;

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessDetailImplCopyWith<$Res> {
  factory _$$SuccessDetailImplCopyWith(
          _$SuccessDetailImpl value, $Res Function(_$SuccessDetailImpl) then) =
      __$$SuccessDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftOrdersDetailResponseModel data});
}

/// @nodoc
class __$$SuccessDetailImplCopyWithImpl<$Res>
    extends _$DraftOrderStateCopyWithImpl<$Res, _$SuccessDetailImpl>
    implements _$$SuccessDetailImplCopyWith<$Res> {
  __$$SuccessDetailImplCopyWithImpl(
      _$SuccessDetailImpl _value, $Res Function(_$SuccessDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessDetailImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DraftOrdersDetailResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessDetailImpl implements _SuccessDetail {
  const _$SuccessDetailImpl(this.data);

  @override
  final DraftOrdersDetailResponseModel data;

  @override
  String toString() {
    return 'DraftOrderState.successDetail(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDetailImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDetailImplCopyWith<_$SuccessDetailImpl> get copyWith =>
      __$$SuccessDetailImplCopyWithImpl<_$SuccessDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) {
    return successDetail(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) {
    return successDetail?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successDetail != null) {
      return successDetail(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) {
    return successDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) {
    return successDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successDetail != null) {
      return successDetail(this);
    }
    return orElse();
  }
}

abstract class _SuccessDetail implements DraftOrderState {
  const factory _SuccessDetail(final DraftOrdersDetailResponseModel data) =
      _$SuccessDetailImpl;

  DraftOrdersDetailResponseModel get data;

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessDetailImplCopyWith<_$SuccessDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCuImplCopyWith<$Res> {
  factory _$$SuccessCuImplCopyWith(
          _$SuccessCuImpl value, $Res Function(_$SuccessCuImpl) then) =
      __$$SuccessCuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftOrderCreateUpdateResponseModel data});
}

/// @nodoc
class __$$SuccessCuImplCopyWithImpl<$Res>
    extends _$DraftOrderStateCopyWithImpl<$Res, _$SuccessCuImpl>
    implements _$$SuccessCuImplCopyWith<$Res> {
  __$$SuccessCuImplCopyWithImpl(
      _$SuccessCuImpl _value, $Res Function(_$SuccessCuImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessCuImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DraftOrderCreateUpdateResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessCuImpl implements _SuccessCu {
  const _$SuccessCuImpl(this.data);

  @override
  final DraftOrderCreateUpdateResponseModel data;

  @override
  String toString() {
    return 'DraftOrderState.successCu(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCuImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCuImplCopyWith<_$SuccessCuImpl> get copyWith =>
      __$$SuccessCuImplCopyWithImpl<_$SuccessCuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) {
    return successCu(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) {
    return successCu?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successCu != null) {
      return successCu(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) {
    return successCu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) {
    return successCu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successCu != null) {
      return successCu(this);
    }
    return orElse();
  }
}

abstract class _SuccessCu implements DraftOrderState {
  const factory _SuccessCu(final DraftOrderCreateUpdateResponseModel data) =
      _$SuccessCuImpl;

  DraftOrderCreateUpdateResponseModel get data;

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessCuImplCopyWith<_$SuccessCuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$DraftOrderStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DraftOrderState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DraftOrdersResponseModel data) success,
    required TResult Function(DraftOrdersDetailResponseModel data)
        successDetail,
    required TResult Function(DraftOrderCreateUpdateResponseModel data)
        successCu,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DraftOrdersResponseModel data)? success,
    TResult? Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult? Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DraftOrdersResponseModel data)? success,
    TResult Function(DraftOrdersDetailResponseModel data)? successDetail,
    TResult Function(DraftOrderCreateUpdateResponseModel data)? successCu,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_SuccessDetail value) successDetail,
    required TResult Function(_SuccessCu value) successCu,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_SuccessDetail value)? successDetail,
    TResult? Function(_SuccessCu value)? successCu,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_SuccessDetail value)? successDetail,
    TResult Function(_SuccessCu value)? successCu,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements DraftOrderState {
  const factory _Failed(final String message) = _$FailedImpl;

  String get message;

  /// Create a copy of DraftOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

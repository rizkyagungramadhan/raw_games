// Mocks generated by Mockito 5.4.0 from annotations
// in raw_games/test/mock/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:dio/dio.dart' as _i6;
import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter/material.dart' as _i2;
import 'package:flutter/src/widgets/notification_listener.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:raw_games/api/client/dio_client.dart' as _i16;
import 'package:raw_games/api/interface/response_list.dart' as _i4;
import 'package:raw_games/api/repository/game/game_repository.dart' as _i8;
import 'package:raw_games/api/repository/game/model/game_detail/game_detail_response.dart'
    as _i5;
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_request.dart'
    as _i13;
import 'package:raw_games/api/repository/game/model/game_detail/game_screenshot_response.dart'
    as _i12;
import 'package:raw_games/api/repository/game/model/game_request.dart' as _i11;
import 'package:raw_games/api/repository/game/model/game_response.dart' as _i10;
import 'package:raw_games/utils/router/app_router.dart' as _i14;
import 'package:raw_games/utils/router/route_definition.dart' as _i15;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWidget_0 extends _i1.SmartFake implements _i2.Widget {
  _FakeWidget_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_1 extends _i1.SmartFake
    implements _i2.InheritedWidget {
  _FakeInheritedWidget_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_2 extends _i1.SmartFake
    implements _i3.DiagnosticsNode {
  _FakeDiagnosticsNode_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i3.TextTreeConfiguration? parentConfiguration,
    _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeResponseList_3<T> extends _i1.SmartFake
    implements _i4.ResponseList<T> {
  _FakeResponseList_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGameDetailResponse_4 extends _i1.SmartFake
    implements _i5.GameDetailResponse {
  _FakeGameDetailResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGlobalKey_5<T extends _i2.State<_i2.StatefulWidget>>
    extends _i1.SmartFake implements _i2.GlobalKey<T> {
  _FakeGlobalKey_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_6<T> extends _i1.SmartFake implements _i6.Response<T> {
  _FakeResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i2.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Widget get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeWidget_0(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i2.Widget);
  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);
  @override
  bool get debugDoingBuild => (super.noSuchMethod(
        Invocation.getter(#debugDoingBuild),
        returnValue: false,
      ) as bool);
  @override
  _i2.InheritedWidget dependOnInheritedElement(
    _i2.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #dependOnInheritedElement,
          [ancestor],
          {#aspect: aspect},
        ),
        returnValue: _FakeInheritedWidget_1(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
      ) as _i2.InheritedWidget);
  @override
  void visitAncestorElements(bool Function(_i2.Element)? visitor) =>
      super.noSuchMethod(
        Invocation.method(
          #visitAncestorElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void visitChildElements(_i2.ElementVisitor? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispatchNotification(_i7.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(
          #dispatchNotification,
          [notification],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DiagnosticsNode describeElement(
    String? name, {
    _i3.DiagnosticsTreeStyle? style = _i3.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeElement,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_2(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
      ) as _i3.DiagnosticsNode);
  @override
  _i3.DiagnosticsNode describeWidget(
    String? name, {
    _i3.DiagnosticsTreeStyle? style = _i3.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeWidget,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_2(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
      ) as _i3.DiagnosticsNode);
  @override
  List<_i3.DiagnosticsNode> describeMissingAncestor(
          {required Type? expectedAncestorType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeMissingAncestor,
          [],
          {#expectedAncestorType: expectedAncestorType},
        ),
        returnValue: <_i3.DiagnosticsNode>[],
      ) as List<_i3.DiagnosticsNode>);
  @override
  _i3.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeOwnershipChain,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_2(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
      ) as _i3.DiagnosticsNode);
}

/// A class which mocks [GameRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameRepository extends _i1.Mock implements _i8.GameRepository {
  MockGameRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i4.ResponseList<_i10.GameResponse>> getListOfGames(
          _i11.GameRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfGames,
          [request],
        ),
        returnValue: _i9.Future<_i4.ResponseList<_i10.GameResponse>>.value(
            _FakeResponseList_3<_i10.GameResponse>(
          this,
          Invocation.method(
            #getListOfGames,
            [request],
          ),
        )),
      ) as _i9.Future<_i4.ResponseList<_i10.GameResponse>>);
  @override
  _i9.Future<_i5.GameDetailResponse> getDetail({required int? gameId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetail,
          [],
          {#gameId: gameId},
        ),
        returnValue:
            _i9.Future<_i5.GameDetailResponse>.value(_FakeGameDetailResponse_4(
          this,
          Invocation.method(
            #getDetail,
            [],
            {#gameId: gameId},
          ),
        )),
      ) as _i9.Future<_i5.GameDetailResponse>);
  @override
  _i9.Future<_i4.ResponseList<_i12.GameScreenshotResponse>> getScreenshots(
          _i13.GameScreenshotRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScreenshots,
          [request],
        ),
        returnValue:
            _i9.Future<_i4.ResponseList<_i12.GameScreenshotResponse>>.value(
                _FakeResponseList_3<_i12.GameScreenshotResponse>(
          this,
          Invocation.method(
            #getScreenshots,
            [request],
          ),
        )),
      ) as _i9.Future<_i4.ResponseList<_i12.GameScreenshotResponse>>);
}

/// A class which mocks [AppRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends _i1.Mock implements _i14.AppRouter {
  MockAppRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GlobalKey<_i2.NavigatorState> get rootNavigationKey =>
      (super.noSuchMethod(
        Invocation.getter(#rootNavigationKey),
        returnValue: _FakeGlobalKey_5<_i2.NavigatorState>(
          this,
          Invocation.getter(#rootNavigationKey),
        ),
      ) as _i2.GlobalKey<_i2.NavigatorState>);
  @override
  set rootNavigationKey(
          _i2.GlobalKey<_i2.NavigatorState>? _rootNavigationKey) =>
      super.noSuchMethod(
        Invocation.setter(
          #rootNavigationKey,
          _rootNavigationKey,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Route<dynamic>? generateRoute(_i2.RouteSettings? settings) =>
      (super.noSuchMethod(Invocation.method(
        #generateRoute,
        [settings],
      )) as _i2.Route<dynamic>?);
  @override
  bool isRouteMatchFromSetting(
    _i15.RouteDefinition<dynamic>? route,
    _i2.RouteSettings? settings,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isRouteMatchFromSetting,
          [
            route,
            settings,
          ],
        ),
        returnValue: false,
      ) as bool);
  @override
  void registerRoute(
    _i15.RouteDefinition<dynamic>? routeDefinition,
    _i14.RouteBuilder? builder,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #registerRoute,
          [
            routeDefinition,
            builder,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<dynamic> rootNavigateTo(
    _i15.RouteDefinition<dynamic>? route, [
    dynamic args,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #rootNavigateTo,
          [
            route,
            args,
          ],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> rootClearAndNavigateTo(
    _i15.RouteDefinition<dynamic>? route, [
    dynamic args,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #rootClearAndNavigateTo,
          [
            route,
            args,
          ],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
  @override
  void rootGoBack() => super.noSuchMethod(
        Invocation.method(
          #rootGoBack,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void rootGoBackToRoot() => super.noSuchMethod(
        Invocation.method(
          #rootGoBackToRoot,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DioClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i16.DioClient {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i6.Response<dynamic>> get(
    String? uriPath, {
    Map<String, dynamic>? queryParameters,
    _i6.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [uriPath],
          {
            #queryParameters: queryParameters,
            #options: options,
          },
        ),
        returnValue:
            _i9.Future<_i6.Response<dynamic>>.value(_FakeResponse_6<dynamic>(
          this,
          Invocation.method(
            #get,
            [uriPath],
            {
              #queryParameters: queryParameters,
              #options: options,
            },
          ),
        )),
      ) as _i9.Future<_i6.Response<dynamic>>);
  @override
  _i9.Future<_i6.Response<dynamic>> post(
    String? uriPath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i6.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [uriPath],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
          },
        ),
        returnValue:
            _i9.Future<_i6.Response<dynamic>>.value(_FakeResponse_6<dynamic>(
          this,
          Invocation.method(
            #post,
            [uriPath],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
            },
          ),
        )),
      ) as _i9.Future<_i6.Response<dynamic>>);
}
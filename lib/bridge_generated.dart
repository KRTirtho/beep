// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors

import 'dart:convert';
import 'dart:typed_data';

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'dart:ffi' as ffi;

abstract class Native {
  Future<void> initPlayer({dynamic hint});

  Future<void> play({required String path, dynamic hint});

  Future<void> pause({dynamic hint});

  Future<void> shuffle({dynamic hint});

  Future<void> setVolume({required int volume, dynamic hint});

  Future<void> setSpeed({required double speed, dynamic hint});

  Future<int> getVolume({dynamic hint});

  Future<double> getSpeed({dynamic hint});

  Future<void> togglePlayback({dynamic hint});

  Future<void> resume({dynamic hint});

  Future<double> duration({dynamic hint});

  Future<int> elapsed({dynamic hint});

  Stream<Float64List> progressStream({dynamic hint});
}

class NativeImpl extends FlutterRustBridgeBase<NativeWire> implements Native {
  factory NativeImpl(ffi.DynamicLibrary dylib) =>
      NativeImpl.raw(NativeWire(dylib));

  NativeImpl.raw(NativeWire inner) : super(inner);

  Future<void> initPlayer({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_init_player(port_),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "init_player",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<void> play({required String path, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_play(port_, _api2wire_String(path)),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "play",
          argNames: ["path"],
        ),
        argValues: [path],
        hint: hint,
      ));

  Future<void> pause({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_pause(port_),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "pause",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<void> shuffle({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_shuffle(port_),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "shuffle",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<void> setVolume({required int volume, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_set_volume(port_, _api2wire_i32(volume)),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "set_volume",
          argNames: ["volume"],
        ),
        argValues: [volume],
        hint: hint,
      ));

  Future<void> setSpeed({required double speed, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_set_speed(port_, _api2wire_f32(speed)),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "set_speed",
          argNames: ["speed"],
        ),
        argValues: [speed],
        hint: hint,
      ));

  Future<int> getVolume({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_get_volume(port_),
        parseSuccessData: _wire2api_i32,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "get_volume",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<double> getSpeed({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_get_speed(port_),
        parseSuccessData: _wire2api_f32,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "get_speed",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<void> togglePlayback({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_toggle_playback(port_),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "toggle_playback",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<void> resume({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_resume(port_),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "resume",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<double> duration({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_duration(port_),
        parseSuccessData: _wire2api_f64,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "duration",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<int> elapsed({dynamic hint}) => executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_elapsed(port_),
        parseSuccessData: _wire2api_u64,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "elapsed",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Stream<Float64List> progressStream({dynamic hint}) =>
      executeStream(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_progress_stream(port_),
        parseSuccessData: _wire2api_float_64_list,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "progress_stream",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  // Section: api2wire
  ffi.Pointer<wire_uint_8_list> _api2wire_String(String raw) {
    return _api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  double _api2wire_f32(double raw) {
    return raw;
  }

  int _api2wire_i32(int raw) {
    return raw;
  }

  int _api2wire_u8(int raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  // Section: api_fill_to_wire

}

// Section: wire2api
double _wire2api_f32(dynamic raw) {
  return raw as double;
}

double _wire2api_f64(dynamic raw) {
  return raw as double;
}

Float64List _wire2api_float_64_list(dynamic raw) {
  return raw as Float64List;
}

int _wire2api_i32(dynamic raw) {
  return raw as int;
}

int _wire2api_u64(dynamic raw) {
  return raw as int;
}

void _wire2api_unit(dynamic raw) {
  return;
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class NativeWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void wire_init_player(
    int port_,
  ) {
    return _wire_init_player(
      port_,
    );
  }

  late final _wire_init_playerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_init_player');
  late final _wire_init_player =
      _wire_init_playerPtr.asFunction<void Function(int)>();

  void wire_play(
    int port_,
    ffi.Pointer<wire_uint_8_list> path,
  ) {
    return _wire_play(
      port_,
      path,
    );
  }

  late final _wire_playPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_play');
  late final _wire_play = _wire_playPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_pause(
    int port_,
  ) {
    return _wire_pause(
      port_,
    );
  }

  late final _wire_pausePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_pause');
  late final _wire_pause = _wire_pausePtr.asFunction<void Function(int)>();

  void wire_shuffle(
    int port_,
  ) {
    return _wire_shuffle(
      port_,
    );
  }

  late final _wire_shufflePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_shuffle');
  late final _wire_shuffle = _wire_shufflePtr.asFunction<void Function(int)>();

  void wire_set_volume(
    int port_,
    int volume,
  ) {
    return _wire_set_volume(
      port_,
      volume,
    );
  }

  late final _wire_set_volumePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>(
          'wire_set_volume');
  late final _wire_set_volume =
      _wire_set_volumePtr.asFunction<void Function(int, int)>();

  void wire_set_speed(
    int port_,
    double speed,
  ) {
    return _wire_set_speed(
      port_,
      speed,
    );
  }

  late final _wire_set_speedPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Float)>>(
          'wire_set_speed');
  late final _wire_set_speed =
      _wire_set_speedPtr.asFunction<void Function(int, double)>();

  void wire_get_volume(
    int port_,
  ) {
    return _wire_get_volume(
      port_,
    );
  }

  late final _wire_get_volumePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_volume');
  late final _wire_get_volume =
      _wire_get_volumePtr.asFunction<void Function(int)>();

  void wire_get_speed(
    int port_,
  ) {
    return _wire_get_speed(
      port_,
    );
  }

  late final _wire_get_speedPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_speed');
  late final _wire_get_speed =
      _wire_get_speedPtr.asFunction<void Function(int)>();

  void wire_toggle_playback(
    int port_,
  ) {
    return _wire_toggle_playback(
      port_,
    );
  }

  late final _wire_toggle_playbackPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_toggle_playback');
  late final _wire_toggle_playback =
      _wire_toggle_playbackPtr.asFunction<void Function(int)>();

  void wire_resume(
    int port_,
  ) {
    return _wire_resume(
      port_,
    );
  }

  late final _wire_resumePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_resume');
  late final _wire_resume = _wire_resumePtr.asFunction<void Function(int)>();

  void wire_duration(
    int port_,
  ) {
    return _wire_duration(
      port_,
    );
  }

  late final _wire_durationPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_duration');
  late final _wire_duration =
      _wire_durationPtr.asFunction<void Function(int)>();

  void wire_elapsed(
    int port_,
  ) {
    return _wire_elapsed(
      port_,
    );
  }

  late final _wire_elapsedPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_elapsed');
  late final _wire_elapsed = _wire_elapsedPtr.asFunction<void Function(int)>();

  void wire_progress_stream(
    int port_,
  ) {
    return _wire_progress_stream(
      port_,
    );
  }

  late final _wire_progress_streamPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_progress_stream');
  late final _wire_progress_stream =
      _wire_progress_streamPtr.asFunction<void Function(int)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Uint8 Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;

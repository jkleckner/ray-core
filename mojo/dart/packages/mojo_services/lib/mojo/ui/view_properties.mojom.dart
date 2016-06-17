// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library view_properties_mojom;
import 'package:mojo/bindings.dart' as bindings;

import 'package:mojo_services/mojo/geometry.mojom.dart' as geometry_mojom;



class ViewProperties extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  DisplayMetrics displayMetrics = null;
  ViewLayout viewLayout = null;

  ViewProperties() : super(kVersions.last.size);

  ViewProperties.init(
    DisplayMetrics this.displayMetrics, 
    ViewLayout this.viewLayout
  ) : super(kVersions.last.size);

  static ViewProperties deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static ViewProperties decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewProperties result = new ViewProperties();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.displayMetrics = DisplayMetrics.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.viewLayout = ViewLayout.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "ViewProperties";
    String fieldName;
    try {
      fieldName = "displayMetrics";
      encoder0.encodeStruct(displayMetrics, 8, true);
      fieldName = "viewLayout";
      encoder0.encodeStruct(viewLayout, 16, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "ViewProperties("
           "displayMetrics: $displayMetrics" ", "
           "viewLayout: $viewLayout" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["displayMetrics"] = displayMetrics;
    map["viewLayout"] = viewLayout;
    return map;
  }
}


class DisplayMetrics extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  double devicePixelRatio = 1.0;

  DisplayMetrics() : super(kVersions.last.size);

  DisplayMetrics.init(
    double this.devicePixelRatio
  ) : super(kVersions.last.size);

  static DisplayMetrics deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static DisplayMetrics decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DisplayMetrics result = new DisplayMetrics();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.devicePixelRatio = decoder0.decodeFloat(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "DisplayMetrics";
    String fieldName;
    try {
      fieldName = "devicePixelRatio";
      encoder0.encodeFloat(devicePixelRatio, 8);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "DisplayMetrics("
           "devicePixelRatio: $devicePixelRatio" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["devicePixelRatio"] = devicePixelRatio;
    return map;
  }
}


class ViewLayout extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  geometry_mojom.Size size = null;

  ViewLayout() : super(kVersions.last.size);

  ViewLayout.init(
    geometry_mojom.Size this.size
  ) : super(kVersions.last.size);

  static ViewLayout deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static ViewLayout decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewLayout result = new ViewLayout();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "ViewLayout";
    String fieldName;
    try {
      fieldName = "size";
      encoder0.encodeStruct(size, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "ViewLayout("
           "size: $size" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["size"] = size;
    return map;
  }
}




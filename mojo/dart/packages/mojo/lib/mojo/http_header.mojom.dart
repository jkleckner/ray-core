// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library http_header_mojom;
import 'package:mojo/bindings.dart' as bindings;




class HttpHeader extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String name = null;
  String value = null;

  HttpHeader() : super(kVersions.last.size);

  HttpHeader.init(
    String this.name, 
    String this.value
  ) : super(kVersions.last.size);

  static HttpHeader deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static HttpHeader decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpHeader result = new HttpHeader();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.name = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "HttpHeader";
    String fieldName;
    try {
      fieldName = "name";
      encoder0.encodeString(name, 8, false);
      fieldName = "value";
      encoder0.encodeString(value, 16, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "HttpHeader("
           "name: $name" ", "
           "value: $value" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["name"] = name;
    map["value"] = value;
    return map;
  }
}




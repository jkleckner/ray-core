// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library versioning_test_client_mojom;
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/mojom_types.mojom.dart' as mojom_types;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;

class Department extends bindings.MojoEnum {
  static const Department sales = const Department._(0);
  static const Department dev = const Department._(1);

  const Department._(int v) : super(v);

  static const Map<String, Department> valuesMap = const {
    "sales": sales,
    "dev": dev,
  };
  static const List<Department> values = const [
    sales,
    dev,
  ];

  static Department valueOf(String name) => valuesMap[name];

  factory Department(int v) {
    switch (v) {
      case 0:
        return Department.sales;
      case 1:
        return Department.dev;
      default:
        return null;
    }
  }

  static Department decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    Department result = new Department(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum Department.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case sales:
        return 'Department.sales';
      case dev:
        return 'Department.dev';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}



class Employee extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  int employeeId = 0;
  String name = null;
  Department department = null;

  Employee() : super(kVersions.last.size);

  Employee.init(
    int this.employeeId, 
    String this.name, 
    Department this.department
  ) : super(kVersions.last.size);

  static Employee deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static Employee decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Employee result = new Employee();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.employeeId = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.name = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
        result.department = Department.decode(decoder0, 24);
        if (result.department == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable Department.');
        }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "Employee";
    String fieldName;
    try {
      fieldName = "employeeId";
      encoder0.encodeUint64(employeeId, 8);
      fieldName = "name";
      encoder0.encodeString(name, 16, false);
      fieldName = "department";
      encoder0.encodeEnum(department, 24);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "Employee("
           "employeeId: $employeeId" ", "
           "name: $name" ", "
           "department: $department" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["employeeId"] = employeeId;
    map["name"] = name;
    map["department"] = department;
    return map;
  }
}


class _HumanResourceDatabaseAddEmployeeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Employee employee = null;

  _HumanResourceDatabaseAddEmployeeParams() : super(kVersions.last.size);

  _HumanResourceDatabaseAddEmployeeParams.init(
    Employee this.employee
  ) : super(kVersions.last.size);

  static _HumanResourceDatabaseAddEmployeeParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _HumanResourceDatabaseAddEmployeeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _HumanResourceDatabaseAddEmployeeParams result = new _HumanResourceDatabaseAddEmployeeParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.employee = Employee.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_HumanResourceDatabaseAddEmployeeParams";
    String fieldName;
    try {
      fieldName = "employee";
      encoder0.encodeStruct(employee, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_HumanResourceDatabaseAddEmployeeParams("
           "employee: $employee" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["employee"] = employee;
    return map;
  }
}


class HumanResourceDatabaseAddEmployeeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool success = false;

  HumanResourceDatabaseAddEmployeeResponseParams() : super(kVersions.last.size);

  HumanResourceDatabaseAddEmployeeResponseParams.init(
    bool this.success
  ) : super(kVersions.last.size);

  static HumanResourceDatabaseAddEmployeeResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static HumanResourceDatabaseAddEmployeeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseAddEmployeeResponseParams result = new HumanResourceDatabaseAddEmployeeResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "HumanResourceDatabaseAddEmployeeResponseParams";
    String fieldName;
    try {
      fieldName = "success";
      encoder0.encodeBool(success, 8, 0);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "HumanResourceDatabaseAddEmployeeResponseParams("
           "success: $success" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["success"] = success;
    return map;
  }
}


class _HumanResourceDatabaseQueryEmployeeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0),
    const bindings.StructDataHeader(24, 1)
  ];
  int id = 0;
  bool retrieveFingerPrint = false;

  _HumanResourceDatabaseQueryEmployeeParams() : super(kVersions.last.size);

  _HumanResourceDatabaseQueryEmployeeParams.init(
    int this.id, 
    bool this.retrieveFingerPrint
  ) : super(kVersions.last.size);

  static _HumanResourceDatabaseQueryEmployeeParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _HumanResourceDatabaseQueryEmployeeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _HumanResourceDatabaseQueryEmployeeParams result = new _HumanResourceDatabaseQueryEmployeeParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.id = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 1) {
      
      result.retrieveFingerPrint = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_HumanResourceDatabaseQueryEmployeeParams";
    String fieldName;
    try {
      fieldName = "id";
      encoder0.encodeUint64(id, 8);
      fieldName = "retrieveFingerPrint";
      encoder0.encodeBool(retrieveFingerPrint, 16, 0);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_HumanResourceDatabaseQueryEmployeeParams("
           "id: $id" ", "
           "retrieveFingerPrint: $retrieveFingerPrint" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["id"] = id;
    map["retrieveFingerPrint"] = retrieveFingerPrint;
    return map;
  }
}


class HumanResourceDatabaseQueryEmployeeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0),
    const bindings.StructDataHeader(24, 1)
  ];
  Employee employee = null;
  List<int> fingerPrint = null;

  HumanResourceDatabaseQueryEmployeeResponseParams() : super(kVersions.last.size);

  HumanResourceDatabaseQueryEmployeeResponseParams.init(
    Employee this.employee, 
    List<int> this.fingerPrint
  ) : super(kVersions.last.size);

  static HumanResourceDatabaseQueryEmployeeResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static HumanResourceDatabaseQueryEmployeeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseQueryEmployeeResponseParams result = new HumanResourceDatabaseQueryEmployeeResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.employee = Employee.decode(decoder1);
    }
    if (mainDataHeader.version >= 1) {
      
      result.fingerPrint = decoder0.decodeUint8Array(16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "HumanResourceDatabaseQueryEmployeeResponseParams";
    String fieldName;
    try {
      fieldName = "employee";
      encoder0.encodeStruct(employee, 8, true);
      fieldName = "fingerPrint";
      encoder0.encodeUint8Array(fingerPrint, 16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "HumanResourceDatabaseQueryEmployeeResponseParams("
           "employee: $employee" ", "
           "fingerPrint: $fingerPrint" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["employee"] = employee;
    map["fingerPrint"] = fingerPrint;
    return map;
  }
}


class _HumanResourceDatabaseAttachFingerPrintParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int id = 0;
  List<int> fingerPrint = null;

  _HumanResourceDatabaseAttachFingerPrintParams() : super(kVersions.last.size);

  _HumanResourceDatabaseAttachFingerPrintParams.init(
    int this.id, 
    List<int> this.fingerPrint
  ) : super(kVersions.last.size);

  static _HumanResourceDatabaseAttachFingerPrintParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _HumanResourceDatabaseAttachFingerPrintParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _HumanResourceDatabaseAttachFingerPrintParams result = new _HumanResourceDatabaseAttachFingerPrintParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.id = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.fingerPrint = decoder0.decodeUint8Array(16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_HumanResourceDatabaseAttachFingerPrintParams";
    String fieldName;
    try {
      fieldName = "id";
      encoder0.encodeUint64(id, 8);
      fieldName = "fingerPrint";
      encoder0.encodeUint8Array(fingerPrint, 16, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_HumanResourceDatabaseAttachFingerPrintParams("
           "id: $id" ", "
           "fingerPrint: $fingerPrint" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["id"] = id;
    map["fingerPrint"] = fingerPrint;
    return map;
  }
}


class HumanResourceDatabaseAttachFingerPrintResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool success = false;

  HumanResourceDatabaseAttachFingerPrintResponseParams() : super(kVersions.last.size);

  HumanResourceDatabaseAttachFingerPrintResponseParams.init(
    bool this.success
  ) : super(kVersions.last.size);

  static HumanResourceDatabaseAttachFingerPrintResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static HumanResourceDatabaseAttachFingerPrintResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseAttachFingerPrintResponseParams result = new HumanResourceDatabaseAttachFingerPrintResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "HumanResourceDatabaseAttachFingerPrintResponseParams";
    String fieldName;
    try {
      fieldName = "success";
      encoder0.encodeBool(success, 8, 0);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "HumanResourceDatabaseAttachFingerPrintResponseParams("
           "success: $success" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["success"] = success;
    return map;
  }
}


class _HumanResourceDatabaseListEmployeeIdsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _HumanResourceDatabaseListEmployeeIdsParams() : super(kVersions.last.size);

  _HumanResourceDatabaseListEmployeeIdsParams.init(
  ) : super(kVersions.last.size);

  static _HumanResourceDatabaseListEmployeeIdsParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _HumanResourceDatabaseListEmployeeIdsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _HumanResourceDatabaseListEmployeeIdsParams result = new _HumanResourceDatabaseListEmployeeIdsParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_HumanResourceDatabaseListEmployeeIdsParams";
    String fieldName;
    try {
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_HumanResourceDatabaseListEmployeeIdsParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class HumanResourceDatabaseListEmployeeIdsResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<int> ids = null;

  HumanResourceDatabaseListEmployeeIdsResponseParams() : super(kVersions.last.size);

  HumanResourceDatabaseListEmployeeIdsResponseParams.init(
    List<int> this.ids
  ) : super(kVersions.last.size);

  static HumanResourceDatabaseListEmployeeIdsResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static HumanResourceDatabaseListEmployeeIdsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HumanResourceDatabaseListEmployeeIdsResponseParams result = new HumanResourceDatabaseListEmployeeIdsResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.ids = decoder0.decodeUint64Array(8, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "HumanResourceDatabaseListEmployeeIdsResponseParams";
    String fieldName;
    try {
      fieldName = "ids";
      encoder0.encodeUint64Array(ids, 8, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "HumanResourceDatabaseListEmployeeIdsResponseParams("
           "ids: $ids" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["ids"] = ids;
    return map;
  }
}

const int _humanResourceDatabaseMethodAddEmployeeName = 0;
const int _humanResourceDatabaseMethodQueryEmployeeName = 1;
const int _humanResourceDatabaseMethodAttachFingerPrintName = 2;
const int _humanResourceDatabaseMethodListEmployeeIdsName = 3;

class _HumanResourceDatabaseServiceDescription implements service_describer.ServiceDescription {
  void getTopLevelInterface(Function responder){
    var interfaceTypeKey = getRuntimeTypeInfo().services["mojo::test::versioning::HumanResourceDatabase"];
    var userDefinedType = getAllMojomTypeDefinitions()[interfaceTypeKey];
    responder(userDefinedType.interfaceType);
  }

  void getTypeDefinition(String typeKey, Function responder) {
    responder(getAllMojomTypeDefinitions()[typeKey]);
  }

  void getAllTypeDefinitions(Function responder) {
    responder(getAllMojomTypeDefinitions());
  }
}

abstract class HumanResourceDatabase {
  static const String serviceName = "mojo::test::versioning::HumanResourceDatabase";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _HumanResourceDatabaseServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static HumanResourceDatabaseProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    HumanResourceDatabaseProxy p = new HumanResourceDatabaseProxy.unbound();
    String name = serviceName ?? HumanResourceDatabase.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void addEmployee(Employee employee,void callback(bool success));
  void queryEmployee(int id,bool retrieveFingerPrint,void callback(Employee employee, List<int> fingerPrint));
  void attachFingerPrint(int id,List<int> fingerPrint,void callback(bool success));
  void listEmployeeIds(void callback(List<int> ids));
}

abstract class HumanResourceDatabaseInterface
    implements bindings.MojoInterface<HumanResourceDatabase>,
               HumanResourceDatabase {
  factory HumanResourceDatabaseInterface([HumanResourceDatabase impl]) =>
      new HumanResourceDatabaseStub.unbound(impl);

  factory HumanResourceDatabaseInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [HumanResourceDatabase impl]) =>
      new HumanResourceDatabaseStub.fromEndpoint(endpoint, impl);

  factory HumanResourceDatabaseInterface.fromMock(
      HumanResourceDatabase mock) =>
      new HumanResourceDatabaseProxy.fromMock(mock);
}

abstract class HumanResourceDatabaseInterfaceRequest
    implements bindings.MojoInterface<HumanResourceDatabase>,
               HumanResourceDatabase {
  factory HumanResourceDatabaseInterfaceRequest() =>
      new HumanResourceDatabaseProxy.unbound();
}

class _HumanResourceDatabaseProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<HumanResourceDatabase> {
  HumanResourceDatabase impl;

  _HumanResourceDatabaseProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _HumanResourceDatabaseProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _HumanResourceDatabaseProxyControl.unbound() : super.unbound();

  String get serviceName => HumanResourceDatabase.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _humanResourceDatabaseMethodAddEmployeeName:
        var r = HumanResourceDatabaseAddEmployeeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Function callback = callbackMap[message.header.requestId];
        if (callback == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        callbackMap.remove(message.header.requestId);
        callback(r.success );
        break;
      case _humanResourceDatabaseMethodQueryEmployeeName:
        var r = HumanResourceDatabaseQueryEmployeeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Function callback = callbackMap[message.header.requestId];
        if (callback == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        callbackMap.remove(message.header.requestId);
        callback(r.employee , r.fingerPrint );
        break;
      case _humanResourceDatabaseMethodAttachFingerPrintName:
        var r = HumanResourceDatabaseAttachFingerPrintResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Function callback = callbackMap[message.header.requestId];
        if (callback == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        callbackMap.remove(message.header.requestId);
        callback(r.success );
        break;
      case _humanResourceDatabaseMethodListEmployeeIdsName:
        var r = HumanResourceDatabaseListEmployeeIdsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Function callback = callbackMap[message.header.requestId];
        if (callback == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        callbackMap.remove(message.header.requestId);
        callback(r.ids );
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_HumanResourceDatabaseProxyControl($superString)";
  }
}

class HumanResourceDatabaseProxy
    extends bindings.Proxy<HumanResourceDatabase>
    implements HumanResourceDatabase,
               HumanResourceDatabaseInterface,
               HumanResourceDatabaseInterfaceRequest {
  HumanResourceDatabaseProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _HumanResourceDatabaseProxyControl.fromEndpoint(endpoint));

  HumanResourceDatabaseProxy.fromHandle(core.MojoHandle handle)
      : super(new _HumanResourceDatabaseProxyControl.fromHandle(handle));

  HumanResourceDatabaseProxy.unbound()
      : super(new _HumanResourceDatabaseProxyControl.unbound());

  factory HumanResourceDatabaseProxy.fromMock(HumanResourceDatabase mock) {
    HumanResourceDatabaseProxy newMockedProxy =
        new HumanResourceDatabaseProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static HumanResourceDatabaseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For HumanResourceDatabaseProxy"));
    return new HumanResourceDatabaseProxy.fromEndpoint(endpoint);
  }


  void addEmployee(Employee employee,void callback(bool success)) {
    if (impl != null) {
      impl.addEmployee(employee,callback);
      return;
    }
    var params = new _HumanResourceDatabaseAddEmployeeParams();
    params.employee = employee;
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((bool success) {
        z.bindCallback(() {
          callback(success);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _humanResourceDatabaseMethodAddEmployeeName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void queryEmployee(int id,bool retrieveFingerPrint,void callback(Employee employee, List<int> fingerPrint)) {
    if (impl != null) {
      impl.queryEmployee(id,retrieveFingerPrint,callback);
      return;
    }
    var params = new _HumanResourceDatabaseQueryEmployeeParams();
    params.id = id;
    params.retrieveFingerPrint = retrieveFingerPrint;
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((Employee employee, List<int> fingerPrint) {
        z.bindCallback(() {
          callback(employee, fingerPrint);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _humanResourceDatabaseMethodQueryEmployeeName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void attachFingerPrint(int id,List<int> fingerPrint,void callback(bool success)) {
    if (impl != null) {
      impl.attachFingerPrint(id,fingerPrint,callback);
      return;
    }
    var params = new _HumanResourceDatabaseAttachFingerPrintParams();
    params.id = id;
    params.fingerPrint = fingerPrint;
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((bool success) {
        z.bindCallback(() {
          callback(success);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _humanResourceDatabaseMethodAttachFingerPrintName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void listEmployeeIds(void callback(List<int> ids)) {
    if (impl != null) {
      impl.listEmployeeIds(callback);
      return;
    }
    var params = new _HumanResourceDatabaseListEmployeeIdsParams();
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((List<int> ids) {
        z.bindCallback(() {
          callback(ids);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _humanResourceDatabaseMethodListEmployeeIdsName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
}

class _HumanResourceDatabaseStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<HumanResourceDatabase> {
  HumanResourceDatabase _impl;

  _HumanResourceDatabaseStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [HumanResourceDatabase impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _HumanResourceDatabaseStubControl.fromHandle(
      core.MojoHandle handle, [HumanResourceDatabase impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _HumanResourceDatabaseStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => HumanResourceDatabase.serviceName;


  Function _humanResourceDatabaseAddEmployeeResponseParamsResponder(
      int requestId) {
  return (bool success) {
      var result = new HumanResourceDatabaseAddEmployeeResponseParams();
      result.success = success;
      sendResponse(buildResponseWithId(
          result,
          _humanResourceDatabaseMethodAddEmployeeName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }
  Function _humanResourceDatabaseQueryEmployeeResponseParamsResponder(
      int requestId) {
  return (Employee employee, List<int> fingerPrint) {
      var result = new HumanResourceDatabaseQueryEmployeeResponseParams();
      result.employee = employee;
      result.fingerPrint = fingerPrint;
      sendResponse(buildResponseWithId(
          result,
          _humanResourceDatabaseMethodQueryEmployeeName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }
  Function _humanResourceDatabaseAttachFingerPrintResponseParamsResponder(
      int requestId) {
  return (bool success) {
      var result = new HumanResourceDatabaseAttachFingerPrintResponseParams();
      result.success = success;
      sendResponse(buildResponseWithId(
          result,
          _humanResourceDatabaseMethodAttachFingerPrintName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }
  Function _humanResourceDatabaseListEmployeeIdsResponseParamsResponder(
      int requestId) {
  return (List<int> ids) {
      var result = new HumanResourceDatabaseListEmployeeIdsResponseParams();
      result.ids = ids;
      sendResponse(buildResponseWithId(
          result,
          _humanResourceDatabaseMethodListEmployeeIdsName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }

  void handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      bindings.ControlMessageHandler.handleMessage(
          this, 2, message);
      return;
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _humanResourceDatabaseMethodAddEmployeeName:
        var params = _HumanResourceDatabaseAddEmployeeParams.deserialize(
            message.payload);
        _impl.addEmployee(params.employee, _humanResourceDatabaseAddEmployeeResponseParamsResponder(message.header.requestId));
        break;
      case _humanResourceDatabaseMethodQueryEmployeeName:
        var params = _HumanResourceDatabaseQueryEmployeeParams.deserialize(
            message.payload);
        _impl.queryEmployee(params.id, params.retrieveFingerPrint, _humanResourceDatabaseQueryEmployeeResponseParamsResponder(message.header.requestId));
        break;
      case _humanResourceDatabaseMethodAttachFingerPrintName:
        var params = _HumanResourceDatabaseAttachFingerPrintParams.deserialize(
            message.payload);
        _impl.attachFingerPrint(params.id, params.fingerPrint, _humanResourceDatabaseAttachFingerPrintResponseParamsResponder(message.header.requestId));
        break;
      case _humanResourceDatabaseMethodListEmployeeIdsName:
        _impl.listEmployeeIds(_humanResourceDatabaseListEmployeeIdsResponseParamsResponder(message.header.requestId));
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  HumanResourceDatabase get impl => _impl;
  set impl(HumanResourceDatabase d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_HumanResourceDatabaseStubControl($superString)";
  }

  int get version => 2;
}

class HumanResourceDatabaseStub
    extends bindings.Stub<HumanResourceDatabase>
    implements HumanResourceDatabase,
               HumanResourceDatabaseInterface,
               HumanResourceDatabaseInterfaceRequest {
  HumanResourceDatabaseStub.unbound([HumanResourceDatabase impl])
      : super(new _HumanResourceDatabaseStubControl.unbound(impl));

  HumanResourceDatabaseStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [HumanResourceDatabase impl])
      : super(new _HumanResourceDatabaseStubControl.fromEndpoint(endpoint, impl));

  HumanResourceDatabaseStub.fromHandle(
      core.MojoHandle handle, [HumanResourceDatabase impl])
      : super(new _HumanResourceDatabaseStubControl.fromHandle(handle, impl));

  static HumanResourceDatabaseStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For HumanResourceDatabaseStub"));
    return new HumanResourceDatabaseStub.fromEndpoint(endpoint);
  }


  void addEmployee(Employee employee,void callback(bool success)) {
    return impl.addEmployee(employee,callback);
  }
  void queryEmployee(int id,bool retrieveFingerPrint,void callback(Employee employee, List<int> fingerPrint)) {
    return impl.queryEmployee(id,retrieveFingerPrint,callback);
  }
  void attachFingerPrint(int id,List<int> fingerPrint,void callback(bool success)) {
    return impl.attachFingerPrint(id,fingerPrint,callback);
  }
  void listEmployeeIds(void callback(List<int> ids)) {
    return impl.listEmployeeIds(callback);
  }
}


mojom_types.RuntimeTypeInfo getRuntimeTypeInfo() => _runtimeTypeInfo ??
    _initRuntimeTypeInfo();

Map<String, mojom_types.UserDefinedType> getAllMojomTypeDefinitions() {
  return getRuntimeTypeInfo().typeMap;
}

var _runtimeTypeInfo;
mojom_types.RuntimeTypeInfo  _initRuntimeTypeInfo() {
  // serializedRuntimeTypeInfo contains the bytes of the Mojo serialization of
  // a mojom_types.RuntimeTypeInfo struct describing the Mojom types in this
  // file. The string contains the base64 encoding of the gzip-compressed bytes.
  var serializedRuntimeTypeInfo = "H4sIAAAJbogC/+xaT4/bRBS3nYUNW6ou/beGwtYLAqJC41URUpRedsUGFVFQYFFFT5HXmSZGiR1sZ7Xl1CNHPgbHHvsR+Agce+TIcW8wk7ypJ+MZ20m8sSN1pKdZe53xvN+893u/mURXpm0b+hfQ8/fbzLWKrQrXX2K7i23o/eI1myEKwmbzFPmB47mO22s2H4yHlvsjCryxb6MjK7ROrAAJxrmP7QtsPz1utzrfth43yYB1Ml49Gq4uGy0+37+gN7BVmP8fQN+Hfh9bLfW9R2hk+eEQuWEdP/tJ6vOt4WjgPUVoeb8aMH/qV41bh+eV6Jr8+XdVvH7b6qz/CuM/e/8/aD8r4nYV2xa2CJHp/U+x3YY4SIAvNq9L2N7A5mHrYTPHgW8OPNsamD3P6w2Q2feGyPzNt0wy9D0z8O3JX+ZofDJwbNNxQ+Q/sWwUmCeO28WvC0zy/sCMJtAhNzr2wCELSD48nMxDY+bRUGfxNZTkJsOxkRHHy+D38eHD1jHk0Mfp+NXp8zyOb4M/q8YxDS81J7wuQXwftR5Nrj/D9lEGvOjzPF6XC8LL4PkVADrfmA+ntgSnbeBUykAkpj6Q4RTRVJwvsG0WhA/L1/uAT1ubxafBzXdLydZk+CoMvqL7tF2DWEQAXcfpCuPrHWxvFYCfCB+VTUSuVRfAR2V4km+Eh0gou9YQiXC5WhAu2xI/WZwIH1dVeV7Ni5OWEEe0jna5OsrjdQ24qiie4v03UnTAvHqK14E6884K8z6+zryAdfoHek2yrs85PUj5898E/mTnYwj08CZzn/LBMfJPHRt9D2G/sC4mXH0Dm+z/97DdkfG5XEbG4moH1m/VcbUoLrokDnXgG0pxGsRNDe7T5/bfnPa/X5n2L2+K4+oc+j8rF1M3DrtdpurG/dJLoksoDmdadv9Ja0j8vwUYMP7f9dGvYzwRIQ60FVEn2PyX1QlZPV1Ub9RS9BzVG6J42SlRfdAlOnTefXNSXVAlPMDGrZ5T3L6P7XosboOR5wZo3eJ2nrZs3F6BOhmMbexKIOS5OyXASRZXsrrwciPbvpbXy7K6cAP03Q9j5D9N2I+9V7K68Ecln/yiemfGf6YylCW/+PMiQ13tflSWZ1swL9iGCuNmpyT70KRWlZwX0c+fSfLq2RI6vsK8j+5nvnPcR1O/ZuPTR6HvoFPUeYL9RX5n5DtuKMHbLEN8pvCbzmlmPaWeVjfyyfddbDcF+U4ralnz/Zm6HnrwFuiVouqEekF6UIQ7WZ+2mi+fnF0wn1yHMzKORhTROt4veB0JJnQ+m9z+dFme4fXVA3qesxGd56gZ101bQR14F850D8PQsvtfT1avTRdPsH67JdFr1LH+nHrtQILnHmARw2FmN/9aty2r23aBA8qg27SEc/FFvz+Q7Yey8iPB5/OCzz1E/Ji0v0zSWTRPDS2fPP0QtKgoT6PTi9fnF4ueX5D4+2qNzi8OIL5GWvTdipaxvlZy0EVaSn3dAcwfOkFIVd833TjueyU7BzlX8tkX3QYMOP9fVdWy5Gk1A88pCfFA8WrkdD5rwNhx3KYst078pq1wH0l/T+PgHBPVgT34TVdZ9h9bGeKO5b//AwAA///eLupx2CgAAA==";

  // Deserialize RuntimeTypeInfo
  var bytes = BASE64.decode(serializedRuntimeTypeInfo);
  var unzippedBytes = new ZLibDecoder().convert(bytes);
  var bdata = new ByteData.view(unzippedBytes.buffer);
  var message = new bindings.Message(bdata, null, unzippedBytes.length, 0);
  _runtimeTypeInfo = mojom_types.RuntimeTypeInfo.deserialize(message);
  return _runtimeTypeInfo;
}

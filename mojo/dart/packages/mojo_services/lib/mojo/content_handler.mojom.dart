// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library content_handler_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo/mojo/application.mojom.dart' as application_mojom;
import 'package:mojo/mojo/url_response.mojom.dart' as url_response_mojom;



class _ContentHandlerStartApplicationParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  application_mojom.ApplicationInterfaceRequest application = null;
  url_response_mojom.UrlResponse response = null;

  _ContentHandlerStartApplicationParams() : super(kVersions.last.size);

  _ContentHandlerStartApplicationParams.init(
    application_mojom.ApplicationInterfaceRequest this.application, 
    url_response_mojom.UrlResponse this.response
  ) : super(kVersions.last.size);

  static _ContentHandlerStartApplicationParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _ContentHandlerStartApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ContentHandlerStartApplicationParams result = new _ContentHandlerStartApplicationParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.application = decoder0.decodeInterfaceRequest(8, false, application_mojom.ApplicationStub.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.response = url_response_mojom.UrlResponse.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_ContentHandlerStartApplicationParams";
    String fieldName;
    try {
      fieldName = "application";
      encoder0.encodeInterfaceRequest(application, 8, false);
      fieldName = "response";
      encoder0.encodeStruct(response, 16, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_ContentHandlerStartApplicationParams("
           "application: $application" ", "
           "response: $response" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _contentHandlerMethodStartApplicationName = 0;

class _ContentHandlerServiceDescription implements service_describer.ServiceDescription {
  void getTopLevelInterface(Function responder) {
    responder(null);
  }

  void getTypeDefinition(String typeKey, Function responder) {
    responder(null);
  }

  void getAllTypeDefinitions(Function responder) {
    responder(null);
  }
}

abstract class ContentHandler {
  static const String serviceName = "mojo::ContentHandler";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _ContentHandlerServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static ContentHandlerProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ContentHandlerProxy p = new ContentHandlerProxy.unbound();
    String name = serviceName ?? ContentHandler.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void startApplication(application_mojom.ApplicationInterfaceRequest application, url_response_mojom.UrlResponse response);
}

abstract class ContentHandlerInterface
    implements bindings.MojoInterface<ContentHandler>,
               ContentHandler {
  factory ContentHandlerInterface([ContentHandler impl]) =>
      new ContentHandlerStub.unbound(impl);

  factory ContentHandlerInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [ContentHandler impl]) =>
      new ContentHandlerStub.fromEndpoint(endpoint, impl);

  factory ContentHandlerInterface.fromMock(
      ContentHandler mock) =>
      new ContentHandlerProxy.fromMock(mock);
}

abstract class ContentHandlerInterfaceRequest
    implements bindings.MojoInterface<ContentHandler>,
               ContentHandler {
  factory ContentHandlerInterfaceRequest() =>
      new ContentHandlerProxy.unbound();
}

class _ContentHandlerProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<ContentHandler> {
  ContentHandler impl;

  _ContentHandlerProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ContentHandlerProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _ContentHandlerProxyControl.unbound() : super.unbound();

  String get serviceName => ContentHandler.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_ContentHandlerProxyControl($superString)";
  }
}

class ContentHandlerProxy
    extends bindings.Proxy<ContentHandler>
    implements ContentHandler,
               ContentHandlerInterface,
               ContentHandlerInterfaceRequest {
  ContentHandlerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _ContentHandlerProxyControl.fromEndpoint(endpoint));

  ContentHandlerProxy.fromHandle(core.MojoHandle handle)
      : super(new _ContentHandlerProxyControl.fromHandle(handle));

  ContentHandlerProxy.unbound()
      : super(new _ContentHandlerProxyControl.unbound());

  factory ContentHandlerProxy.fromMock(ContentHandler mock) {
    ContentHandlerProxy newMockedProxy =
        new ContentHandlerProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static ContentHandlerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ContentHandlerProxy"));
    return new ContentHandlerProxy.fromEndpoint(endpoint);
  }


  void startApplication(application_mojom.ApplicationInterfaceRequest application, url_response_mojom.UrlResponse response) {
    if (impl != null) {
      impl.startApplication(application, response);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ContentHandlerStartApplicationParams();
    params.application = application;
    params.response = response;
    ctrl.sendMessage(params,
        _contentHandlerMethodStartApplicationName);
  }
}

class _ContentHandlerStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<ContentHandler> {
  ContentHandler _impl;

  _ContentHandlerStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [ContentHandler impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _ContentHandlerStubControl.fromHandle(
      core.MojoHandle handle, [ContentHandler impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _ContentHandlerStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => ContentHandler.serviceName;



  void handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      bindings.ControlMessageHandler.handleMessage(
          this, 0, message);
      return;
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _contentHandlerMethodStartApplicationName:
        var params = _ContentHandlerStartApplicationParams.deserialize(
            message.payload);
        _impl.startApplication(params.application, params.response);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  ContentHandler get impl => _impl;
  set impl(ContentHandler d) {
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
    return "_ContentHandlerStubControl($superString)";
  }

  int get version => 0;
}

class ContentHandlerStub
    extends bindings.Stub<ContentHandler>
    implements ContentHandler,
               ContentHandlerInterface,
               ContentHandlerInterfaceRequest {
  ContentHandlerStub.unbound([ContentHandler impl])
      : super(new _ContentHandlerStubControl.unbound(impl));

  ContentHandlerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [ContentHandler impl])
      : super(new _ContentHandlerStubControl.fromEndpoint(endpoint, impl));

  ContentHandlerStub.fromHandle(
      core.MojoHandle handle, [ContentHandler impl])
      : super(new _ContentHandlerStubControl.fromHandle(handle, impl));

  static ContentHandlerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ContentHandlerStub"));
    return new ContentHandlerStub.fromEndpoint(endpoint);
  }


  void startApplication(application_mojom.ApplicationInterfaceRequest application, url_response_mojom.UrlResponse response) {
    return impl.startApplication(application, response);
  }
}




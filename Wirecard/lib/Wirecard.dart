library Wirecard;

import 'dart:convert';

import 'package:Wirecard/Cliente/CartaoDeCredito/CartaoDeCredito.dart';
import 'package:Wirecard/Conts.dart';
import 'package:Wirecard/MultiPagamentos/MultiPagamentos.dart';
import 'package:Wirecard/Notificacao/Notificacao.dart';
import 'package:Wirecard/Objetos/CreditCard.dart';
import 'package:Wirecard/Pagamento/Liberacao/Liberacao.dart';

import 'package:Wirecard/Pedido/Pedido.dart';






import 'package:Wirecard/Revendedor/Revendedor.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:common_utils/common_utils.dart';
import 'App.dart';
import 'Cliente/Cliente.dart';
import 'ContaWirecard/ContaPF.dart';
import 'Pagamento/Pagamento.dart';


/// A Calculator.
class Wirecard {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  Utf8Codec utf8 = Utf8Codec();
  Environment e;
  String acessToken;
  String acessKey;
  var headers;
  var headers2;
  App app;

  Wirecard(this.e, this.acessToken, this.acessKey, this.app) {
    headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${getAcessToken()}'
    };

    headers = {
      'Authorization': 'Basic ${getToken()}',
      "Cache-Control": "no-cache",
    };





  }

  Initialize(app) async {
    http.Response result = (await RegistrarApp(app));
    app = App.fromJson(json.decode(result.body.toString()));
    return app;

  }
  RegistrarRevendedor(Revendedor revendedor) {
    return http
        .post('${e.apiUrl}/v2/accounts#', body: revendedor.toMap())
        .then((result) {
      return result.body.toString();
    }).catchError((onError) {
      print('erro ao criar revendedor: ${onError.toString()} ');
    });
  }

  Future<dynamic> SolicitarAcesso(String contapf) async {
    return http
        .get(
      '${e.apiUrl}v2/accounts/$contapf',
      headers: headers,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao verificar Conta Wire: ${onError.toString()} ');
    });
  }

  Future<dynamic> VerificarContaPF(String contapf) async {
    return http
        .get(
      '${e.apiUrl}v2/accounts/$contapf',
      headers: headers,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao verificar Conta Wire: ${onError.toString()} ');
    });
  }

  Dio dio = new Dio();

  Future<dynamic> RegistrarApp(App app) async {
    return http
        .post('${e.apiUrl}v2/channels',
            body: jsonEncode(app.toJson()), headers: headers)
        .then((value) {
      print('aqui result registrar $value');
      return value;
    }).catchError((err) {
      print('Erro ao registrar app: ${err.toString()}');
    });
  }



  Future<dynamic> DeletarCartao(String deletarCartao) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .delete('${e.apiUrl}v2/fundinginstruments/$deletarCartao',

        headers: headers2,
        )
        .then((response) {


      print('aqui result Deletou o cartão ${response.body.toString()}');


      return response;
    }).catchError((err) {
      print('Erro ao criar cliente ${err.toString()}');
    });
  }
  /// SUBSTITUIR  CUS-7SAAIJLS6K8O POR ACOUNT_ID
  Future<dynamic> CriarCartaoDeCredito(CreditCard creditCard) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/customers/CUS-7SAAIJLS6K8O/fundinginstruments',
        body: jsonEncode(creditCard.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {

          
       print('aqui result cliente ${response.body.toString()}');
     

      return response;
    }).catchError((err) {
      print('Erro ao criar cliente ${err.toString()}');
    });
  }


  Future<dynamic> CancelarPagamentoPreAutorizado(Liberacao liberacao) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/escrows/ECW-9OS6FAPR3FD5/release',
        body: jsonEncode(liberacao.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {


      print('aqui result Liberacao ${response.body.toString()}');


      return response;
    }).catchError((err) {
      print('Erro ao Liberar Custodia ${err.toString()}');
    });
  }

  Future<dynamic> LiberarCustodia(String escrow_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/escrows/$escrow_id/release',

        headers: headers2,
        encoding: utf8)
        .then((response) {


      print('aqui result Liberacao ${response.body.toString()}');


      return response;
    }).catchError((err) {
      print('Erro ao Liberar Custodia ${err.toString()}');
    });
  }

  Future<dynamic> CriarCliente(Cliente cliente) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/customers',
        body: jsonEncode(cliente.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result cliente ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar cliente ${err.toString()}');
    });
  }

  Future<dynamic> CapturarPagamentoPreAutorizado(String payment_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/payments/$payment_id/capture',

        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui Captura Pagamento ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao capturar Pagamento ${err.toString()}');
    });
  }
  Future<dynamic> SimuladorPagamentos(String codigo, String valor) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('https://sandbox.moip.com.br/simulador/authorize?payment_id=$codigo&amount=$valor',headers: headers2
    )
        .then((response) {
      print('aqui Key ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }


  Future<dynamic> VerificarKeys() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('https://sandbox.moip.com.br/v2/keys',headers: headers2
    )
        .then((response) {
      print('aqui Key ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }


  Future<dynamic> VerificarTodosCliente() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('${e.apiUrl}v2/customers/',headers: headers2
    )
        .then((response) {
      print('aqui verificou Todos Cliente ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }

  Future<dynamic> VerificarMultiPagamentos(String multipayment_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('${e.apiUrl}v2/multipayments/$multipayment_id',headers: headers2
    )
        .then((response) {
      print('aqui verificou MultiPagamentos ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro verificar multipagamentos ${err.toString()}');
    });
  }


  Future<dynamic> VerificarCliente(String cliente) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('${e.apiUrl}v2/customers/$cliente',headers: headers2
       )
        .then((response) {
      print('aqui verificou Cliente ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }


  Future<dynamic> CriarNotificacao(Notificacao notificacao ) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/preferences/notifications',
        body: jsonEncode(notificacao.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {

      print('aqui header ${headers2}');
      print('aqui responde ${response.body.toString()}');
      return response;
    }).catchError((err) {
      print('Erro ao criar pagamento ${err.toString()}');
    });
  }


  Future<dynamic> CriarMultiPagamento(MultiPagementos multiPagementos) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/multiorders/multiorder_id/multipayments',
        body: jsonEncode(multiPagementos.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {

      print('aqui header ${headers2}');
      print('aqui responde ${response.body.toString()}');
      return response;
    }).catchError((err) {
      print('Erro ao criar pagamento ${err.toString()}');
    });
  }


  Future<dynamic> CriarPagamento(Pagamento pagamento, String order_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/orders/$order_id/payments',
        body: jsonEncode(pagamento.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {

      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar pagamento ${err.toString()}');
    });
  }

  Future<dynamic> CriarPedido(Pedido pedido) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/orders',
        body: jsonEncode(pedido.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {
     
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }


  Future<dynamic> CriarContaPF(ContaPF contapf) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/accounts#',
            body: jsonEncode(contapf.toJson()),
            headers: headers2,
            encoding: utf8)
        .then((response) {
      print('aqui result cadastrar ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }

  Future<dynamic> VerificarPagamento(String pagamento_id) async {
    return http
        .get(
      '${e.apiUrl}v2/payments/$pagamento_id',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pagamento: ${onError.toString()} ');
    });
  }


  Future<dynamic> VerificarPedido(String order_id) async {
    return http
        .get(
      '${e.apiUrl}v2/orders/$order_id',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pedido: ${onError.toString()} ');
    });
  }

  Future<dynamic> VerificarTodosPedido() async {
    return http
        .get(
      '${e.apiUrl}v2/orders',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pedido: ${onError.toString()} ');
    });
  }

  Future<dynamic> VerificarContaWirecard(String email) async {
    return http
        .get(
      '${e.apiUrl}v2/accounts/exists?email=$email',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao criar revendedor: ${onError.toString()} ');
    });
  }

  String getToken() {
    String credentials = "$acessToken:$acessKey";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String token = stringToBase64.encode(credentials);
    print('TOKEN ${token}');
    return token;
  }

  Future getAcessToken() {
    return http
        .get(
      'https://connect-sandbox.moip.com.br/oauth/token?client_id=APP-M11STAPPOAU&client_secret=UROQ0DJO7SDVS3GRUUTVBI6YO3GACTCE&grant_type=authorization_code&code=ZNEQAI4ZC00JAUESVB5FEODMR00PQ62LL3CDGXXQ&redirect_uri=http://urlteste.com.br',
      headers: headers,
    )
        .then((value) {
      return value;
    });
  }
}

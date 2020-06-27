library Wirecard;

import 'dart:convert';

import 'package:Wirecard/Antecipacao/Antecipacao.dart';
import 'package:Wirecard/ContaBancaria/ContaBancaria.dart';
import 'package:Wirecard/Conts.dart';
import 'package:Wirecard/MultiPagamentos/MultiPagamentos.dart';

import 'package:Wirecard/Notificacao/Notificacao.dart';
import 'package:Wirecard/Objetos/CreditCard.dart';
import 'package:Wirecard/Objetos/MultiPedido.dart';
import 'package:Wirecard/Objetos/MultiPedido.dart';

import 'package:Wirecard/Objetos/Webhook.dart';

import 'package:Wirecard/Pedido/Pedido.dart';

import 'package:Wirecard/Revendedor/Revendedor.dart';
import 'package:Wirecard/Transferencia/Transferencia.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:common_utils/common_utils.dart';
import 'App.dart';
import 'Cliente/Cliente.dart';
import 'ContaWirecard/ContaPF.dart';

import 'Objetos/MultiPedido.dart';
import 'Objetos/MultiPedido.dart';
import 'Objetos/MultiPedido.dart';
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
     //TODO INICIAR OS HTTP
  Initialize(app) async {
    http.Response result = (await RegistrarApp(app));
    app = App.fromJson(json.decode(result.body.toString()));
    return app;
  }
  /// Classical Account On-boarding    ---------------------------------------------------------------
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

  Future<dynamic> VerificarContaWirecard(String email) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/accounts/exists?email=$email',
      headers: headers2,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao criar revendedor: ${onError.toString()} ');
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

  Future<dynamic> PermissoesAcessosUsuario() async {
    return http
        .get(
      'https://connect-sandbox.wirecard.com.br/oauth/authorize?response_type=code&client_id=APP-QQ1NUNIKRQ9B&redirect_uri=https://wirecard.com.br/&scope=RECEIVE_FUNDS,TRANSFER_FUNDS',
      headers: headers,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao Pedir permissao do usuario: ${onError.toString()} ');
    });
  }

  /// Classical Account On-boarding    ---------------------------------------------------------------



  ///--------------------------- 2B Transparent Account On-boarding----------------------------------------------------------
  Future<dynamic> CriarContaWireTransparente(ContaPF contapf) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/accounts',
        body: jsonEncode(contapf.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {
      print(
          'aqui result cadastrar conta transparente ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }

  ///-------------------------------------------------------------------------------------------------------



  ///-----------------------------------------------CLIENTES------------------------------------------------
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

  /// SUBSTITUIR  CUS-7SAAIJLS6K8O POR ACOUNT_ID
  Future<dynamic> CriarCartaoDeCredito(CreditCard creditCard) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/customers/CUS-6HLAPWBRG0SO/fundinginstruments',
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

  Future<dynamic> DeletarCartao(String deletarCartao) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .delete(
      '${e.apiUrl}v2/fundinginstruments/$deletarCartao',
      headers: headers2,
    )
        .then((response) {
      print('aqui result Deletou o cartão ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao Deletar ${err.toString()}');
    });
  }

  Future<dynamic> VerificarCliente(String cliente) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('${e.apiUrl}v2/customers/$cliente', headers: headers2)
        .then((response) {
      print('aqui verificou Cliente ${response.body.toString()}');
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
        .get('${e.apiUrl}v2/customers/', headers: headers2)
        .then((response) {
      print('aqui verificou Todos Cliente ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }

  ///------------------------------------------------------------------------------------------------------


  ///--------------------------------------------PEDIDOS--------------------------------------------------

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
  Future<dynamic> VerificarPedido(String order_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/orders/$order_id',
      headers: headers2,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pedido: ${onError.toString()} ');
    });
  }

  Future<dynamic> VerificarTodosPedido() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/orders',
      headers: headers2,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pedido: ${onError.toString()} ');
    });
  }
  


  ///--------------------------------------------PEDIDOS--------------------------------------------------




  ///--------------------------------------------PAGAMENTOS--------------------------------------------------

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


  Future<dynamic> VerificarPagamento(String pagamento_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/payments/$pagamento_id',
      headers: headers2,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pagamento: ${onError.toString()} ');
    });
  }

  Future<dynamic> LiberarCustodia(String escrow_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/escrows/$escrow_id/release',
        headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui result Liberacao ${response.body.toString()}');
      return response;
    }).catchError((err) {
      print('Erro ao Liberar Custodia ${err.toString()}');
    });
  }

  Future<dynamic> CapturarPagamentoPreAutorizado() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/payments/PAY-OK0AQYTLTLYL/capture',
        headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui Captura Pagamento ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao capturar Pagamento ${err.toString()}');
    });
  }

  Future<dynamic> CancelarPagamentoPreAutorizado() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/payments/PAY-OK0AQYTLTLYL/void',
        headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui result Liberacao ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao Liberar Custodia ${err.toString()}');
    });
  }
  Future<dynamic> SimuladorPagamentos(String codigo, String valor) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
        'https://sandbox.moip.com.br/simulador/authorize?payment_id=$codigo&amount=$valor',
        headers: headers2)
        .then((response) {
      print('aqui Key ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao criar conta ${err.toString()}');
    });
  }

  ///--------------------------------------------PAGAMENTOS--------------------------------------------------




  ///--------------------------------------------MULTIPEDIDO--------------------------------------------------

  Future<dynamic> CriarMultiPedidos(MultiPedidos multiPedido) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/multiorders',
        body: jsonEncode(multiPedido.toJson()),
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

  Future<dynamic> VerificarMultiPedidos(String multiorder_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('${e.apiUrl}v2/multiorders/$multiorder_id', headers: headers2)
        .then((response) {
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro ao verificar multiPagamentos ${err.toString()}');
    });
  }



  ///--------------------------------------------MULTIPEDIDO--------------------------------------------------




  ///--------------------------------------------MULTIPAGAMENTO--------------------------------------------------
  Future<dynamic> CriarMultiPagamento(
      MultiPagamentos multiPagementos, String multiorder_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/multiorders/$multiorder_id/multipayments',
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

  Future<dynamic> ConsultarMultiPagamentos(String multipayment_id) async {
    return http
        .get(
      '${e.apiUrl}v2/multipayments/$multipayment_id',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Multi Pagamento: ${onError.toString()} ');
    });
  }

  Future<dynamic> CapturarMultiPagamentos(String multiPagamentos) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/multipayments/$multiPagamentos/capture',
        headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui result cliente ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao criar cliente ${err.toString()}');
    });
  }



  Future<dynamic> CancelarMultiPagamentoPreAutorizado(
      String multipayment_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/payments/$multipayment_id/void',
        headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui result Cancelar Multi Pagamento ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao Cancelar Multi Pagamento ${err.toString()}');
    });
  }
  Future<dynamic> LiberarCustodiaMultiPagamento(String escrow_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/escrows/$escrow_id/release',
        headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui result Liberacao multiPagamento ${response.body.toString()}');
      return response;
    }).catchError((err) {
      print('Erro ao Liberar multiPagamento ${err.toString()}');
    });
  }

  
  ///--------------------------------------------MULTIPAGAMENTO--------------------------------------------------






  ///--------------------------------------------NOTIFICAÇÃO--------------------------------------------------
  Future<dynamic> CriarNotificacaoContaWire(Notificacao notificacao) async {
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
  Future<dynamic> CriarNotificacaoApp(Notificacao notificacao) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/preferences/APP-3984HG73HE9/notifications',
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

  Future<dynamic> ConsultarPreferenciaNotificacao(
      String notification_id) async {
    return http
        .get(
      '${e.apiUrl}v2/preferences/notifications/$notification_id',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Pagamento: ${onError.toString()} ');
    });
  }
  Future<dynamic> ListarTodasAsPreferencia() async {
    return http
        .get(
      '${e.apiUrl}v2/preferences/notifications',
      headers: headers,
    )
        .then((value) {
      return value;
    }).catchError((onError) {
      print('erro ao verificar Preferencia Lista: ${onError.toString()} ');
    });
  }
  Future<dynamic> DeletarPreferenciaNotificacao(String notification_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .delete(
      '${e.apiUrl}v2/preferences/notifications/$notification_id',
      headers: headers2,
    )
        .then((response) {
      print('aqui result Deletou a Preferencia ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao Deletar Preferencia ${err.toString()}');
    });
  }
  Future<dynamic> ConsultarWebhook(String payment_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/webhooks?resourceId=$payment_id',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao verificar Conta Wire: ${onError.toString()} ');
    });
  }
  Future<dynamic> ConsultarTodosWebHook() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/webhooks',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao listar webhooks: ${onError.toString()} ');
    });
  }
  Future<dynamic> ReenviarWebhook(Webhook webhook) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/webhooks',
        body: jsonEncode(webhook.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Web Hook ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao result Webhooks ${err.toString()}');
    });
  }
  ///--------------------------------------------NOTIFICAÇÃO--------------------------------------------------



  ///--------------------------------------------CONTA BANCARIA--------------------------------------------------

  Future<dynamic> ConsultarTodasContasBancarias(String account_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/accounts/$account_id/bankaccounts',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao verificar Conta Wire: ${onError.toString()} ');
    });
  }

  Future<dynamic> CriarContaBancaria(
      ContaBancaria contaBancaria, String account_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/accounts/$account_id/bankaccounts',
        body: jsonEncode(contaBancaria.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Conta Bancaria ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao result Conta Bancaria ${err.toString()}');
    });
  }

  Future<dynamic> ConsultarContaBancaria(String bank_account_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/bankaccounts/$bank_account_id',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao consultar conta bancaria: ${onError.toString()} ');
    });
  }
  Future<dynamic> ConsultarTodasContaBancaria(String account_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/accounts/$account_id/bankaccounts',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print(
          'erro ao consultar Lista de conta bancaria: ${onError.toString()} ');
    });
  }
  Future<dynamic> DeletarContaBancaria(String bankaccount_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .delete(
      '${e.apiUrl}v2/bankaccounts/$bankaccount_id',
      headers: headers2,
    )
        .then((response) {
      print('aqui result Deletou a Conta Bancaria ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao Deletar Preferencia ${err.toString()}');
    });
  }

  Future<dynamic> AtualizarContaBancaria(
      ContaBancaria contaBancaria, String bankaccount_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .put('${e.apiUrl}v2/bankaccounts/$bankaccount_id',
        body: jsonEncode(contaBancaria.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Atualizar Conta Bancaria ${response.body.toString()}');
      return response;
    }).catchError((err) {
      print('Erro ao Multi Pedid ${err.toString()}');
    });
  }

  ///--------------------------------------------CONTA BANCARIA--------------------------------------------------



  ///--------------------------------------------SALDO WIRECARD--------------------------------------------------
  Future<dynamic> ConsultarSaldoWireCard() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/balances',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Saldo Wirecard: ${onError.toString()} ');
    });
  }

  ///--------------------------------------------SALDO WIRECARD--------------------------------------------------
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

  ///--------------------------------------------SALDO WIRECARD--------------------------------------------------

  ///--------------------------------------------EXTRATO E LANÇAMENTOS--------------------------------------------------

  ///END = DATA, BEGIN = DATA
  Future<dynamic> ListarExtrato() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/statements?end=2019-01-15&begin=2019-01-01',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Lista Extrato: ${onError.toString()} ');
    });
  }
  Future<dynamic> DetalheExtrato() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/statements/details?type=1&date=2018-10-04',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Detalhe Extrato: ${onError.toString()} ');
    });
  }
  Future<dynamic> ConsultarLancamento(String entry_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/entries/$entry_id',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao Consultar Todos os Lançamentos: ${onError.toString()} ');
    });
  }

  Future<dynamic> ConsultarTodosOsLancamentos() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/entries',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao Consultar Todos os Lançamentos: ${onError.toString()} ');
    });
  }



  Future<dynamic> ConsultarDetalhesExtratoFuturo() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/futurestatements/details?type=1&date=2018-12-18',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao verificar Conta Wire: ${onError.toString()} ');
    });
  }


  Future<dynamic> ConsultarExtratoFuturo() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/futurestatements?end=2019-01-15&begin=2019-01-01',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao verificar Conta Wire: ${onError.toString()} ');
    });
  }


  ///--------------------------------------------EXTRATO E LANÇAMENTOS--------------------------------------------------



  ///--------------------------------------------TRANSFERENCIA----------------------------------------------------------

  Future<dynamic> ConsultarTransferencia(String transfer_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/transfers/$transfer_id',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Consultar Transferencias: ${onError.toString()} ');
    });
  }

  Future<dynamic> ConsultarTodasAsTransferencia() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/transfers',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao listar Todas as Transferencias: ${onError.toString()} ');
    });
  }




  Future<dynamic> ReverterTransferencia( String transfer_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/transfers/$transfer_id/reverse',

        headers: headers2,
        encoding: utf8)
        .then((response) {
      return response;
    }).catchError((err) {
      print('Erro ao result Reverter Transferencia ${err.toString()}');
    });
  }

  Future<dynamic> CriarTransferencia(Transferencia transferencia) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/transfers',
        body: jsonEncode(transferencia.toJson()),
        headers: headers2,
        encoding: utf8)
        .then((response) {


      return response;
    }).catchError((err) {
      print('Erro ao result Transferencia ${err.toString()}');
    });
  }
  ///--------------------------------------------TRANSFERENCIA----------------------------------------------------------


  ///--------------------------------------------REEMBOLSO------------------------------------------------------


  Future<dynamic> ListarReembolsoPedido(String orders_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/orders/$orders_id/refunds',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Listar Reembolso: ${onError.toString()} ');
    });
  }

  Future<dynamic> ListarReembolsoPagamento(String payment_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/payments/$payment_id/refunds',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Listar Reembolso: ${onError.toString()} ');
    });
  }


  Future<dynamic> ConsultarReembolso(String refund_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/refunds/$refund_id',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao listar webhooks: ${onError.toString()} ');
    });
  }

  Future<dynamic> ReembolsarPedido(String order_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/orders/$order_id/refunds',

        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Conta Bancaria ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao result Conta Bancaria ${err.toString()}');
    });
  }

  Future<dynamic> Reembolsar(String payment_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/payments/$payment_id/refunds',

        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Conta Bancaria ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao result Conta Bancaria ${err.toString()}');
    });
  }

  ///--------------------------------------------REEMBOLSO------------------------------------------------------


  ///--------------------------------------------CONCILAÇÃO------------------------------------------------------

  Future<dynamic> ObterArquivoFinanceiro(String date) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/reconciliations/financials?eventsCreatedAt=$date',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao Obter Arquivos de venda: ${onError.toString()} ');
    });
  }

  Future<dynamic> ObterArquivoDeVendas(String date) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      'https://api.moip.com.br/v2/reconciliations/sales/$date',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro ao Obter Arquivos de venda: ${onError.toString()} ');
    });
  }

  ///--------------------------------------------CONCILAÇÃO------------------------------------------------------



  ///--------------------------------------------ANTECIPAÇÃO------------------------------------------------------

  Future<dynamic> ConsultarAntecipacao(String anticipation_id) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/anticipations/$anticipation_id',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Consultar as Astencipacoes: ${onError.toString()} ');
    });
  }

  Future<dynamic> ConsultarTodasAsAntecipacoes() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get(
      '${e.apiUrl}v2/anticipations',
      headers: headers2,
    )
        .then((value) {
      print('aqui value $value');
      return value;
    }).catchError((onError) {
      print('erro Todas as Astencipacoes: ${onError.toString()} ');
    });
  }





  Future<dynamic> SolicitacaoAntecipcao(int valor) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/anticipations?amount=$valor',

        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Solicitacao Antecipada ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao result Conta Bancaria ${err.toString()}');
    });
  }

  Future<dynamic> Estimativa(int valor) async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/anticipationestimates?amount=$valor',

        headers: headers2,
        encoding: utf8)
        .then((response) {
      print('aqui result Conta Bancaria ${response.body.toString()}');

      return response;
    }).catchError((err) {
      print('Erro ao result Conta Bancaria ${err.toString()}');
    });
  }


  ///--------------------------------------------ANTECIPAÇÃO------------------------------------------------------








  ///v2/statements/details?type=type&date=date





















  Future<dynamic> MultiPedido() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .post('${e.apiUrl}v2/multiorders', headers: headers2, encoding: utf8)
        .then((response) {
      print('aqui result Multi Pedido ${response.body.toString()}');
      return response;
    }).catchError((err) {
      print('Erro ao Multi Pedid ${err.toString()}');
    });
  }










  Future<dynamic> VerificarKeys() async {
    var headers2 = {
      'Content-Type': 'application/json',
      'Authorization': 'OAuth ${app.accessToken}'
    };
    return http
        .get('https://sandbox.moip.com.br/v2/keys', headers: headers2)
        .then((response) {
      print('aqui Key ${response.body.toString()}');
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
        .get('${e.apiUrl}v2/multipayments/$multipayment_id', headers: headers2)
        .then((response) {
      print('aqui verificou MultiPagamentos ${response.body.toString()}');
      print('aqui header ${headers2}');

      return response;
    }).catchError((err) {
      print('Erro verificar multipagamentos ${err.toString()}');
    });
  }



























   //


  String getToken() {
    String credentials = "$acessToken:$acessKey";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String token = stringToBase64.encode(credentials);
    print('TOKEN ${token}');
    return token;
  }

  Future AtualizarToken() {
    return http
        .get(
      'https://connect-sandbox.moip.com.br/oauth/token?grant_type=refresh_token&refresh_token=7365111111e3417d88837457c9f940_v2',
      headers: headers,
    )
        .then((value) {
      return value;
    });
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

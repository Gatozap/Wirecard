import 'dart:convert';

import 'package:Wirecard/App.dart';
import 'package:Wirecard/Cliente/CartaoDeCredito/CartaoDeCredito.dart';

import 'package:Wirecard/Cliente/Cliente.dart';
import 'package:Wirecard/ContaWirecard/ContaPF.dart';
import 'package:Wirecard/Conts.dart';
import 'package:Wirecard/MultiPagamentos/MultiPagamentos.dart';
import 'package:Wirecard/Notificacao/Notificacao.dart';
import 'package:Wirecard/Objetos/Adress.dart';
import 'package:Wirecard/Objetos/BillingAddress.dart';
import 'package:Wirecard/Objetos/Card.dart';
import 'package:Wirecard/Objetos/CreditCard.dart';
import 'package:Wirecard/Objetos/Customer.dart';
import 'package:Wirecard/Objetos/Device.dart';

import 'package:Wirecard/Objetos/Email.dart';
import 'package:Wirecard/Objetos/FundingInstrument.dart';
import 'package:Wirecard/Objetos/Geolocation.dart';
import 'package:Wirecard/Objetos/Holder.dart';

import 'package:Wirecard/Objetos/HostedAccount.dart';
import 'package:Wirecard/Objetos/IdentityDocument.dart';
import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Objetos/MoipAccount.dart';
import 'package:Wirecard/Objetos/Order.dart';
import 'package:Wirecard/Objetos/Payment.dart';
import 'package:Wirecard/Objetos/Person.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/Receiver.dart';
import 'package:Wirecard/Objetos/Self.dart';

import 'package:Wirecard/Objetos/ShippingAddress.dart';
import 'package:Wirecard/Objetos/SubTotals.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:Wirecard/Pagamento/Liberacao/Liberacao.dart';
import 'package:Wirecard/Pagamento/Pagamento.dart';
import 'package:Wirecard/Pedido/Amount.dart';

import 'package:Wirecard/Pedido/Pedido.dart';

import 'package:Wirecard/Wirecard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

Wirecard w = Wirecard(
  Environment.SANDBOX,
  'UROQ0DJO7SDVS3GRUUTVBI6YO3GACTCE',
  'ZNEQAI4ZC00JAUESVB5FEODMR00PQ62LL3CDGXXQ',
  appRegistrado,
);

App appRegistrado = App(
    name: 'Teste RB',
    redirectUri: 'https://www.ibout.com.br',
    description: 'Teste App',
    accessToken: '7ad6a369b88543ab8fc2126106c7e725_v2',
    createdAt: '2020-06-17T17:25:10.096Z',
    id: 'APP-2FIJ82URD4B2',
    secret: '972f853008354a28944b3e3c42c9f4cf',
    updatedAt: '2020-06-17T17:25:10.096Z',
    website: 'https://www.ibout.com.br');

ContaPF ccregistrado = new ContaPF(
    login: 't@t2.com.br',
    transparentAccount: false,
    id: 'MPA-49B9AF15F0ED',
    accessToken: '0c805578d3984f80b373f7f3d232a172_v2',
    channelId: 'APP-MOIPSANDBOXX',
    createdAt: '2016-09-14T01:18:26.534Z',
    links: Links(
        self: Self(
            href: 'https://sandbox.moip.com.br/moipaccounts/MPA-3C5358FF2296'),
        hostedAccount: HostedAccount(
            redirectHref:
                'https://hostedaccount-sandbox.moip.com.br?token=8899eae3-e4e8-4828-a93e-698a1c557107&id=CUS-87HFA3QCEKO7&mpa=MPA-B4DEE9F7589B')),
    email: Email(address: 't@t2.com.br', confirmed: false),
    type: 'MERCHANT',
    person: Person(
        birthDate: '1990-01-01',
        name: 'Runscope',
        phone: Phone(
          number: '965213244',
          areaCode: '11',
          countryCode: '55',
        ),
        lastName: 'Random 9123',
        address: Address(
          city: 'São Paulo',
          country: 'BRA',
          district: 'Itaim',
          state: 'SP',
          street: "Av. Brigadeiro Faria Lima",
          streetNumber: "2927",
          zipCode: '01234-000',
        ),
        taxDocument: TaxDocument(
          type: 'CPF',
          number: '272.816.620-09',
        ),
        identityDocument: IdentityDocument(
          number: "434322344",
          issuer: 'SSP',
          issueDate: '2000-12-12',
          type: 'RG',
        )));

ContaPF cc = new ContaPF(
    login: 't@t2.com.br',
    transparentAccount: false,
    channelId: 'APP-MOIPSANDBOXX',
    createdAt: '2016-09-14T01:18:26.534Z',
    links: Links(
      self: Self(
          href: 'https://sandbox.moip.com.br/moipaccounts/MPA-3C5358FF2296'),
    ),
    email: Email(address: 't@t2.com.br', confirmed: false),
    type: 'MERCHANT',
    person: Person(
        birthDate: '1990-01-01',
        name: 'Runscope',
        phone: Phone(
          number: '965213244',
          areaCode: '11',
          countryCode: '55',
        ),
        lastName: 'Random 9123',
        address: Address(
          city: 'São Paulo',
          country: 'BRA',
          district: 'Itaim',
          state: 'SP',
          street: "Av. Brigadeiro Faria Lima",
          streetNumber: "2927",
          zipCode: '01234-000',
        ),
        taxDocument: TaxDocument(
          type: 'CPF',
          number: '272.816.620-09',
        ),
        identityDocument: IdentityDocument(
          number: "434322344",
          issuer: 'SSP',
          issueDate: '2000-12-12',
          type: 'RG',
        )));

ContaPF contaPF = new ContaPF.nova(
    email: Email(address: 'dev.moip@labs.moip.com.br', confirmed: false),
    type: 'MERCHANT',
    person: Person(
        birthDate: '1990-01-01',
        name: 'Runscope',
        phone: Phone(number: '965213244', areaCode: '11', countryCode: '55'),
        lastName: 'Random 9123',
        address: Address(
          city: 'São Paulo',
          country: 'BRA',
          district: 'Itaim',
          state: 'SP',
          street: "Av. Brigadeiro Faria Lima",
          streetNumber: "2927",
          zipCode: '01234-000',
        ),
        taxDocument: TaxDocument(type: 'CPF', number: '123.456.798-91'),
        identityDocument: IdentityDocument(
          number: "434322344",
          issuer: 'SSP',
          issueDate: '2000-12-12',
          type: 'RG',
        )));
Cliente cjj = new Cliente(
  taxDocument: TaxDocument(number: '66688866555', type: "CPF"),
  birthDate: '1990-11-30',
  email: 'joao@e.com',
  ownId: 'meu_id_customer11',
  fullname: 'Jose',
  phone: Phone(number: '11162666', countryCode: '55', areaCode: '11'),
  shippingAddress: ShippingAddress(
    zipCode: '11234666',
    streetNumber: '666',
    street: 'Avenida Faria Lima',
    state: 'SP',
    city: 'São Paulo',
    district: 'Itaim Bibi',
    country: 'BRA',
    complement: '50',
  ),
);
App app = new App(
    description: 'Teste App',
    name: 'Teste RB',
    redirectUri: 'https://www.ibout.com.br',
    site: 'https://www.ibout.com.br');

List<Receiver> receiver = [
  Receiver(
      amount: Amount(subtotals: Subtotals(shipping: 1000), currency: 'BRL'),
      type: 'SECONDARY',
      feePayor: false,
      moipAccount: MoipAccount(id: 'MPA-E3C8493A06AE'))
];
List<Item> items = [
  Item(
      detail: 'Mais info...',
      category: 'VIDEO_GAME_SOFTWARE',
      price: 22000,
      product: 'Descrição do pedido',
      quantity: 1),
];
Pedido pedido = Pedido(
  ownId: 'id_pedido',
  amount: Amount(fixed: 5000),
  items: items,
  customer: Customer(id: 'CUS-7SAAIJLS6K8O'),
  receivers: receiver,
);
CreditCard cartaofim = CreditCard(
    method: 'CREDIT_CARD',
    number: '4012001037141112',
    expirationMonth: '05',
    expirationYear: '22',
    cvc: '123',
    holder: Holder(
        phone: Phone(number: '55662666', countryCode: '55', areaCode: '11'),
        birthdate: '1990-11-23',
        taxDocument: TaxDocument(number: '66688866666', type: 'CPF'),
        fullname: 'João S'));

Pagamento pagamento = Pagamento(
  device: Device(
      fingerprint:
          'QAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolp',
      geolocation: Geolocation(latitude: -33.867, longitude: 151.206),
      ip: '127.0.0.1',
      userAgent:
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36'),
  fundingInstrument: FundingInstrument(
      creditCard: CreditCard(
        cvc: '123',
        expirationYear: '22',
        expirationMonth: '06',
        number: '4012001037141112',
        card: Card(brand: 'VISA'),
        store: true,
        holder: Holder(
            phone: Phone(countryCode: '55', areaCode: '11', number: '22849560'),
            birthdate: '1988-12-30',
            taxDocument: TaxDocument(number: '78994193666', type: 'CPF'),
            fullname: 'Roberto Oliveira',
            billingAddress: BillingAddress(
                country: 'BRA',
                city: 'Belo Horizonte',
                district: 'Savassi',
                state: 'MG',
                street: 'Avenida Contorno',
                streetNumber: '400',
                zipCode: '76932800')),
      ),
      method: 'CREDIT_CARD'),
  installmentCount: 6,
  statementDescriptor: 'sualoja.com',
);
MultiPagementos ml = MultiPagementos(
    installmentCount: 1,
    fundingInstrument: FundingInstrument(
        creditCard: CreditCard(
            hash:
            "HhL0kbhfid+jwgj5l6Kt9EPdetDxQN8s7uKUHDYxDC/XoULjzik44rSda3EcWuOcL17Eb8JjWc1JI7gsuwg9P0rJv1mJQx+d3Dv1puQYz1iRjEWWhnB1bw0gTvnnC/05KbWN5M8oTiugmhVK02Rt2gpbcTtpS7VWyacfgesBJFavYYMljYg8p2YGHXkXrMuQiOCeemKLk420d0OTMBba27jDVVJ663HZDrObnjFXJH/4B5irkj+HO5genV+V4PYoLcOESG4nrI3oFAsMGsLLcdJo0NNvkEmJpn0e9GzureKKFYisYU+BEd9EMr/odS0VMvOYRV65HbPTspIkjl2+3Q==",
            method: 'CREDIT_CARD',
            holder: Holder(
                fullname: 'Jose Portador da Silva',
                birthdate: '1988-12-30',
                taxDocument: TaxDocument(type: 'CPF', number: '33333333333'),
                phone: Phone(
                    number: '66778899', areaCode: '11', countryCode: '55')))));

Liberacao liberacao = Liberacao(
    amount: 100,
    links: Links(
        self: Self(href: 'https://api.moip.com.br/v2/escrows/ECW-9OS6FAPR3FD5'),
        order:
            Order(href: "https://api.moip.com.br/v2/orders/ORD-9OS6FAPR3FD5"),
        payment: Payment(
            href: "https://api.moip.com.br/v2/payments/PAY-9OS6FAPR3FD5",
            title: 'PAY-9OS6FAPR3FD5')),
    createdAt: '2017-05-04T05:44:39.000-03',
    updatedAt: '2017-05-04T05:44:39.000-03',
    description: 'TEST ESCROW',
    status: 'RELEASED');

Notificacao nf = Notificacao(events: ['ORDER.*',    "PAYMENT.AUTHORIZED",
  "PAYMENT.CANCELLED"], media: 'WEBHOOK', target: 'http://requestb.in/1dhjesw1');
void main() {
  group("Testes Wirecard", () {
    //TODO CRIANDO PAGAMENTO
    /*  test('Criar Pagamento: ', () async {
      print('aqui hash ${pagamento.hashCode}');
      Response result = await w.CriarPagamento(pagamento, 'ORD-O5DLMAJZPTHV');
      print('aqui hash ${pagamento}');
      print('Criar Pagamento ${result.statusCode}');
      print('Criar Pagamento ${result.body.toString()}');
    });  */

    //TODO CRIAR CARTÃO PARA O CLIENTE
    /* test('Cartao de Credito: ', () async {
      Response result = await w.CriarCartaoDeCredito(cartaofim);

      print('Result Cartao de Credito ${result.statusCode}');
      print('Result Cartao de Credito ${result.body.toString()}');
      creditCardCadastrado = CreditCardCadastrado.fromJson(json.decode(result.body.toString()));
    });  */
    //TODO VERIFICAR TODOS OS PEDIDOS
    /*test('Todos os Pedido: ', () async {
      Response result = await w.VerificarTodosPedido();

      print('Result Todos os Pedido ${result.statusCode}');
      print('Result Todos os Pedido ${result.body.toString()}');
      expect(result.statusCode, 200);
    });  */
    //TODO VERIFICAR PEDIDO
    /*test('Pedido: ', () async {
      Response result = await w.VerificarPedido('ORD-5QXM27Y9UTZT');

      print('Result Pedido ${result.statusCode}');
      print('Result Pedido ${result.body.toString()}');
      expect(result.statusCode, 200);
    });  */
    //TODO VERIFICAR PAGAMENTO
    /* test ('Pagamento: ', () async {
      Response result = await w.VerificarPagamento('PAY-OK0AQYTLTLYL');

      print('Result Pagamento ${result.statusCode}');
      print('Result Pagamento ${result.body.toString()}');
      expect(result.statusCode, 200);

    });  */

    //TODO VERIFICA CLIENTE

    /*test('Cliente: ', () async {
      Response result = await w.VerificarCliente('CUS-7SAAIJLS6K8O');

      print('Result Cliente ${result.statusCode}');
      print('Result Cliente ${result.body.toString()}');
       expect(result.statusCode, 200);
    }); */

    //TODO LISTAR TODOS OS CLIENTES
    /* test('Todos os Cliente: ', () async {
      Response result = await w.VerificarTodosCliente();

      print('Result Todos Cliente ${result.statusCode}');
      print('Result Todos Cliente ${result.body.toString()}');
      expect(result.statusCode, 200);
    }); */

    //TODO CRIAR PEDIDO
    /* test('Criar Pedido: ', () async {
      Response result = await w. CriarPedido(pedido);

      print('Criar Pedido ${result.statusCode}');
      print('Criar Pedido ${result.body.toString()}');

    });*/
    //TODO LIBERACAO DE CUSTODIA(resposta 404 nos exemplos)
    /*test('Liberação de Custódia: ', () async {
      Response result = await w.LiberarCustodia('ECW-HBSHS07RXJF0');

      print('Liberação de Custódia ${result.statusCode}');
      print('Liberação de Custódia ${result.body.toString()}');

    }); */
    //TODO VEREFICAR KEYS
    /*test('Verificar Keys', () async {
      Response result = await w.VerificarKeys();
      print('Result Verificar Keys ${result.statusCode}');
      print('result verificar keys ${result.body.toString}');
      expect(result.statusCode, 200);
    }); */
    //TODO CAPTURAR DO PAGAMENTO (EXEMPLO FECHA EM 400)
    /* test('Capturar Pagamento', () async {
      Response result = await w.CapturarPagamentoPreAutorizado('PAY-U1G2WVBEP19V');
      print('Result  captura de pagamento ${result.statusCode}');
      print('result captura de pagamento ${result.body.toString()}');

    }); */
    //TODO MULTIPAGAMENTOS
    /*test('Multi Pagamento', () async {
      Response result = await w.CriarMultiPagamento(ml);
      print('Result  Multi pagamento ${result.statusCode}');
      print('result Multi pagamento ${result.body.toString()}');
    });  */

    test('Notificação', () async {
      Response result = await w.CriarNotificacao(nf);
      print('Result notificacao ${result.statusCode}');
      print('result notificacao ${result.body.toString()}');
    });

    //TODO SIMULADOR DE PAGAMENTO
    /* test('Simulador Pagamento', () async {
      Response result = await w.SimuladorPagamentos('PAY-0UBH5IAJ8KHX', '26500');
      print('Result Verificar Pagamento ${result.statusCode}');
      expect(result.statusCode, 200);
    });*/
      //TODO VERIFICAR MULTIPAGAMENTOS
    /*test('MultiPagamento', () async {
      Response result = await w.VerificarMultiPagamentos('MOR-9241K3EFW5DV');
      print('Result Verificar Pagamento ${result.statusCode}');
      expect(result.statusCode, 200);
    }); */


    //TODO VERIFICAR CONTAWIRECARD
    /* test('Verificar contaWire', () async {
      Response result = await w.VerificarContaWirecard('vergil009@hotmail.com');
      print('Result Verificar Conta ${result.statusCode}');
      expect(result.statusCode, 200);
    }); */

    //TODO DELETAR CARTÃO CLIENTE
    /* test('Deletar Cartão de Credito', () async {
      Response result = await w.DeletarCartao('CRC-9OVU34EF7LU5');
      print('Result Deletar Card ${result.statusCode}');
      expect(result.statusCode, 200);
    });  */
    //TODO REGISTRAR APP
    /*test('Registrar App', () async {
      Response result = await w.RegistrarApp(app);
      print('Registrar App ${result.statusCode}');
      print('Registrar App ${result.body}');
      appRegistrado = AppRegistrado.fromJson(json.decode(result.body.toString()));
      print('APP TOKEN ${appRegistrado.accessToken}');
    }); */

    //TODO VERIFICAR CONTA PF

    /*9test('Verificando conta pf', () async{
         Response response = await w.VerificarContaPF('MPA-8307EF11B83E');

         print('Result da verificação ${response.statusCode}');
          print('body ${response.body}');

       });*/

    //TODO CRIAR CONTA PF
    /*ContaPFRegistrado contaPFRegistrado;

     test('Conta PF', () async {
      Response result = await w.CriarContaPF(cc);
      print('Result Conta PF ${result.statusCode}');
      print('Result Conta PF ${result.body}');
      contaPFRegistrado =
          ContaPFRegistrado.fromJson(jsonDecode(result.body.toString()));
      print('APP TOKEN ${cc.accessToken}');
    });  */

    //TODO CADASTRAR CLIENTE
    /* ClienteCadastrado clienteCadastrado;
    test('Cliente: ', () async {
      Response result = await w.CriarCliente(cjj);
      print('Result Clinte PF ${result.statusCode}');
      print('Result Clinte PF ${result.body}');
      clienteCadastrado =
          ClienteCadastrado.fromJson(jsonDecode(result.body.toString()));
      print('APP TOKEN ${cc.accessToken}');
    }); */

    //TODO TOKEN
    /*test('TOKEN', () async {
      Response result = await w.getAcessToken();
      print('TOKEN${result.statusCode}');
      print('TOKEN ${result.body}');
    }); */
  });
}

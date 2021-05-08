import 'dart:convert';

import 'package:Wirecard/Antecipacao/Antecipacao.dart';
import 'package:Wirecard/App.dart';

import 'package:Wirecard/Cliente/CartaoDeCredito/CartaoDeCredito.dart';

import 'package:Wirecard/Cliente/Cliente.dart';
import 'package:Wirecard/ContaBancaria/ContaBancaria.dart';
import 'package:Wirecard/ContaWirecard/Compania.dart';
import 'package:Wirecard/ContaWirecard/ContaPF.dart';
import 'package:Wirecard/ContaWirecard/ContaPJ.dart';
import 'package:Wirecard/ContaWirecard/TosAcceptance.dart';
import 'package:Wirecard/Conts.dart';
import 'package:Wirecard/MultiPagamentos/MultiPagamentos.dart';
import 'package:Wirecard/Notificacao/Notificacao.dart';
import 'package:Wirecard/Objetos/Adress.dart';

import 'package:Wirecard/Objetos/BillingAddress.dart';
import 'package:Wirecard/Objetos/BusinessSegment.dart';
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
import 'package:Wirecard/Objetos/Item.dart';
import 'package:Wirecard/Objetos/Links.dart';
import 'package:Wirecard/Objetos/MoipAccount.dart';
import 'package:Wirecard/Objetos/MultiPedido.dart';
import 'package:Wirecard/Objetos/Order.dart';
import 'package:Wirecard/Objetos/Payment.dart';
import 'package:Wirecard/Objetos/Person.dart';
import 'package:Wirecard/Objetos/Phone.dart';
import 'package:Wirecard/Objetos/Receiver.dart';
import 'package:Wirecard/Objetos/Self.dart';

import 'package:Wirecard/Objetos/ShippingAddress.dart';
import 'package:Wirecard/Objetos/SubTotals.dart';
import 'package:Wirecard/Objetos/TaxDocument.dart';
import 'package:Wirecard/Objetos/TransferInstrument.dart';
import 'package:Wirecard/Objetos/Webhook.dart';
import 'package:Wirecard/Objetos/mainActivity.dart';
import 'package:Wirecard/Pagamento/Liberacao/Liberacao.dart';
import 'package:Wirecard/Pagamento/Pagamento.dart';
import 'package:Wirecard/Pedido/Amount.dart';

import 'package:Wirecard/Pedido/Pedido.dart';
import 'package:Wirecard/Transferencia/Transferencia.dart';

import 'package:Wirecard/Wirecard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

Wirecard w = Wirecard(
  Environment.SANDBOX,
  'UROQ0DJO7SDVS3GRUUTVBI6YO3GACTCE',
  'ZNEQAI4ZC00JAUESVB5FEODMR00PQ62LL3CDGXXQ',
  appRegistrado,
);




App appRegistrado = App(
    name: 'Teste BocaBoca',
    redirectUri: 'https://www.bocaboca.com.br',
    description: 'Teste App bb',
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

ContaPF ccTrans = ContaPF(
    email: Email(address: 'dev.moip@labs.moip.com.br'),
    person: Person(
        address: Address(
            country: 'BRA',
            city: 'São Paulo',
            district: 'Itaim',
            state: 'SP',
            street: 'Av. Brigadeiro Faria Lima',
            streetNumber: '2927',
            zipCode: '01234-000'),
        phone: Phone(countryCode: '55', areaCode: '11', number: '965213244'),
        birthDate: '1990-01-01',
        identityDocument: IdentityDocument(
            number: '434322344',
            issuer: 'SSP',
            issueDate: '2000-12-12',
            type: 'RG'),
        taxDocument: TaxDocument(type: 'CPF', number: '123.456.798-91'),
        lastName: 'Random 9123',
        name: 'Runscope'),
    type: 'MERCHANT',
    transparentAccount: true);

ContaPJ pj = new ContaPJ(
  email: Email(address: 'mercado@mercado.com.br'),
  type: 'MERCHANT',
  businessSegment: BusinessSegment(id: '3'),
  
  person: Person(
      name: 'Bota',
      lastName: 'Dura',
      address: Address(
        zipCode: '10256-659',
        streetNumber: '40',
        street: 'Itai',
        state: 'PR',
        district: 'Federal',
        city: 'Castro',
        country: 'BRA',

      ),
      taxDocument: TaxDocument(type: 'CPF', number: '123.456.798-91'),
      phone: Phone(
        number: '965213244',
        areaCode: '11',
        countryCode: '55',
      ),

      birthDate: '2000-11-11',
      identityDocument: IdentityDocument(

          number: '215463897',
          type: 'RG',
          issueDate: '2000-12-12',
          issuer: 'SSP')),
  compania: Compania(
    taxDocument: TaxDocument(type: 'CPF', number: '123.456.798-91'),
    phone: Phone(
      number: '965213244',
      areaCode: '11',
      countryCode: '55',
    ),
    razaoSocial: 'Prioto',
    nome: 'Prioto Super',
    mainactivity:
        mainActivity(cnae: '82.91-1/00', description: 'Atividades de cobranças e informações cadastrais'),
    address: Address(
      zipCode: '10256-659',
      streetNumber: '40',
      street: 'Itai',
      state: 'PR',
      district: 'Federal',
      city: 'Castro',
      country: 'BRA',
    ),
  ),
  

    site: 'www.mercado.com.br',
);

ContaPF cc = new ContaPF(
    email: Email(address: 'Add@add.moip.com.br'),
    person: Person(
        name: 'Runscope 123',
        lastName: 'Random 9',
        taxDocument: TaxDocument(
          type: 'CPF',
          number: '089.293.159-09',
        ),
        identityDocument: IdentityDocument(
            number: '999322534',
            type: 'RG',
            issueDate: '2001-12-12',
            issuer: 'SSP'),
        birthDate: '1991-01-01',
        phone: Phone(number: '966903445', areaCode: '11', countryCode: '55'),
        address: Address(
            zipCode: '84168-140',
            streetNumber: '76',
            street: 'Rua Londrina',
            state: 'SP',
            district: 'Itaim',
            city: 'São Paulo',
            country: 'BRA')),
    type: 'MERCHANT');

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
  taxDocument: TaxDocument(number: '22288866644', type: "CPF"),
  birthDate: '1990-11-30',
  email: 'joao@email.com',
  ownId: 'meu_id_customer',
  fullname: 'João Silva',
  phone: Phone(number: '55552266', countryCode: '55', areaCode: '11'),
  shippingAddress: ShippingAddress(
    zipCode: '01234000',
    streetNumber: '500',
    street: 'Avenida Faria Lima',
    state: 'SP',
    city: 'São Paulo',
    district: 'Itaim Bibi',
    country: 'BRA',
    complement: '50',
  ),
);

Webhook wb =
    Webhook(event: 'PAYMENT.AUTHORIZED', resourceId: 'ORD-5QXM27Y9UTZT');

App app = new App(
    description: 'Descrição da platforma de teste para o boca a boca',
    name: 'bocaboca Teste',
    redirectUri: 'http://www.google.com.br',
    site: 'http://www.google.com.br/retorno');

List<Receiver> receiver = [
  Receiver(
      amount: Amount(subtotals: Subtotals(shipping: 1000), currency: 'BRL'),
      type: 'SECONDARY',
      feePayor: false,
      moipAccount: MoipAccount(id: 'MPA-E16FF9ECEE78'))
];
List<Item> items = [
  Item(
      detail: 'Mais info...',
      category: 'VIDEO_GAME_SOFTWARE_sdsa',
      price: 2000,
      product: 'Descrição do pedido',
      quantity: 1),
];
Pedido pedido = Pedido(
  ownId: 'id_pedido',
  amount: Amount(fixed: 55000),
  items: items,
  customer: Customer(id: 'CUS-6HLAPWBRG0SO'),
  receivers: receiver,
);

CreditCard cartaofim = CreditCard(
    method: 'CREDIT_CARD',
    number: '5555666677778884',
    expirationMonth: '06',
    expirationYear: '22',
    cvc: '123',
    holder: Holder(
        phone: Phone(number: '11162666', countryCode: '55', areaCode: '11'),
        birthdate: '1990-11-30',
        taxDocument: TaxDocument(number: '66688866555', type: 'CPF'),
        fullname: 'Jose'));

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
        hash:
            'HhL0kbhfid+jwgj5l6Kt9EPdetDxQN8s7uKUHDYxDC/XoULjzik44rSda3EcWuOcL17Eb8JjWc1JI7gsuwg9P0rJv1mJQx+d3Dv1puQYz1iRjEWWhnB1bw0gTvnnC/05KbWN5M8oTiugmhVK02Rt2gpbcTtpS7VWyacfgesBJFavYYMljYg8p2YGHXkXrMuQiOCeemKLk420d0OTMBba27jDVVJ663HZDrObnjFXJH/4B5irkj+HO5genV+V4PYoLcOESG4nrI3oFAsMGsLLcdJo0NNvkEmJpn0e9GzureKKFYisYU+BEd9EMr/odS0VMvOYRV65HbPTspIkjl2+3Q==',
        /*cvc: '123',
        expirationYear: '22',
        expirationMonth: '06',
        number: '4012001037141112',*/
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
MultiPagamentos ml = MultiPagamentos(
  installmentCount: 1,
  fundingInstrument: FundingInstrument(
      creditCard: CreditCard(
        number: '5555666677778884',
        expirationMonth: '06',
        expirationYear: '22',
        cvc: '123',
        method: 'CREDIT_CARD',
        holder: Holder(
          fullname: 'Jose Portador da Silva',
          birthdate: '1988-12-30',
          taxDocument: TaxDocument(type: 'CPF', number: '33333333333'),
          phone: Phone(number: '66778899', areaCode: '11', countryCode: '55'),
        ),
      ),
      method: 'CREDIT_CARD'),
);

Transferencia transferencia = Transferencia(
    amount: 502,
    transferInstrument: TransferInstrument(
        method: 'BANK_ACCOUNT',
        bankAccount: ContaBancaria(
            accountNumber: '12345',
            accountCheckNumber: '5',
            type: 'CHECKING',
            holder: Holder(
                fullname: 'Gustavo Vinicius Staron',
                taxDocument:
                    TaxDocument(type: 'CPF', number: '999.999.999-99')),
            agencyCheckNumber: '1',
            agencyNumber: '12345',
            bankNumber: '237')));

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

Notificacao n = Notificacao(
  events: ['ORDER.*', 'PAYMENT.*'],
  target: "http://requestb.in/1dhjesw1",
  media: "WEBHOOK",
);
ContaBancaria cb = ContaBancaria(
    bankNumber: '237',
    type: 'CHECKING',
    holder: Holder(
      taxDocument: TaxDocument(type: 'CPF', number: '622.134.533-22'),
    ),
    accountCheckNumber: '7',
    accountNumber: '12345678',
    agencyCheckNumber: '0',
    agencyNumber: '12345');
Notificacao nf = Notificacao(
    events: ['ORDER.*', "PAYMENT.AUTHORIZED", "PAYMENT.CANCELLED"],
    media: 'WEBHOOK',
    target: 'http://requestb.in/1dhjesw1');

MultiPedidos mt = MultiPedidos();

MultiPedidos multiPedido = MultiPedidos(ownId: 'meu_multiorder_id', orders: [
  Order(
      ownId: 'pedido_1_id',
      amount: Amount(
        currency: 'BRL',
        subtotals: Subtotals(shipping: 2000),
      ),
      items: [
        Item(
          detail: 'Seleção Brasileira',
          price: 2000,
          product: 'Camisa Verde e Amarelo - Brasil',
          quantity: 1,
        )
      ],
      customer: Customer(
          ownId: 'customer[1234]',
          fullname: 'Joao Sousa',
          email: 'joao.sousa@email.com',
          birthDate: '1988-12-30',
          taxDocument: TaxDocument(type: 'CPF', number: '22222222222'),
          phone: Phone(number: '66778899', areaCode: '11', countryCode: '55'),
          shippingAddress: ShippingAddress(
              zipCode: '01234000',
              streetNumber: '2927',
              complement: '8',
              street: 'Avenida Faria Lima',
              state: 'SP',
              district: 'Itaim',
              city: 'Sao Paulo',
              country: 'BRA')),
      receivers: [
        Receiver(
            moipAccount: MoipAccount(id: 'MPA-VB5OGTVPCI52'), type: 'PRIMARY')
      ]),
  Order(
      ownId: 'pedido_2_id',
      amount: Amount(
        currency: 'BRL',
        subtotals: Subtotals(shipping: 3000),
      ),
      items: [
        Item(
          detail: 'Camiseta da Copa 2014',
          price: 1000,
          product: 'Camisa Preta - Alemanha',
          quantity: 1,
        )
      ],
      customer: Customer(
          ownId: 'customer[1234]',
          fullname: 'Joao Sousa',
          email: 'joao.sousa@email.com',
          birthDate: '1988-12-30',
          taxDocument: TaxDocument(type: 'CPF', number: '22222222222'),
          phone: Phone(number: '66778899', areaCode: '11', countryCode: '55'),
          shippingAddress: ShippingAddress(
              zipCode: '01234000',
              streetNumber: '2927',
              complement: '8',
              street: 'Avenida Faria Lima',
              state: 'SP',
              district: 'Itaim',
              city: 'Sao Paulo',
              country: 'BRA')),
      receivers: [
        Receiver(
            moipAccount: MoipAccount(id: 'MPA-KQB1QFWS6QNM'),
            feePayor: false,
            amount: Amount(fixed: 55),
            type: 'SECONDARY'),
        Receiver(
          moipAccount: MoipAccount(id: 'MPA-IFYRB1HBL73Z'),
          type: 'PRIMARY',
        )
      ]),
]);

Antecipacao antecipacao = Antecipacao(externalId: 'ANT-5DB57BGL9FGT');

ContaBancaria contaBancaria = ContaBancaria(
    bankNumber: '237',
    type: 'CHECKING',
    agencyNumber: '12345',
    agencyCheckNumber: '8',
    accountCheckNumber: '8',
    accountNumber: '12345678',
    holder: Holder(
        taxDocument: TaxDocument(type: 'CPF', number: '622.134.533-22'),
        fullname: 'Demo Moip'));

void main() {
  group("Testes Wirecard", () {
    //TODO CRIAR CONTA BANCARIA
    /*test('Criar Conta Bancaria: ', () async {
      Response result = await w.CriarContaBancaria(cb, 'MPA-E16FF9ECEE78');

      print('Result Conta Bancaria ${result.statusCode}');
      print('Result Conta Bancaria ${result.body.toString()}');
    });*/

    //TODO LISTAR TODAS AS CONTAS BANCARIAS
    /* test('Consultar Todas as Conta Bancaria: ', () async {
      Response result = await w.ConsultarTodasContasBancarias('MPA-E16FF9ECEE78');

      print('Result Consultar Todas as Conta Bancaria ${result.statusCode}');
      print('Result Consultar Todas as Conta Bancaria ${result.body.toString()}');

    });*/

    //TODO ATUALIZAR CONTA BANCARIA
    /* test('Atualizar conta bancaria: ', () async {
      Response result = await w.AtualizarContaBancaria(contaBancaria,'BKA-XET4SGNPSV8T');

      print('Result Atualizar conta bancaria ${result.statusCode}');
      print('Result Atualizar conta bancaria ${result.body.toString()}');

    }); */

    //TODO CONSULTAR CONTA BANCARIA
    /*test('Consultar Conta Bancaria: ', () async {
      Response result = await w.ConsultarContaBancaria('BKA-XET4SGNPSV8T');

      print('Result Consultar Conta Bancaria ${result.statusCode}');
      print('Result Consultar Conta Bancaria ${result.body.toString()}');

    }); */
    //TODO DELETAR CONTA BANCARIA
    /* test('Deletar Conta Bancaria: ', () async {
      Response result = await w.DeletarContaBancaria('BKA-XET4SGNPSV8T');

      print('Result Deletar Conta Bancaria ${result.statusCode}');
      print('Result Deletar Conta Bancaria ${result.body.toString()}');

    });  */

   /* test('Consultar  Conta Wire: ', () async {
      Response result = await w.   VerificarContaWirecardExistente('MPA-A9F2157E4239');

      print('Consultar   Conta Wire ${result.statusCode}');
      print('Consultar  Conta Wire ${result.body.toString()}');

    }); */
    //TODO CONSULTAR SALDO NA CONTA WIRE
    /*test('Consultar Saldo Conta Wire: ', () async {
      Response result = await w.ConsultarSaldoWireCard();

      print('Consultar Saldo Conta Wire ${result.statusCode}');
      print('Consultar Saldo Conta Wire ${result.body.toString()}');

    }); */
    //TODO LISTAR EXTRATO
    /*test('Listar Extrato: ', () async {
      Response result = await w.ListarExtrato();
      print('Listar Extrato ${result.statusCode}');
      print('Listar Extrato ${result.body.toString()}');

    }); */

    /* test('Detalhar Extrato: ', () async {
      Response result = await w.DetalheExtrato();
      print('Detalhar Extrato ${result.statusCode}');
      print('Detalhar Extrato ${result.body.toString()}');
    }); */
    //TODO EXTRATO FUTURO
    /*test('Listar Extrato Futuro: ', () async {
      Response result = await w.ConsultarExtratoFuturo();

      print('Listar Extrato Futuro ${result.statusCode}');
      print('Listar Extrato Futuro ${result.body.toString()}');

    }); */

    //TODO DETALHE EXTRATO FUTURO
    /* test('Listar Detalhe Extrato Futuro: ', () async {
      Response result = await w.ConsultarDetalhesExtratoFuturo();

      print('Listar Detalhe Extrato Futuro ${result.statusCode}');
      print('Listar Detalhe Extrato Futuro ${result.body.toString()}');

    });*/

    //TODO TODOS OS LANÇAMENTOS
    /*test('Todos os Lançamentos: ', () async {
      Response result = await w.ConsultarTodosOsLancamentos();

      print('Todos os Lançamentos ${result.statusCode}');
      print('Todos os Lançamentos ${result.body.toString()}');

    }); */
    //TODO CONSULTAR LANCAMENTO
    /*test('Consultar Lançamento: ', () async {
      Response result = await w.ConsultarLancamento('ENT-GNAEA8JXEOLV');

      print('Consultar Lançamento ${result.statusCode}');
      print('Consultar Lançamento ${result.body.toString()}');

    });*/
    //TODO CRIAR TRANSFERENCIA
    /*test('Criar Transferencia: ', () async {
      Response result = await w.CriarTransferencia(transferencia);
      print('Criar Transferencia ${result.statusCode}');
      print('Criar Transferencia ${result.body.toString()}');
    });*/

    //TODO CANCELAR PAGAMENTO PRE AUTORIZADO
    /*test('Cancelar Pagamento pre autorizado: ', () async {
      Response result = await w.CancelarPagamentoPreAutorizado();

      print('Cancelar Pagamento pre autorizado ${result.statusCode}');
      print('Cancelar Pagamento pre autorizado ${result.body.toString()}');

    }); */
    //TODO REVERTER TRANSFERENCIA
    /* test('Reverter transferencia: ', () async {
      Response result = await w.ReverterTransferencia('TRA-B0W5FD5FCADG');

      print('Reverter transferencia ${result.statusCode}');
      print('Reverter transferencia ${result.body.toString()}');

    }); */

    //TODO LISTAR TODAS AS TRANSFERENCIAS
    /* test('Listar Todas as Transferencia: ', () async {
      Response result = await w.ConsultarTodasAsTransferencia();

      print('Listar Todas as Transferencia ${result.statusCode}');
      print('Listar Todas as Transferencia ${result.body.toString()}');

    });*/

    //TODO CONSULTAR TRANSFERENCIA
    /*test('Consultar Transferencia: ', () async {
      Response result = await w.ConsultarTransferencia('TRA-28HRLYNLMUFH');
      print('Consultar Transferencia ${result.statusCode}');
      print('Consultar Transferencia ${result.body.toString()}');

    });  */
    //TODO REEMBOLSO DE PAGAMENTO
    /*test('Reembolso Pagamento: ', () async {
      Response result = await w.Reembolsar('PAY-OK0AQYTLTLYL');
      print('Reembolso Pagamento ${result.statusCode}');
      print('Reembolso Pagamento ${result.body.toString()}');
    }); */
    //TODO REEMBOLSAR PEDIDO
    /* test('Reembolso Pedido: ', () async {
      Response result = await w.ReembolsarPedido('ORD-5QXM27Y9UTZT');
      print('Reembolso Pedido ${result.statusCode}');
      print('Reembolso Pedido ${result.body.toString()}');
    });*/

    //TODO CONSULTAR REEMBOLSO
    /* test('Consultar Reembolso: ', () async {
      Response result = await w.ConsultarReembolso('REF-7MSALWZMFIKQ');
      print('Consultar Reembolso ${result.statusCode}');
      print('Consultar Reembolso ${result.body.toString()}');
    });*/
    //TODO LISTAR REEMBOLSOS PAGAMENTO
    /*test('Listar Reembolsos Pagamento: ', () async {
      Response result = await w.ListarReembolsoPagamento('PAY-OK0AQYTLTLYL');
      print('Listar Reembolsos Pagamento ${result.statusCode}');
      print('Listar Reembolsos Pagamento ${result.body.toString()}');
    }); */
    //TODO LISTAR REEMBOLSO PEDIDO
    /*test('Listar Reembolsos Pedido: ', () async {
      Response result = await w.ListarReembolsoPedido('ORD-5QXM27Y9UTZT');
      print('Listar Reembolsos Pedido ${result.statusCode}');
      print('Listar Reembolsos Pedido ${result.body.toString()}');
    });*/
    //TODO OBTER ARQUIVO DE VENDAS
    /*test(' OBTER ARQUIVO DE VENDAS: ', () async {
      Response result = await w.ObterArquivoDeVendas('2020-06-26');
      print(' OBTER ARQUIVO DE VENDAS ${result.statusCode}');
      print(' OBTER ARQUIVO DE VENDAS ${result.body.toString()}');
    });*/

    /* test(' OBTER ARQUIVO DE VENDAS: ', () async {
      Response result = await w.ObterArquivoFinanceiro('2020-06-26');
      print(' OBTER ARQUIVO DE VENDAS ${result.statusCode}');
      print(' OBTER ARQUIVO DE VENDAS ${result.body.toString()}');
    });*/
    //TODO ESTIMATIVA DE ANTECIPAÇÃO
    /*test('Estimativa : ', () async {
      Response result = await w.Estimativa(500);
      print(' Estimativa ${result.statusCode}');
      print(' Estimativa ${result.body.toString()}');
    });*/

    //TODO CRIANDO PAGAMENTO
    /* test('Criar Pagamento: ', () async {
      print('aqui hash ${pagamento.hashCode}');
      Response result = await w.CriarPagamento(pagamento, 'ORD-5QXM27Y9UTZT');
      print('aqui hash ${pagamento}');
      print('Criar Pagamento ${result.statusCode}');
      print('Criar Pagamento ${result.body.toString()}');
    }); */
    //TODO SOLICITACAO DE ANTECIPACAO
    /*test('Solicitacao Antecipacao: ', () async {

      Response result = await w.SolicitacaoAntecipcao(1);

      print('Solicitacao Antecipacao ${result.statusCode}');
      print('Solicitacao Antecipacao ${result.body.toString()}');
    }); */
    //TODO TODAS AS ANTECIPAÇÕES
    /*test('Todas as Antecipações: ', () async {

      Response result = await w.ConsultarTodasAsAntecipacoes();

      print('Todas as Antecipações ${result.statusCode}');
      print('Todas as Antecipações ${result.body.toString()}');
    });*/

    /*test('Consultar Antecipações: ', () async {

      Response result = await w.ConsultarAntecipacao('ANT-5DB57BGL9FGT');
      print('Consultar Antecipações ${result.statusCode}');
      print('Consultar Antecipações ${result.body.toString()}');
    }); */

    //TODO CAPTURAR PAGAMENTO PRE AUTORIZADO
    /*test('Capturar Pagamento pre autorizado: ', () async {
      Response result = await w.CapturarPagamentoPreAutorizado();

      print('Capturar Pagamento pre autorizado ${result.statusCode}');
      print('Capturar Pagamento pre autorizado ${result.body.toString()}');

    }); */

    /*test('Capturar Multi Pagamento : ', () async {
      Response result = await w.ConsultarMultiPagamentos('MPY-6G3X3PVCVM33');

      print('Capturar Multi Pagamento${result.statusCode}');
      print('Capturar Multi Pagamento${result.body.toString()}');

    }); */

    //TODO CRIAR CARTÃO PARA O CLIENTE
    /* test('Cartao de Credito: ', () async {
      Response result = await w.CriarCartaoDeCredito(cartaofim);

      print('Result Cartao de Credito ${result.statusCode}');
      print('Result Cartao de Credito ${result.body.toString()}');

    });*/
    //TODO VERIFICAR TODOS OS PEDIDOS
    /*test('Todos os Pedido: ', () async {
      Response result = await w.VerificarTodosPedido();

      print('Result Todos os Pedido ${result.statusCode}');
      print('Result Todos os Pedido ${result.body.toString()}');
      expect(result.statusCode, 200);
    }); */
    //TODO VERIFICAR PEDIDO
    /*test('Pedido: ', () async {
      Response result = await w.VerificarPedido('ORD-5QXM27Y9UTZT');

      print('Result Pedido ${result.statusCode}');
      print('Result Pedido ${result.body.toString()}');
      expect(result.statusCode, 200);
    }); */

    //TODO VERIFICAR PAGAMENTO
    /* test ('Pagamento: ', () async {
      Response result = await w.VerificarPagamento('PAY-OK0AQYTLTLYL');

      print('Result Pagamento ${result.statusCode}');
      print('Result Pagamento ${result.body.toString()}');
      expect(result.statusCode, 200);

    });*/
    //TODO CRIAR MULTIPAGAMENTOS
    /*test('Criar MultiPagamento: ', () async {
      Response result = await w.CriarMultiPedidos(multiPedido);

      print('Result MultiPagamento ${result.statusCode}');
      print('Result MultiPagamento ${result.body.toString()}');
      expect(result.statusCode, 200);
    }); */

    //TODO VERIFICA CLIENTE

    /*test('Cliente: ', () async {
      Response result = await w.VerificarCliente('CUS-6HLAPWBRG0SO');

      print('Result Cliente ${result.statusCode}');
      print('Result Cliente ${result.body.toString()}');
       expect(result.statusCode, 200);
    });*/

    //TODO VERIFICAR MULTIPEDIDOS
    /*test('Verificar MultiPEDIDOS: ', () async {
      Response result = await w.VerificarMultiPedidos('MOR-IFXK0QYO8YAI');

      print('Result Verificar MultiPEDIDOS ${result.statusCode}');
      print('Result Verificar MultiPEDIDOS ${result.body.toString()}');
      expect(result.statusCode, 200);
    });  */

    //TODO LISTAR TODOS OS CLIENTES
    /* test('Todos os Cliente: ', () async {
      Response result = await w.VerificarTodosCliente();

      print('Result Todos Cliente ${result.statusCode}');
      print('Result Todos Cliente ${result.body.toString()}');
      expect(result.statusCode, 200);
    }); */

    //TODO CRIAR PEDIDO
    /*test('Criar Pedido: ', () async {
      Response result = await w. CriarPedido(pedido);

      print('Criar Pedido ${result.statusCode}');
      print('Criar Pedido ${result.body.toString()}');

    });  */
    //TODO LIBERACAO DE CUSTODIA(resposta 404 nos exemplos)
    /* test('Liberação de Custódia: ', () async {
      Response result = await w.LiberarCustodia('ECW-E16FF9ECEE78');
      print('Liberação de Custódia ${result.statusCode}');
      print('Liberação de Custódia ${result.body.toString()}');
    });  */
    //TODO CRIAR MULTI PEDIDO
    /*test('Multi Pedido: ', () async {
      Response result = await w.CriarMultiPedidos(multiPedido);
      print('Multi Pedido ${result.statusCode}');
      print('Multi Pedido ${result.body.toString()}');

    }) ;*/

    //TODO VEREFICAR KEYS
    test('Verificar Keys', () async {
      http.Response result = await w.VerificarKeys();
      print('Result Verificar Keys ${result.statusCode}');
      print('result verificar keys ${result.body.toString}');
      expect(result.statusCode, 200);
    });
    //TODO CAPTURAR DO PAGAMENTO (EXEMPLO FECHA EM 400)
    /* test('Capturar Pagamento', () async {
      Response result = await w.CapturarPagamentoPreAutorizado('PAY-U1G2WVBEP19V');
      print('Result  captura de pagamento ${result.statusCode}');
      print('result captura de pagamento ${result.body.toString()}');

    }); */
    //TODO CRIAR MULTIPAGAMENTOS
    /*test('Multi Pagamento', () async {
      Response result = await w.CriarMultiPagamento(ml, 'MOR-IFXK0QYO8YAI');
      print('Result  Multi pagamento ${result.statusCode}');
      print('result Multi pagamento ${result.body.toString()}');
    }); */

    //TODO CANCELAR PAGAMENTO PRE AUTORIZADO
    /* test('Cancelar Pagamento Pré-Autorizado', () async {
      Response result = await w.CapturarMultiPagamentos('MPY-6CG2B4QF1TDD');
      print('Result Cancelar Pagamento Pré-Autorizado ${result.statusCode}');
      print('result Cancelar Pagamento Pré-Autorizado ${result.body.toString()}');
    });  */

    //TODO MULTI CAPTURA DE PAGAMENTO
    /*test('Multi Captura de pagamento', () async {
      Response result = await w.CapturarMultiPagamentos('MPY-6CG2B4QF1TDD');
      print('Result Multi Captura de pagamento ${result.statusCode}');
      print('result Multi Captura de pagamento ${result.body.toString()}');
    });*/

    //TODO LIBERACAO MULTI PAGAMENTOS
    /*test('Multi Liberacao de pagamento', () async {
      Response result = await w.CapturarMultiPagamentos('ECW-87E7UUF9N2EK');
      print('Result Multi Liberacao de pagamento ${result.statusCode}');
      print('result Multi Liberacao de pagamento ${result.body.toString()}');
    }); */

    //TODO NOTIFICACAO APP
    /* test('Notificação App', () async {
      Response result = await w.CriarNotificacaoApp(n);
      print('Result notificacao  app ${result.statusCode}');
      print('result notificacao app ${result.body.toString()}');
    }); */
    //TODO DELETAR PREFERENCIA RESPOSTA DEVE VIR VAZIA 204
    /* test('Deletar Preferencia', () async {
      Response result = await w.DeletarPreferenciaNotificacao('NPR-NBQFXBDSHN6Y');
      print('Result Deletar Preferencia ${result.statusCode}');
      expect(result.statusCode, 204);
    });  */

    //TODO NOTIFICACAO CONTA WIRECARD
    /*test('Notificação Conta WireCard', () async {
      Response result = await w.CriarNotificacaoContaWire(nf);
      print('Result notificacao ${result.statusCode}');
      print('result notificacao ${result.body.toString()}');
    }); */
    //TODO CONSULTAR LISTA PREFERENCIA DE NOTIFICACAO

    /* test('Consultar Lista de Preferencia', () async {
      Response result = await w.ListarTodasAsPreferencia();
      print('Result Consultar Lista Preferencia  ${result.statusCode}');
      print('result Consultar Lista Preferencia  ${result.body.toString()}');
    }) ; */

    //TODO CONSULTAR PREFERENCIA DE NOTIFICACAO
    /* test('Consultar Preferencia de Notificacao', () async {
      Response result = await w.ConsultarPreferenciaNotificacao('NPR-NBQFXBDSHN6Y');
      print('Result Consultar Preferencia notificacao ${result.statusCode}');
      print('result Consultar Preferencia notificacao ${result.body.toString()}');
    });*/
    //TODO WEBHOOK
    /*test('Consultar Webhook Enviado', () async {
      Response result = await w.ConsultarWebhook('PAY-ABTH5JC7B5J9');
      print('Result Consultar WebHook ${result.statusCode}');
      print('result Consultar WebHook ${result.body.toString()}');
    });*/
    //TODO CONSULTAR WEBHOOK
    /*test('Consultar Webhook Reenviado', () async {
      Response result = await w.ReenviarWebhook(wb);
      print('Result Reenviado WebHook ${result.statusCode}');
      print('result Reenviado WebHook ${result.body.toString()}');
    });*/

    // TODO TODOS OS WEBHOOKS
    /*test('Consultar Todos Webhook Enviado', () async {
      Response result = await w.ConsultarTodosWebHook();
      print('Result Consultar Todos WebHook ${result.statusCode}');
      print('result Consultar Todos WebHook ${result.body.toString()}');
    });*/

    //TODO SIMULADOR DE PAGAMENTO
    /* test('Simulador Pagamento', () async {
      Response result = await w.SimuladorPagamentos('PAY-HL7QRKFEQNHV', '30000');
      print('Result Verificar Pagamento ${result.statusCode}');
      expect(result.statusCode, 200);
    });*/
    //TODO VERIFICAR MULTIPAGAMENTOS
    /*test('MultiPagamento', () async {
      Response result = await w.VerificarMultiPagamentos('MPY-6G3X3PVCVM33');
      print('Result Verificar Pagamento ${result.statusCode}');
      expect(result.statusCode, 200);
    });*/

    //TODO DELETAR CARTÃO CLIENTE
    /* test('Deletar Cartão de Credito', () async {
      Response result = await w.DeletarCartao('CRC-9OVU34EF7LU5');
      print('Result Deletar Card ${result.statusCode}');
      expect(result.statusCode, 200);
    });  */

    //TODO CADASTRAR CLIENTE

    /*test('Cliente: ', () async {
      Response result = await w.CriarCliente(cjj);
      print('Result Clinte  ${result.statusCode}');
      print('Result Clinte  ${result.body}');

      print('APP TOKEN ${cc.accessToken}');
    }); */

    //TODO CRIAR CONTA WIRE TRANSPARENTE
    /*test('Conta wire transparente', () async {
      Response result = await w.CriarContaWireTransparente(ccTrans);
      print('Result Conta wire transparente ${result.statusCode}');
      print('Result Conta wire transparente ${result.body}');

      print('APP TOKEN ${cc.accessToken}');
    });*/

    //TODO TOKEN
    /*test('TOKEN', () async {
      Response result = await w.getAcessToken();
      print('TOKEN${result.statusCode}');
      print('TOKEN ${result.body}');
    }); */

    //TODO CRIAR CONTA PJ
   /* test('Conta PJ', () async {
      Response result = await w.CriarContaPJ(pj);
      print('Result Conta PJ ${result.statusCode}');
      print('Result Conta PJ ${result.body}');
      print('APP TOKEN ${cc.accessToken}');
    }); */

    //TODO CRIAR CONTA PF

    /*test('Conta PF', () async {
      Response result = await w.CriarContaPF(cc);
      print('Result Conta PF ${result.statusCode}');
      print('Result Conta PF ${result.body}');

      print('APP TOKEN ${cc.accessToken}');
    }); */

    //TODO SOLICITAR PERMISSÕES DE ACESSO AO USUÁRIO
    /*test('Verificando Permissao', () async{
      Response response = await w.PermissoesAcessosUsuario();

      print('Result Verificando Permissao ${response.statusCode}');
      print('body ${response.body}');

    });*/

    //TODO VERIFICAR CONTA PF

    /* test('Verificando conta pf', () async{
      Response response = await w.VerificarContaPF('MPA-8307EF11B83E');
      print('Result da verificação ${response.statusCode}');
      print('body ${response.body}');

    });*/

    //TODO VERIFICAR SE POSSUI CONTAWIRECARD
    /*test('Verificar contaWire', () async {
      Response result = await w.VerificarContaWirecard('gustaron5@gmail.com');
      print('Result Verificar Conta ${result.statusCode}');
      expect(result.statusCode, 200);
    });*/

    //TODO REGISTRAR APP
    test('Registrar App', () async {
      http.Response result = await w.RegistrarApp(app);
      print('Registrar App ${result.statusCode}');
      print('Registrar App ${result.body}');
      appRegistrado = App.fromJson(json.decode(result.body.toString()));
      print('APP TOKEN ${appRegistrado.accessToken}');
    });
  });
}

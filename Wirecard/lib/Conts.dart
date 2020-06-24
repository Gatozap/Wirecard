class Environment {
  static Environment get PRODUCTION => const Environment(
        apiUrl: "https://api.cieloecommerce.cielo.com.br",
      );
  static Environment get SANDBOX => const Environment(
        apiUrl: "https://sandbox.moip.com.br/",
      );

  final String apiUrl;

  const Environment({
    this.apiUrl,
  });
}

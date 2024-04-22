class Moeda{
  final String nome;
  final double real;
  final double dolar;
  final double euro;

  Moeda(this.nome, this.real, this.dolar, this.euro);

  static List<Moeda> getMoedas(){
    return <Moeda> [
      Moeda('Real', 1.0, 0.18, 0.15),
      Moeda('Dolar', 5.0, 1.0, 0.85),
      Moeda('Euro', 6.0, 1.18, 1.0),
    ];
  }
}
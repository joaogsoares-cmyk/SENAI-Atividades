[Theory]
[InlineData(70.0, 1.75, 22.86)]
[InlineData(50.0, 1.70, 17.30)]
[InlineData(80.0, 1.75, 26.12)]
[InlineData(95.0, 1.75, 31.02)]
[InlineData(110.0, 1.75, 35.92)]
[InlineData(130.0, 1.75, 42.45)]
public void CalcularImc_DeveRetornarValorEsperado(double peso, double altura, double imcEsperado)
{
    double resultado = _operacoes.CalcularImc(peso, altura);

    Assert.Equal(imcEsperado, resultado);
}

[Theory]
[InlineData(0, 1.75)]
[InlineData(-70, 1.75)]
[InlineData(70, 0)]
[InlineData(70, -1.75)]
public void CalcularImc_DeveLancarExcecao_QuandoEntradaInvalida(double peso, double altura)
{
    Assert.Throws<ArgumentOutOfRangeException>(() => _operacoes.CalcularImc(peso, altura));
}

[Theory]
[InlineData(18.49, "Baixo peso")]
[InlineData(18.50, "Peso normal")]
[InlineData(24.90, "Peso normal")]
[InlineData(25.00, "Sobrepeso")]
[InlineData(29.90, "Sobrepeso")]
[InlineData(30.00, "Obesidade Grau I")]
[InlineData(34.90, "Obesidade Grau I")]
[InlineData(35.00, "Obesidade Grau II")]
[InlineData(39.90, "Obesidade Grau II")]
[InlineData(40.00, "Obesidade Grau III")]
[InlineData(45.50, "Obesidade Grau III")]
public void ClassificarImcAbeso_DeveRetornarClassificacaoCorreta(double imc, string classificacaoEsperada)
{
    string resultado = _operacoes.ClassificarImcAbeso(imc);

    Assert.Equal(classificacaoEsperada, resultado);
}

[Theory]
[InlineData(0)]
[InlineData(-10)]
[InlineData(double.NaN)]
[InlineData(double.PositiveInfinity)]
public void ClassificarImcAbeso_DeveLancarExcecao_QuandoImcInvalido(double imc)
{
    Assert.Throws<ArgumentOutOfRangeException>(() => _operacoes.ClassificarImcAbeso(imc));
}

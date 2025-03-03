# runTests.ps1
# Este script facilita os testes do sistema Prolog com valores presetados.

# Define os valores de entrada pré-definidos.
# A sequência corresponde a:
# 1. Escolha da opção no menu (1 para avaliar o cliente)
# 2. Nome do cliente (aqui, "cliente_teste")
# 3. Consumo atual (baixo)
# 4. Consumo médio (medio)
# 5. Consumo estimado (alto)
# 6. Histórico de infração (sim)
# 7. Tensao inicial (220)
# 8. Tensao final (200)
# 9. Resistência (1)
# 10. Corrente de entrada (13)
# 11. Corrente de saída (10)
# 12. Em seguida, opção para sair do menu (2)
$testInput = @"
1.
"cliente_teste".
baixo.
medio.
alto.
sim.
220.
200.
1.
13.
10.
2.
"@

# Salva a entrada de teste em um arquivo temporário.
$tempInputFile = "tempInput.txt"
$testInput | Out-File -FilePath $tempInputFile -Encoding ASCII

# Executa o SWI-Prolog carregando o arquivo Prolog (ex: sistema.pl),
# iniciando pelo predicado start e terminando a execução com halt.
& swipl -s sistema.pl -g start -t halt < $tempInputFile

# Remove o arquivo temporário após a execução.
Remove-Item $tempInputFile
# Olho Vivo API 

## Linhas 
A categoria Linhas possibilita a consulta pelas linhas de ônibus da cidade de São Paulo, bem como suas informações cadastrais como por exemplo: horário de operação da linha, dias de operação (dia útil, sábado ou domingo) e extensão da linha (em metros).

### Buscar Linha
Realiza uma busca das linhas do sistema com base no parâmetro informado. Se a linha não é encontrada então é realizada uma busca fonetizada na denominação das linhas.

Aceita o número da linha ou nome (total ou parcial)
- 7060
- Capelinha

#### Resposta:
- cl : Id único da linha (int)
- lc : Opera no modo Circular? (bool)
- lt : Primeira Parte do letreiro numerico da linha
- tl : Segunda Parte do letreiro numerico da linha
...

### BuscarLinhaSentido
Realiza uma busca das linhas do sistema com base no parâmetro informado. Se a linha não é encontrada então é realizada uma busca fonetizada na denominação das linhas. A linha retornada será unicamente aquela cujo sentido de operação seja o informado no parâmetro sentido.

Aceita o número da linha ou nome (total ou parcial)
- 7060
- Capelinha

#### Respostas
( Mesma Resposta do `Buscar Linha` )

## Paradas
A categoria Paradas possibilita a consulta pelos pontos de parada da cidade de São Paulo. Atualmente esta categoria contempla apenas as paradas de corredores.

### Buscar Paradas
Realiza uma busca fonética das paradas de ônibus do sistema com base no parâmetro informado.

Aceita nome da parada ou endereço de localização (total ou parcial).
- Afonso
- Balthazar da Veiga

### Buscar Paradas Por Linha
Realiza uma busca por todos os pontos de parada atendidos por uma determinada linha.

## Corredores
A categoria Corredores possibilita uma consulta que retorna todos os corredores inteligentes da cidade de São Paulo.

### Buscar Todos Corredores
Retorna uma lista com todos os corredores inteligentes

## Posição Dos Veículos
A categoria Posição Dos Veículos é a responsável por retornar a posição exata de cada veículo de qualquer linha de ônibus da SPTrans

### Buscar Todos Veiculos Mapeados 
Retorna uma lista completa com a última localização de todos os veículos mapeados com suas devidas posições

### Buscar Veiculos Por Linha
Retorna uma lista com todos os veículos de uma determinada linha com suas devidas posições lat / long

## Previsão De Chegada
A categoria Previsão de chegada é a responsável por retornar a previsão de chegada de cada veículo de uma determinada linha e de um determinado ponto de parada, além da localização exata de cada veículo que constar na cadeia de previsões.
Obs.: As previsões são baseadas no horário também informado no retorno dos métodos.

### Buscar Previsão de Chegada por Linha e Parada
Retorna uma lista com a previsão de chegada dos veículos da linha informada que atende ao ponto de parada informado.

### Buscar Previsão de Chegada por Linha
Retorna uma lista com a previsão de chegada de cada um dos veículos da linha informada em todos os pontos de parada aos quais que ela atende.

### Buscar Previsão de Chegada por Parada
Retorna uma lista com a previsão de chegada dos veículos de cada uma das linhas que atendem ao ponto de parada informado.

## Velocidade Nas Vias
A categoria Velocidade nas Vias é a responsável por retornar um arquivo KMZ contendo um mapa de fluidez da cidade com a velocidade média e tempo de percurso de cada trecho envolvido.

## Mais Informações
[Documentação](https://sptrans.com.br/desenvolvedores/api-do-olho-vivo-guia-de-referencia/documentacao-api/)
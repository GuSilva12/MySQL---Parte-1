# FUNÇÕES DE DATA E HORA
# CURDATE() - retorna a data corrente (Atual)
SELECT CURDATE() AS "Data Atual";

# CURTIME() - retorna o horário corrente (Atual)
SELECT CURTIME() AS "Hora Atual";
-- CURRENT_TIME() - idêntico ao CURTIME()
SELECT CURRENT_TIME() AS "Hora Atual";

# DATE_ADD(data, intervalo) - soma dado intervalo à data corrente (atual)
SELECT DATE_ADD(CURDATE(), INTERVAL 3 DAY) AS "Data de Vencimento";		-- somando 3 dias à data corrente (atual)

# DATE_SUB(data, intervalo) - subtrai dado intervalo 
SELECT DATE_SUB(CURDATE(), INTERVAL 10 DAY) AS "Data de matrícula";		-- subtraindo 10 dias à data corrente (atual)

# DATEDIFF(expressao1, expressao2) - retorna o valor da diferença entre "expressao1" e "expressao2", podendo ambos serem uma data ou data e horário
SELECT DATEDIFF(CURDATE(), DATE_SUB(CURDATE(), INTERVAL 10 DAY)) AS "Dias em atraso";		-- verificando a diferença entre a data corrente (atual) e 10 dias

# DATEFORMAT(data, formato) - retorna a data formatada conforme os parâmetros passados
SELECT DATE_FORMAT(CURDATE(), "%d/%m/%y") AS "Data Formatada";		-- retornando a data no formato dd/mm/aaaa

# DAYNAME(data) - retorna o dia da semana da data corrente (atual)
SELECT DAYNAME(CURDATE()) AS "Dia da Semana";

# DAYOFFMONTH(data) - retorna o dia do mês para a data corrente (atual)
SELECT DAYOFMONTH (CURDATE()) AS "Dia do Mês";

# DAYOFFWEEK() - retorna o dia da semana: 1 para domingo, 2 para segunda, etc
SELECT DAYOFWEEK(CURDATE()) AS "Dia da Semana";

# DAYOFFYEAR(data) - retorna o dia do ano para a data corrente
SELECT DAYOFYEAR(CURDATE()) AS "Dia do Ano";

# FROM_DAYS() - transforma a numeração informada em dias para uma data referente à esta numeração
SELECT FROM_DAYS(780500) AS "Data Real";

# NOW() - retorna a data e horário atual
SELECT NOW() AS "Data/Hora Atual";
SELECT DATE_FORMAT(NOW(), "%d/%m/%y %h:%m:%S") AS "Data/Hora Atual";	-- retornando a data e horário atual (NOW) formatados de acordo com pos parâmetros estabelecidos (dd/mm/yyyy hh:mm:ss)
# CURRENT_TIMESTAMP() - retorna a data e horário atual, similar ao NOW()
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), "%d/%m/%y %h:%m:%S") AS "Data/Hora Atual";

# TIME() - pode ser usado para extrair a hora do timestamp corrente
SELECT TIME (CURRENT_TIMESTAMP()) AS "Hora";

# SET_TO_TIME(segundos) - converte um valor em segundos para horas, minutos e segundos
SELECT SEC_TO_TIME(2000) AS "Tempo Total";								-- aqui, convertemos 2000 segundos para horas, minutos e segundos

# TIME_TO_SEC(hora) - converte um valor em horas para segundos
SELECT TIME_TO_SEC("00:32:44") AS "Em segundos";

# HOUR(hora), MINUTE(hora) SECOND(hora) - retornando a hora, minuto e segundo de valores fornecidos, podento inclusive ser correntes (CURRENT_TIMESTAMP())
SELECT HOUR("12:30:34") AS Hora, MINUTE("12:30:34") AS Minuto, SECOND("12:30:34") AS Segundos;
SELECT HOUR(TIME(CURRENT_TIMESTAMP())) AS Hora,
	MINUTE(TIME(CURRENT_TIMESTAMP())) AS Minutos,
    SECOND(TIME(CURRENT_TIMESTAMP())) AS Segundos;
    
# PERIOD_DIFF(periodo1, periodo2) - retonra o numero de meses entre os dois periodos, que devem estar no formaro AAMM ou AAAAMM
SELECT PERIOD_DIFF(201912, 201903) AS "Meses Restantes";	

# TIME_DIFF(hora1, hora2)
SELECT  TIMEDIFF("12:35:34", "12:30:46") AS Diferença;

# QUARTER(data) - retorna o número do trimestre do ano da data informada
SELECT QUARTER("2019-03-17") AS 'Trimestre do ano';

# WEEK(data) - retorna o número da semana da data informada
SELECT WEEK('2019-03-17') AS "Semana do Ano";

# WEEKDAY(data) - retorna o dia da semana que inicia com segunda-feira para uma data 
SELECT WEEKDAY("2019-03-17") AS "Dia da Semana";

# YEAR(data) - retorna o ano da data informada
SELECT YEAR("2019-03-17") AS "Ano";

# MONTH() - retorna o mes da data informada
SELECT MONTH("2019-03-17") AS "Mês"; 

# DAY(data) - retorna o dia da data informada
SELECT DAY("2019-03-17") AS "Dia";
SELECT DAY(NOW()) AS "Dia Atual";
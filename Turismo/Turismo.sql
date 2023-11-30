

CREATE DATABASE turismo
GO
USE turismo
GO
CREATE TABLE motorista (
codigo				  INT        NOT NULL,
nome			   VARCHAR(40)   NOT NULL,
naturalidade       VARCHAR(40)   NOT NULL
PRIMARY KEY(codigo)
)
GO

CREATE TABLE onibus (
placa              CHAR(7)       NOT NULL,
marca            VARCHAR(15)     NOT NULL,
ano                INT           NOT NULL,
descricao		 VARCHAR(20)     NOT NULL
PRIMARY KEY(placa)
)
GO
CREATE TABLE viagem (
codigo				INT								 NOT NULL,
placa_onibus      CHAR(7)							 NOT NULL,
codigo_motorista    INT								 NOT NULL,
hora_saida			INT		CHECK(hora_saida>=0)	 NOT NULL,      
hora_chegada	    INT  	CHECK(hora_chegada>=0)	 NOT NULL,
partida			VARCHAR(40)							 NOT NULL,
destino			VARCHAR(40)							 NOT NULL
PRIMARY KEY (codigo, placa_onibus, codigo_motorista),
FOREIGN KEY (placa_onibus) REFERENCES onibus (placa),
FOREIGN KEY (codigo_motorista) REFERENCES motorista (codigo)
)

SELECT * FROM motorista
SELECT * FROM onibus
SELECT * FROM viagem


	--1
		SELECT CONVERT(VARCHAR(10),codigo) AS ID, nome AS NOME
		FROM motorista
	UNION
		SELECT placa AS ID , marca AS NOME
		FROM onibus



	--2	
		CREATE VIEW v_motorista_onibus
	AS	
	SELECT CONVERT(VARCHAR(10),codigo) AS ID, nome AS NOME
		FROM motorista

		UNION
		SELECT placa AS ID , marca AS NOME
		FROM onibus

		SELECT * FROM v_motorista_onibus


	--3

		CREATE VIEW v_descricao_onibus
	AS
		SELECT mo.nome, SUBSTRING(oni.placa,1,3)+'-'+SUBSTRING(oni.placa,4,4), 
		oni.marca, vi.codigo, oni.ano, oni.descricao
		FROM onibus oni, viagem vi, motorista mo
		WHERE mo.codigo = vi.codigo_motorista
		AND vi.placa_onibus = oni.placa 


	--4
		

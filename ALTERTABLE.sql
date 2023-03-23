CREATE DATABASE ads_justica;
USE ads_justica;
-- Abaixo tem o script da ciração da tabale advogado
CREATE TABLE tb_advogado(
	oab int,
    nome int
);
-- Abaixo tenho script da criação da tabela justiçal
CREATE TABLE tb_justica(
	id int,
    instancia char(1)
);

-- Administrando as tabelas com ALTER


-- Alterando o nome de uma coluna
ALTER TABLE tb_advogado CHANGE nome nome_completo varchar(50);

-- Criando a PK em uma tabela
ALTER TABLE tb_advogado ADD PRIMARY KEY(oab);
ALTER TABLE tb_justica ADD PRIMARY KEY(id);


-- Criar novas colunas na tabela
ALTER TABLE tb_advogado ADD COLUMN especialidade VARCHAR(30) DEFAULT 'Contitucionalista' NOT NULL;
ALTER TABLE tb_justica ADD COLUMN uf CHAR(2);

-- Alterando estrutura de uma coluna para adicionar restrição de preenchimento
ALTER TABLE tb_advogado ADD CHECK (especialidade IN ('Constitucionalista', 'Tributarista', 'Processualista',
 'Penal'));
 
 -- Alterar o tipo de dado de uma determinada coluna
 ALTER TABLE tb_justica MODIFY instancia VARCHAR (15);
 
 -- Criando uma nova tabela no projeto
 CREATE TABLE proc (
	cod int primary key,
    descricao varchar(60),
    oba int,
    id int
 );
 
 -- Renomear as tabelas
 RENAME TABLE proc TO tb_processo;
 
 -- Corrigir a coluna OAB da tabela processo para ser o mesmo tipo de dado da coluna
 -- OAB da tabela advogado
 -- ALTER TABLE tb_processo MODIFY oab INT;
 ALTER TABLE tb_processo CHANGE oba oab int;
 
 -- Criando a relação com as FK
 ALTER TABLE tb_processo ADD FOREIGN KEY (oab) REFERENCES tb_advogado (oab);
 ALTER TABLE tb_processo ADD CONSTRAINT mds FOREIGN KEY (id) REFERENCES tb_justica (id);
 
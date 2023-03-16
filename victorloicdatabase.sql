CREATE DATABASE victorloic;
USE victorloic;
CREATE TABLE vedendor (
	codigo int primary key auto_increment,
    nome varchar(100) not null,
	salario decimal(8,2),
    telefone int,
    sexo char(1),
    check (sexo in ('m', 'f'))
);

CREATE TABLE fabricante (
	codigo int primary key auto_increment,
    nome varchar(100) not null
);

CREATE TABLE produto (
	codigo int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(8,2),
    fabricante int,
    foreign key (fabricante) references fabricante(codigo)
);

CREATE TABLE cliente (
	id int primary key auto_increment,
    nome varchar(100) not null,
    nome_rua varchar(60),
    bairro varchar(40),
    cep varchar(40) not null unique,
    uf char(2),
    telefone int not null,
    desconto decimal(3,1),
    sexo char(1),
    check(sexo in ('m', 'f')),
    check(uf in ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 
    'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 
    'PR', 'PE', 'PI', 'RR', 'RO', 'RJ', 'RN', 
    'RS', 'SC', 'SP', 'SE', 'TO'))
);

CREATE TABLE pedido (
	id int primary key auto_increment,
    tipopagamento varchar(100),
    idcliente int,
    dataentrada date not null,
    dataembarque date not null,
    desconto decimal(3,1),
    valortotal decimal(8,2) not null,
    telefone int not null,
    formapagamento varchar(40),
    foreign key (idcliente) references cliente(id)
);

CREATE TABLE item_pedido(
	codigoproduto int,
    idpedido int,
    quantidade int not null,
    primary key (codigoproduto, idpedido),
    foreign key (codigoproduto) references produto(codigo),
    foreign key (idpedido) references pedido(id)
);
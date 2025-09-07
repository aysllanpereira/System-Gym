
create table alunos (
    id_aluno int auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(100),
    cpf varchar(11) unique,
    endereco varchar(100),
    data_nascimento date,
    id_plano int,
    data_cadastro timestamp default current_timestamp,
    foreign key (id_plano) references planos(id_aluno)
);

create table planos (
    id_plano int auto_increment primary key,
    nome varchar(100),
    preco decimal(10, 2) not null,
    validade_dias int not null
);

create table pagamentos (
    id_pagamento int auto_increment primary key,
    id_aluno int not null,
    valor decimal(10, 2),
    data_pagamento date not null,
    status enum('pago', 'pendente') default 'pago',
    foreign key (id_aluno) references alunos(id_aluno)
);

create table presencas (
    id_presenca int auto_increment primary key,
    id_aluno int not null,
    data_presenca date not null,
    hora_entrada time,
    foreign key (id_aluno) references alunos(id_aluno)
);

create table treinos (
    id_treino int auto_increment primary key,
    id_aluno int not null,
    objetivo enum('emagrecimento', 'hipertrofia', 'condicionamento', 'saude') not null,
    descricao text,
    data_criacao timestamp default current_timestamp,
    foreign key (id_aluno) references alunos(id_aluno)
);

create table relatorio (
    id_relatorio int auto_increment primary key,
    tipo enum('ativos', 'inadimplentes') not null,
    data_geracao timestamp default current_timestamp,
    obs text
);
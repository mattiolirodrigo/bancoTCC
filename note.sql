create table usuarios (
	codigo int primary key not null identity,
	nome varchar(255) not null,
	sexo char(1) not null,
	dt_nasc date not null,
	telefone varchar(11) not null,
	dt_registro datetime not null
)

create table login (
	codigo int primary key not null identity,
	codigo_usuario int not null,
	email varchar(255) not null,
	senha_hash varchar(60) not null,
	token_session varchar(32) null,
	token_t varchar(32) null,
	constraint fk_login_usuario foreign key (codigo_usuario)
	references usuarios(codigo)
)

create table avaliacao (
	codigo int primary key not null identity,
	codigo_usuario int not null,
	proc_odonto varchar(255) null,
	hist_clinico varchar(255) null,
	alergia varchar(255) null,
	cond_medica varchar(255) null,
	trat_andamento varchar(255) null,
	constraint fk_avaliacao_usuario foreign key (codigo_usuario)
	references usuarios(codigo)
)

select 
nome, 
IIF(sexo =  'M', 'MASCULINO', 'FEMININO') [sexo],
convert(char(10), a.dt_nasc, 103) [dt_nasc], 
convert(char(10), a.dt_registro, 103) [dt_registro], 
b.email, 
b.senha,
proc_odonto,
hist_clinico,
alergia ,
cond_medica,
trat_andamento
from TREATDENTAL.dbo.usuarios a
inner join login as b on b.codigo_usuario = a.codigo
left join avaliacao as c on c.codigo_usuario = a.codigo
--where ?`

select 
b.email, 
b.senha_hash
from TREATDENTAL.dbo.login b
where b.email = ${data.email}

DECLARE @codigoGerado TABLE (codigo INT);
INSERT INTO usuarios (nome, sexo, dt_nasc, telefone, dt_registro)
OUTPUT INSERTED.codigo INTO @codigoGerado
VALUES (${data.nome}, ${data.sexo}, ${data.dt_nasc}, ${data.telefone}, getdate());
SELECT codigo AS NovoCodigo FROM @codigoGerado;

insert into TREATDENTAL.dbo.login
(codigo_usuario, email, senha_hash) 
values 
(${newUser}, ${data.email}, ${data.password})

update login set senha = ${data.password} where email = ${email}
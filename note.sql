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

create table anamnese (
	codigo int primary key not null identity,
	codigo_usuario int not null,
	data date not null,
	hn_onicofagia  bit not null,
	hn_mt  bit not null,
	hn_mo  bit not null,
	hn_ml  bit not null,
	hn_rpb bit not null,
	hn_sc bit not null,
	hn_briquismo bit not null,
	hn_tgb bit not null,
	hn_tabagista bit not null,
	hn_tabagista_obs varchar(255) null,
	hn_etilista bit not null,
	hn_etilista_obs varchar(255) null,
	hn_ad bit not null,
	hn_chupeta bit not null,
	hn_detalhes text null,

	hg_ff_dental bit not null,
	hg_unitufo_bitufo bit not null,
	hg_bochecho bit not null,
	hg_escova_inter bit not null,
	hg_creme_dental bit not null,
	hg_outros bit not null,
	hg_palito bit not null,
	hg_escova_normal bit not null,
	hg_escova_eletrica bit not null,
	hg_num_vezes int not null,
	hg_op_acordar bit not null,
	hg_op_cafe bit not null,
	hg_op_almoco bit not null,
	hg_op_jantar bit not null,
	hg_op_dormir bit not null,
	hg_detalhes text null,

	ef_domic_abast bit not null,
	ef_domic_abast_tempo varchar(50) null,
	ef_creme_dental bit not null,
	ef_bochecho bit not null,
	ef_dentista bit not null,
	ef_dentista_freq varchar(50) null,
	ef_detalhes text null,

	motivo_trat text null,
	hist_doenca_atual text null,
	antecedentes text null,
	constraint fk_anamnese_usuario foreign key (codigo_usuario)
	references usuarios(codigo)
)

USE [TREATDENTAL]
GO

INSERT INTO [dbo].[anamnese]
           /*([codigo_usuario]
           ,[data]
           ,[hn_onicofagia]
           ,[hn_mt]
           ,[hn_mo]
           ,[hn_ml]
           ,[hn_rpb]
           ,[hn_sc]
           ,[hn_briquismo]
           ,[hn_tgb]
           ,[hn_tabagista]
           ,[hn_tabagista_obs]
           ,[hn_etilista]
           ,[hn_etilista_obs]
           ,[hn_ad]
           ,[hn_chupeta]
           ,[hn_detalhes]
           ,[hg_ff_dental]
           ,[hg_unitufo_bitufo]
           ,[hg_bochecho]
           ,[hg_escova_inter]
           ,[hg_creme_dental]
           ,[hg_outros]
           ,[hg_palito]
           ,[hg_escova_normal]
           ,[hg_escova_eletrica]
           ,[hg_num_vezes]
           ,[hg_op_acordar]
           ,[hg_op_cafe]
           ,[hg_op_almoco]
           ,[hg_op_jantar]
           ,[hg_op_dormir]
           ,[hg_detalhes]
           ,[ef_domic_abast]
           ,[ef_domic_abast_tempo]
           ,[ef_creme_dental]
           ,[ef_bochecho]
           ,[ef_dentista]
           ,[ef_dentista_freq]
           ,[ef_detalhes]
           ,[motivo_trat]
           ,[hist_doenca_atual]
           ,[antecedentes])*/
     VALUES
           (1
           ,'20/09/2024'
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,'teste'
           ,1
           ,'teste'
           ,1
           ,1
           ,'teste teste'
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,2
           ,1
           ,1
           ,1
           ,1
           ,1
           ,'teste'
           ,1
           ,'teste'
           ,1
           ,1
           ,1
           ,'teste'
           ,'teste'
           ,'teste teste teste'
           ,'teste teste teste'
           ,'teste teste teste'
		   )



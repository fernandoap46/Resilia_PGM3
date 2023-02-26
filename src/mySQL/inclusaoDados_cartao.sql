use educacao;

insert into `dados_cartao` (id_cliente, bandeira_cartao, numero_cartao, codigo_seguranca, cpf, vencimento_cartao, nome_cartao)
	VALUES (1,'Minicard',265887452314673,263,'54388790712',0424,'MARIA DINIZ');
    
insert into `dados_cartao` (id_cliente, bandeira_cartao, numero_cartao, codigo_seguranca, cpf, vencimento_cartao, nome_cartao)
	VALUES (2,'Vision',84844398765464,998,'66582387601',0925,'RODRIGO C CARDOSO'),
		   (3,'VRF',498716934654725,173,'15276409812',1225,'HELIO V DE CAMPOS'),
           (4,'Minicard',265903659248808,101,'55427306610',0127,'MATHEUS R DA SILVA'),
           (5,'Halo',673813987654356,400,'42188782209',0423,'VIVIANE L M DA SILVA'),
           (6,'Vision',84775012235664,266,'44412284607',0925,'ANA BRENDA M SOUZA'),
           (7,'Minicard',265733198954873,592,'12385633209',0827,'THAIS MARTINS'),
           (11,'Minicard',265875890112235,778,'45309914300',0226,'CARLOS A DE LIMA'),
           (12,'Halo',673777612345677,941,'87715402344',0724,'ANA B VALES'),
           (10,'Minicard',673798712341118,259,'67734404410',1025,'CASSIA ALVES');
           
-- Cartões e a qual cliente ele está cadastrado --
select cartao.*, cliente.id, cliente.nome from dados_cartao cartao, cliente
where cartao.id_cliente = cliente.id;

-- Todos os cartões cadastrados --
select * from dados_cartao;

-- Clientes que não possuem cartão cadastrado --
select * from cliente
where id not in(select id_cliente from dados_cartao);
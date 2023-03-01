-----------------------------------------------------------------------
--- id_pedido tem que colocar o mesmo que foi criado automaticamente---
--- na tabela pedido para não ter erro---------------------------------
-----------------------------------------------------------------------


INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('pix','B23850K68O554L6123N5','ok',1);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('boleto','L345JOP61N23B4123V31','pendente',2);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('credito','LN1232N21Q1A9879X055','cancelado',3);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('boleto','9AKB4820FKY48FC76349','ok',4);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('pix','NH4872LN59273HB4509J','ok',5);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('credito','U31298JNB4876SMN4132','pendente',6);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('credito','K21MHOFI9NBI13JMMK20','ok',7);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('credito','B287164H210976J12876','ok',8);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('pix','EL2349765JH129LMN4569','cancelado',9);

INSERT INTO pagamento (forma_pagamento,autenticacao,status,id_pedido)
values
('pix','ILN2378907Y5435H78','ok',10);

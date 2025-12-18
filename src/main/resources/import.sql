-- Categorias
INSERT INTO tb_categoria (descricao) VALUES ('Curso');
INSERT INTO tb_categoria (descricao) VALUES ('Oficina');

-- Atividades
INSERT INTO tb_atividade (nome, descricao, preco, categoria_id) VALUES ('Curso de HTML', 'Aprenda HTML5 de forma prática', 80.00, 1);
INSERT INTO tb_atividade (nome, descricao, preco, categoria_id) VALUES ('Oficina de Github', 'Controle versões de seus projetos', 50.00, 2);

-- Blocos da Atividade 1 (Curso de HTML)
INSERT INTO tb_bloco (inicio, fim, atividade_id) VALUES ('2017-09-25T08:00:00Z', '2017-09-25T11:00:00Z', 1);

-- Blocos da Atividade 2 (Oficina de Github)
INSERT INTO tb_bloco (inicio, fim, atividade_id) VALUES ('2017-09-25T14:00:00Z', '2017-09-25T18:00:00Z', 2);
INSERT INTO tb_bloco (inicio, fim, atividade_id) VALUES ('2017-09-26T08:00:00Z', '2017-09-26T11:00:00Z', 2);

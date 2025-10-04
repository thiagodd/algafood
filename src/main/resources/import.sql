-- ##############################################
-- ##             INSERTS DE COZINHAS          ##
-- ##############################################
insert into cuisine (id, name) values (1, 'Tailandesa');
insert into cuisine (id, name) values (2, 'Indiana');
insert into cuisine (id, name) values (3, 'Argentina');
insert into cuisine (id, name) values (4, 'Brasileira');
insert into cuisine (id, name) values (5, 'Italiana');
insert into cuisine (id, name) values (6, 'Japonesa');
insert into cuisine (id, name) values (7, 'Mexicana');
insert into cuisine (id, name) values (8, 'Árabe');
insert into cuisine (id, name) values (9, 'Chinesa');

-- ##############################################
-- ##             INSERTS DE ESTADOS           ##
-- ##############################################
insert into state (id, name) values (1, 'Minas Gerais');
insert into state (id, name) values (2, 'São Paulo');
insert into state (id, name) values (3, 'Ceará');
insert into state (id, name) values (4, 'Rio de Janeiro');
insert into state (id, name) values (5, 'Bahia');
insert into state (id, name) values (6, 'Rio Grande do Sul');

-- ##############################################
-- ##             INSERTS DE CIDADES           ##
-- ##############################################
insert into city (id, name, state_id) values (1, 'Uberlândia', 1);
insert into city (id, name, state_id) values (2, 'Belo Horizonte', 1);
insert into city (id, name, state_id) values (3, 'São Paulo', 2);
insert into city (id, name, state_id) values (4, 'Campinas', 2);
insert into city (id, name, state_id) values (5, 'Fortaleza', 3);
insert into city (id, name, state_id) values (6, 'Rio de Janeiro', 4);
insert into city (id, name, state_id) values (7, 'Niterói', 4);
insert into city (id, name, state_id) values (8, 'Salvador', 5);
insert into city (id, name, state_id) values (9, 'Porto Alegre', 6);
insert into city (id, name, state_id) values (10, 'Ribeirão Preto', 2);

-- ##############################################
-- ##           INSERTS DE RESTAURANTES        ##
-- ##############################################
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at, address_city_id, address_postal_code, address_street, address_number, address_neighborhood) values (1, 'Thai Gourmet', 10, 1, utc_timestamp, utc_timestamp, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (2, 'Thai Delivery', 9.50, 1, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (3, 'Tuk Tuk Comida Indiana', 15, 2, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (4, 'Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (5, 'Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (6, 'Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at, address_city_id, address_postal_code, address_street, address_number, address_neighborhood) values (7, 'La Pergoletta', 14.50, 5, utc_timestamp, utc_timestamp, 3, '01311-000', 'Avenida Paulista', '1500', 'Bela Vista');
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at, address_city_id, address_postal_code, address_street, address_number, address_neighborhood) values (8, 'Sushi Leblon', 25.00, 6, utc_timestamp, utc_timestamp, 6, '22441-030', 'Rua Dias Ferreira', '256', 'Leblon');
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at, address_city_id, address_postal_code, address_street, address_number, address_neighborhood) values (9, 'Cantina do Sabor', 8.00, 4, utc_timestamp, utc_timestamp, 8, '40026-010', 'Largo do Pelourinho', '20', 'Pelourinho');
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (10, 'Taco de Ouro', 13.20, 7, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (11, 'Habib Ali', 11.80, 8, utc_timestamp, utc_timestamp);
insert into restaurant (id, name, fee_shipping, cuisine_id, created_at, updated_at) values (12, 'China in Box', 7.50, 9, utc_timestamp, utc_timestamp);

-- ##############################################
-- ##       INSERTS DE FORMAS DE PAGAMENTO     ##
-- ##############################################
insert into payment_method (id, description) values (1, 'Cartão de crédito');
insert into payment_method (id, description) values (2, 'Cartão de débito');
insert into payment_method (id, description) values (3, 'Dinheiro');
insert into payment_method (id, description) values (4, 'Pix');
insert into payment_method (id, description) values (5, 'Vale Refeição');

-- ##############################################
-- ##            INSERTS DE PERMISSÕES         ##
-- ##############################################
insert into role (id, name, description) values (1, 'CONSULTAR_CUISINES', 'Permite consultar cuisines');
insert into role (id, name, description) values (2, 'EDITAR_CUISINES', 'Permite editar cuisines');
insert into role (id, name, description) values (3, 'CONSULTAR_RESTAURANTES', 'Permite consultar restaurantes');
insert into role (id, name, description) values (4, 'EDITAR_RESTAURANTES', 'Permite editar restaurantes');
insert into role (id, name, description) values (5, 'CONSULTAR_PRODUTOS', 'Permite consultar produtos');
insert into role (id, name, description) values (6, 'EDITAR_PRODUTOS', 'Permite editar produtos');

-- ##############################################
-- ##      RELAÇÃO RESTAURANTE E PAGAMENTO     ##
-- ##############################################
insert into restaurant_payment_methods (restaurant_id, payment_method_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3), (4, 1), (4, 2), (5, 1), (5, 2), (6, 3);
insert into restaurant_payment_methods (restaurant_id, payment_method_id) values (7, 1), (7, 2), (7, 4), (7, 5), (8, 1), (8, 4), (9, 3), (9, 4), (10, 1), (10, 2), (10, 3), (11, 1), (11, 3), (11, 4), (12, 5);

-- ##############################################
-- ##             INSERTS DE PRODUTOS          ##
-- ##############################################
insert into product (name, description, price, active, restaurant_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into product (name, description, price, active, restaurant_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into product (name, description, price, active, restaurant_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into product (name, description, price, active, restaurant_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into product (name, description, price, active, restaurant_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into product (name, description, price, active, restaurant_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into product (name, description, price, active, restaurant_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into product (name, description, price, active, restaurant_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into product (name, description, price, active, restaurant_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
insert into product (name, description, price, active, restaurant_id) values ('Pizza Margherita', 'Molho de tomate, mussarela fresca e manjericão', 55.00, 1, 7);
insert into product (name, description, price, active, restaurant_id) values ('Lasanha à Bolonhesa', 'Massa fresca, molho bolonhesa, queijo e molho branco', 68.50, 1, 7);
insert into product (name, description, price, active, restaurant_id) values ('Combinado Sushi (20 peças)', 'Seleção do chef com os melhores peixes do dia', 120.00, 1, 8);
insert into product (name, description, price, active, restaurant_id) values ('Temaki Salmão Completo', 'Cone de alga com arroz, salmão, cream cheese e cebolinha', 35.00, 1, 8);
insert into product (name, description, price, active, restaurant_id) values ('Moqueca de Camarão', 'Deliciosa moqueca baiana com camarões frescos, azeite de dendê e leite de coco', 95.00, 1, 9);
insert into product (name, description, price, active, restaurant_id) values ('Burrito de Carne', 'Tortilla de trigo recheada com carne, feijão, arroz, queijo e sour cream', 42.00, 1, 10);
insert into product (name, description, price, active, restaurant_id) values ('Kibe Frito', 'Porção com 6 unidades do clássico kibe árabe', 28.00, 1, 11);
insert into product (name, description, price, active, restaurant_id) values ('Yakisoba Clássico', 'Macarrão com legumes e carne', 38.90, 1, 12);
insert into product (name, description, price, active, restaurant_id) values ('Feijoada Completa', 'Acompanha arroz, couve, farofa e laranja', 59.90, 0, 6);
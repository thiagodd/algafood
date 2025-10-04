






-- =====================================================================================
-- Tabela: payment_method
-- Descrição: Armazena as formas de pagamento aceitas.
-- =====================================================================================
CREATE TABLE payment_method
(
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    description VARCHAR(100) NOT NULL,

    PRIMARY KEY (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela: permission_set
-- Descrição: Armazena as permissões do sistema (ex: CADASTRAR_PRODUTO).
-- =====================================================================================
CREATE TABLE permission_set
(
    id   BIGINT       NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,

    PRIMARY KEY (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela: role
-- Descrição: Armazena os papéis/grupos de usuários (ex: ADMINISTRADOR, CLIENTE).
-- =====================================================================================
CREATE TABLE role
(
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    name        VARCHAR(60) NOT NULL,
    description VARCHAR(100),

    PRIMARY KEY (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela: user
-- Descrição: Armazena os dados dos usuários do sistema.
-- =====================================================================================
CREATE TABLE user
(
    id         BIGINT       NOT NULL AUTO_INCREMENT,
    name       VARCHAR(60) NOT NULL,
    email      VARCHAR(100) NOT NULL,
    password   VARCHAR(60) NOT NULL,
    created_at DATETIME(6)  NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_user_email (email)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela: restaurant
-- Descrição: Tabela principal que armazena os dados dos restaurantes.
-- =====================================================================================
CREATE TABLE restaurant
(
    id                   BIGINT         NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(60)   NOT NULL,
    fee_shipping         DECIMAL(19, 2) NOT NULL,
    cuisine_id           BIGINT         NOT NULL,
    created_at           DATETIME(6)    NOT NULL,
    updated_at           DATETIME(6)    NOT NULL,

    -- Dados do Endereço
    address_city_id      BIGINT,
    address_postal_code  VARCHAR(20),
    address_street       VARCHAR(100),
    address_number       VARCHAR(30),
    address_complement   VARCHAR(60),
    address_neighborhood VARCHAR(100),

    PRIMARY KEY (id),

    CONSTRAINT fk_restaurant_cuisine FOREIGN KEY (cuisine_id) REFERENCES cuisine (id),
    CONSTRAINT fk_restaurant_city FOREIGN KEY (address_city_id) REFERENCES city (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela: product
-- Descrição: Armazena os produtos/itens do cardápio de um restaurante.
-- =====================================================================================
CREATE TABLE product
(
    id            BIGINT         NOT NULL AUTO_INCREMENT,
    name          VARCHAR(60)   NOT NULL,
    description   TEXT,
    price         DECIMAL(19, 2) NOT NULL,
    active        BOOLEAN        NOT NULL DEFAULT TRUE,
    restaurant_id BIGINT         NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_product_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurant (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela de Junção: restaurant_payment_methods
-- Descrição: Relaciona os restaurantes com as formas de pagamento que eles aceitam.
-- =====================================================================================
CREATE TABLE restaurant_payment_methods
(
    restaurant_id     BIGINT NOT NULL,
    payment_method_id BIGINT NOT NULL,

    PRIMARY KEY (restaurant_id, payment_method_id),

    CONSTRAINT fk_res_pay_methods_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurant (id),
    CONSTRAINT fk_res_pay_methods_payment FOREIGN KEY (payment_method_id) REFERENCES payment_method (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela de Junção: role_permission_set
-- Descrição: Relaciona os papéis (roles) com suas respectivas permissões.
-- =====================================================================================
CREATE TABLE role_permission_set
(
    role_id           BIGINT NOT NULL,
    permission_set_id BIGINT NOT NULL,

    PRIMARY KEY (role_id, permission_set_id),

    CONSTRAINT fk_role_perm_set_role FOREIGN KEY (role_id) REFERENCES role (id),
    CONSTRAINT fk_role_perm_set_perm FOREIGN KEY (permission_set_id) REFERENCES permission_set (id)
) ENGINE = InnoDB;


-- =====================================================================================
-- Tabela de Junção: user_permission_set
-- Descrição: Relaciona os usuários com suas respectivas permissões.
-- =====================================================================================
CREATE TABLE user_permission_set
(
    user_id           BIGINT NOT NULL,
    permission_set_id BIGINT NOT NULL,

    PRIMARY KEY (user_id, permission_set_id),

    CONSTRAINT fk_user_perm_set_user FOREIGN KEY (user_id) REFERENCES user (id),
    CONSTRAINT fk_user_perm_set_perm FOREIGN KEY (permission_set_id) REFERENCES permission_set (id)
) ENGINE = InnoDB;
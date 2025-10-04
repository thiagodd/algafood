-- =====================================================================================
-- Tabela: state
-- Descrição: Armazena os estados (UF).
-- =====================================================================================
CREATE TABLE state
(
    id   BIGINT      NOT NULL AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,

    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- =====================================================================================
-- Tabela: city
-- Descrição: Armazena as cidades, com referência ao seu estado.
-- =====================================================================================
create table city
(
    id       bigint      not null auto_increment,
    name     varchar(60) not null,
    state_id bigint not null,

    primary key (id),

    CONSTRAINT fk_city_state FOREIGN KEY (state_id) REFERENCES state (id)
) ENGINE = InnoDB;
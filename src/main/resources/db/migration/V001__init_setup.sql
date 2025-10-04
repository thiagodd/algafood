-- =====================================================================================
-- Tabela: cuisine
-- Descrição: Armazena os tipos de cozinha (ex: Italiana, Japonesa).
-- =====================================================================================
CREATE TABLE cuisine
(
    id   BIGINT       NOT NULL AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,

    PRIMARY KEY (id)
) ENGINE = InnoDB;

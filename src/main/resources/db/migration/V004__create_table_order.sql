create table order_sales
(
    id                   bigint         not null auto_increment,
    sub_total            decimal(10, 2) not null,
    fee_shipping         decimal(10, 2) not null,
    total_value          decimal(10, 2) not null,

    restaurant_id        bigint         not null,
    client_id            bigint         not null,
    payment_method_id    bigint         not null,

    -- Dados do Endereço
    address_city_id      BIGINT         not null,
    address_postal_code  VARCHAR(20)    not null,
    address_street       VARCHAR(100)   not null,
    address_number       VARCHAR(30)    not null,
    address_complement   VARCHAR(60),
    address_neighborhood VARCHAR(100)   not null,

    status               varchar(10)    not null,
    created_at           datetime       not null,
    date_confirmation    datetime       null,
    date_cancellation    datetime       null,
    date_delivered       datetime       null,

    primary key (id),

    constraint fk_order_restaurant foreign key (restaurant_id) references restaurant (id),
    constraint fk_order_client foreign key (client_id) references user (id),
    constraint fk_order_payment_method foreign key (payment_method_id) references payment_method (id)
);

create table order_item
(
    id             bigint         not null auto_increment,
    quantity       int            not null,
    unit_price     decimal(19, 2) not null,
    total_price    decimal(19, 2) not null,
    observation    varchar(100)   null,

    sales_order_id bigint         not null,
    product_id     bigint         not null,
    primary key (id),

    unique key uk_item_pedido_produto (sales_order_id, product_id),

    constraint fk_item_pedido_pedido foreign key (sales_order_id) references order_sales (id),
    constraint fk_item_pedido_produto foreign key (product_id) references product (id)
);
package com.thiagodd.algafood.domain;

import com.thiagodd.algafood.domain.enums.OrderStatus;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class SalesOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sub_total")
    private BigDecimal subTotal;

    @Column(name = "fee_shipping")
    private BigDecimal feeShipping;

    @Column(name = "total_value")
    private BigDecimal totalValue;

    @Embedded
    private Address address;


    @Enumerated(EnumType.STRING)
    @Column(name = "order_status")
    private OrderStatus orderStatus;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "date_confirmation")
    private LocalDateTime dateConfirmation;

    @Column(name = "date_cancellation")
    private LocalDateTime dateCancellation;

    @Column(name = "date_delivered")
    private LocalDateTime dateDelivered;

    @ManyToOne
    @JoinColumn(nullable = false, name = "payment_method_id")
    private PaymentMethod paymentMethod;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Restaurant restaurant;

    @ManyToOne
    @JoinColumn(name = "client_id", nullable = false)
    private User cliente;

    @OneToMany(mappedBy = "salesOrder")
    private List<OrderItem> itens = new ArrayList<>();


}

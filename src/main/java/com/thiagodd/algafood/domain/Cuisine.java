package com.thiagodd.algafood.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class Cuisine {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "cuisine")
    private List<Restaurant> restaurants = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Cuisine cuisine)) return false;
        return Objects.equals(getId(), cuisine.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }
}

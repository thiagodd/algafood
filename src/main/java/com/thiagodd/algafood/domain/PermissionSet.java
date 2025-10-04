package com.thiagodd.algafood.domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class PermissionSet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany
    @JoinTable(name = "role_permission_set", joinColumns = @JoinColumn(name = "permission_set_id"), inverseJoinColumns = @JoinColumn (name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof PermissionSet permissionSet)) return false;
        return Objects.equals(getId(), permissionSet.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }
}


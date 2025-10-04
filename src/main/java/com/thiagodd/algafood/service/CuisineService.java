package com.thiagodd.algafood.service;

import com.thiagodd.algafood.domain.Cuisine;

import java.util.List;

public interface CuisineService {

    List<Cuisine> findAll();
    Cuisine findById(Long id);
    Cuisine save(Cuisine cuisine);
    void delete(Cuisine cuisine);

}

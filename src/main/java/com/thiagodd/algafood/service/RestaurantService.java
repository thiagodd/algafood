package com.thiagodd.algafood.service;

import com.thiagodd.algafood.domain.Restaurant;

import java.util.List;

public interface RestaurantService {

    List<Restaurant> findAll();
    Restaurant findById(Long id);
    Restaurant save(Restaurant restaurant);
    void delete(Restaurant restaurant);
}

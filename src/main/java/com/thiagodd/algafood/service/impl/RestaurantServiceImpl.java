package com.thiagodd.algafood.service.impl;

import com.thiagodd.algafood.domain.Restaurant;
import com.thiagodd.algafood.domain.exception.NotFoundException;
import com.thiagodd.algafood.repository.RestaurantRepository;
import com.thiagodd.algafood.service.CuisineService;
import com.thiagodd.algafood.service.RestaurantService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    private final String ENTITY_NAME = "Restaurant";

    private final RestaurantRepository restaurantRepository;

    private final CuisineService cuisineService;


    public RestaurantServiceImpl(RestaurantRepository restaurantRepository, CuisineService cuisineService) {
        this.restaurantRepository = restaurantRepository;
        this.cuisineService = cuisineService;
    }

    @Override
    public List<Restaurant> findAll() {
        return restaurantRepository.findAll();
    }

    @Override
    public Restaurant findById(Long id) {
        return restaurantRepository.findById(id).orElseThrow(() -> new NotFoundException(ENTITY_NAME, id));
    }

    @Override
    public Restaurant save(Restaurant restaurant) {
        final var currentCuisine = cuisineService.findById(restaurant.getCuisine().getId());

        restaurant.setCuisine(currentCuisine);

        return restaurantRepository.save(restaurant);
    }

    @Override
    public void delete(Restaurant restaurant) {
        restaurantRepository.delete(restaurant);
    }
}

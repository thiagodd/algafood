package com.thiagodd.algafood.controller;

import com.thiagodd.algafood.domain.Restaurant;
import com.thiagodd.algafood.service.impl.RestaurantServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/restaurants")
public class RestaurantController {

    private final RestaurantServiceImpl restaurantServiceImpl;

    public RestaurantController(RestaurantServiceImpl restaurantServiceImpl) {
        this.restaurantServiceImpl = restaurantServiceImpl;
    }

    @GetMapping
    public List<Restaurant> findAll() {
        System.out.println("Teste");
        return restaurantServiceImpl.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Restaurant> findById(@PathVariable Long id) {
        final var restaurant = restaurantServiceImpl.findById(id);

        return ResponseEntity.ok(restaurant);
    }

    @PostMapping
    public Restaurant save(@RequestBody Restaurant restaurant) {
        System.out.println("Entidade nua e crua: " + restaurant);

        return restaurantServiceImpl.save(restaurant);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Restaurant> update(@PathVariable Long id, @RequestBody Restaurant restaurant){
        final var currentRestaurant = restaurantServiceImpl.findById(id);

        BeanUtils.copyProperties(restaurant, currentRestaurant, "id");

        restaurantServiceImpl.save(currentRestaurant);

        return ResponseEntity.ok(currentRestaurant);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        final var restaurant = restaurantServiceImpl.findById(id);
        restaurantServiceImpl.delete(restaurant);

        return ResponseEntity.noContent().build();

    }
}

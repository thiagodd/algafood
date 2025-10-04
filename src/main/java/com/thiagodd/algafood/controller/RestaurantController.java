package com.thiagodd.algafood.controller;

import com.thiagodd.algafood.domain.Restaurant;
import com.thiagodd.algafood.service.RestaurantService;
import org.springframework.beans.BeanUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/restaurants")
public class RestaurantController {

    private final RestaurantService restaurantService;

    public RestaurantController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    @GetMapping
    public List<Restaurant> findAll() {
        System.out.println("Teste");
        return restaurantService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Restaurant> findById(@PathVariable Long id) {
        final var restaurant = restaurantService.findById(id);

        return ResponseEntity.ok(restaurant);
    }

    @PostMapping
    public Restaurant save(@RequestBody Restaurant restaurant) {
        System.out.println("Entidade nua e crua: " + restaurant);

        return restaurantService.save(restaurant);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Restaurant> update(@PathVariable Long id, @RequestBody Restaurant restaurant){
        final var currentRestaurant = restaurantService.findById(id);

        BeanUtils.copyProperties(restaurant, currentRestaurant, "id");

        restaurantService.save(currentRestaurant);

        return ResponseEntity.ok(currentRestaurant);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        final var restaurant = restaurantService.findById(id);
        restaurantService.delete(restaurant);

        return ResponseEntity.noContent().build();

    }
}

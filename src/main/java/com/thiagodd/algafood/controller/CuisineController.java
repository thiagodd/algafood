package com.thiagodd.algafood.controller;

import com.thiagodd.algafood.domain.Cuisine;
import com.thiagodd.algafood.service.CuisineService;
import org.springframework.beans.BeanUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/cuisines")
public class CuisineController {

    private final CuisineService cuisineService;

    public CuisineController(CuisineService cuisineService) {
        this.cuisineService = cuisineService;
    }

    @GetMapping
    public List<Cuisine> findAll() {
        return cuisineService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cuisine> findById(@PathVariable Long id) {
        final var cuisine = cuisineService.findById(id);

        return ResponseEntity.ok(cuisine);
    }

    @PostMapping
    public Cuisine save(@RequestBody Cuisine cuisine) {
        return cuisineService.save(cuisine);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cuisine> update(@PathVariable Long id, @RequestBody Cuisine cuisine){
        final var currentCuisine = cuisineService.findById(id);

        BeanUtils.copyProperties(cuisine, currentCuisine, "id");

        cuisineService.save(currentCuisine);

        return ResponseEntity.ok(currentCuisine);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        final var cuisine = cuisineService.findById(id);
        cuisineService.delete(cuisine);

        return ResponseEntity.noContent().build();

    }
}

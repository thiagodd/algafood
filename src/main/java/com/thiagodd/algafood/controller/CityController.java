package com.thiagodd.algafood.controller;

import com.thiagodd.algafood.domain.City;
import com.thiagodd.algafood.service.CityService;
import org.springframework.beans.BeanUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/cities")
public class CityController {

    private final CityService cityService;

    public CityController(CityService cityService) {
        this.cityService = cityService;
    }

    @GetMapping
    public List<City> findAll() {
        return cityService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<City> findById(@PathVariable Long id) {
        final var city = cityService.findById(id);

        return ResponseEntity.ok(city);
    }

    @PostMapping
    public City save(@RequestBody City city) {
        return cityService.save(city);
    }

    @PutMapping("/{id}")
    public ResponseEntity<City> update(@PathVariable Long id, @RequestBody City city){
        final var currentCity = cityService.findById(id);

        BeanUtils.copyProperties(city, currentCity, "id");

        cityService.save(currentCity);

        return ResponseEntity.ok(currentCity);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        final var city = cityService.findById(id);
        cityService.delete(city);

        return ResponseEntity.noContent().build();
    }
}

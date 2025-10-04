package com.thiagodd.algafood.service;

import com.thiagodd.algafood.domain.City;

import java.util.List;

public interface CityService {

    List<City> findAll();
    City findById(Long id);
    City save(City city);
    void delete(City city);

}

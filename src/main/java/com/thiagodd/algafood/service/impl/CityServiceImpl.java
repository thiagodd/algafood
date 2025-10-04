package com.thiagodd.algafood.service.impl;

import com.thiagodd.algafood.domain.City;
import com.thiagodd.algafood.domain.exception.NotFoundException;
import com.thiagodd.algafood.repository.CityRepository;
import com.thiagodd.algafood.service.CityService;
import com.thiagodd.algafood.service.StateService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {


    private final String ENTITY_NAME = "City";

    private final CityRepository cityRepository;
    private final StateService stateService;

    public CityServiceImpl(CityRepository cityRepository, StateService stateService) {
        this.cityRepository = cityRepository;
        this.stateService = stateService;
    }

    @Override
    public List<City> findAll() {
        return cityRepository.findAll();
    }

    @Override
    public City findById(Long id) {
        return cityRepository.findById(id).orElseThrow(() -> new NotFoundException(ENTITY_NAME, id));
    }

    @Override
    public City save(City city) {
        final var currentState = stateService.findById(city.getState().getId());

        city.setState(currentState);
        
        return cityRepository.save(city);
    }

    @Override
    public void delete(City city) {
        cityRepository.delete(city);
    }
}

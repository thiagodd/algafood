package com.thiagodd.algafood.service.impl;

import com.thiagodd.algafood.domain.Cuisine;
import com.thiagodd.algafood.domain.exception.NotFoundException;
import com.thiagodd.algafood.repository.CuisineRepository;
import com.thiagodd.algafood.service.CuisineService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CuisineServiceImpl implements CuisineService {

    private final String ENTITY_NAME = "Cuisine";

    private final CuisineRepository cuisineRepository;

    public CuisineServiceImpl(CuisineRepository cuisineRepository) {
        this.cuisineRepository = cuisineRepository;
    }

    @Override
    public List<Cuisine> findAll() {
        return cuisineRepository.findAll();
    }

    @Override
    public Cuisine findById(Long id) {
        return cuisineRepository.findById(id).orElseThrow(() -> new NotFoundException(ENTITY_NAME, id));
    }

    @Override
    public Cuisine save(Cuisine cuisine) {
        return cuisineRepository.save(cuisine);
    }

    @Override
    public void delete(Cuisine cuisine) {
        cuisineRepository.delete(cuisine);
    }
}

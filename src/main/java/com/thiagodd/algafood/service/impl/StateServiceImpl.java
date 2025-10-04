package com.thiagodd.algafood.service.impl;

import com.thiagodd.algafood.domain.State;
import com.thiagodd.algafood.domain.exception.NotFoundException;
import com.thiagodd.algafood.repository.StateRepository;
import com.thiagodd.algafood.service.StateService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StateServiceImpl implements StateService {


    private final String ENTITY_NAME = "State";

    private final StateRepository stateRepository;

    public StateServiceImpl(StateRepository stateRepository) {
        this.stateRepository = stateRepository;
    }

    @Override
    public List<State> findAll() {
        return stateRepository.findAll();
    }

    @Override
    public State findById(Long id) {
        return stateRepository.findById(id).orElseThrow(() -> new NotFoundException(ENTITY_NAME, id));
    }

    @Override
    public State save(State state) {
        return stateRepository.save(state);
    }

    @Override
    public void delete(State state) {
        stateRepository.delete(state);
    }
}

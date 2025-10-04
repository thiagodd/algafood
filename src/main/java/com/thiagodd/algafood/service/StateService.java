package com.thiagodd.algafood.service;

import com.thiagodd.algafood.domain.State;

import java.util.List;

public interface StateService {

    List<State> findAll();
    State findById(Long id);
    State save(State state);
    void delete(State state);

}

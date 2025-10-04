package com.thiagodd.algafood.controller;

import com.thiagodd.algafood.domain.State;
import com.thiagodd.algafood.service.StateService;
import org.springframework.beans.BeanUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/states")
public class StateController {

    private final StateService stateService;

    public StateController(StateService stateService) {
        this.stateService = stateService;
    }

    @GetMapping
    public List<State> findAll() {
        return stateService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<State> findById(@PathVariable Long id) {
        final var state = stateService.findById(id);

        return ResponseEntity.ok(state);
    }

    @PostMapping
    public State save(@RequestBody State state) {
        return stateService.save(state);
    }

    @PutMapping("/{id}")
    public ResponseEntity<State> update(@PathVariable Long id, @RequestBody State state){
        final var currentState = stateService.findById(id);

        BeanUtils.copyProperties(state, currentState, "id");

        stateService.save(currentState);

        return ResponseEntity.ok(currentState);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        final var state = stateService.findById(id);
        stateService.delete(state);

        return ResponseEntity.noContent().build();

    }
}

package io.github.paulushcgcj.repositories;

import io.github.paulushcgcj.entities.FruitEntity;
import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class FruitRepository implements PanacheRepository<FruitEntity> {

}

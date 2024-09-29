package io.github.paulushcgcj.services;

import io.github.paulushcgcj.dtos.FruitDto;
import io.github.paulushcgcj.entities.FruitEntity;
import io.quarkus.hibernate.reactive.panache.PanacheEntityBase;
import io.quarkus.hibernate.reactive.panache.PanacheRepository;
import io.quarkus.hibernate.reactive.panache.common.WithTransaction;
import io.quarkus.panache.common.Sort;
import io.smallrye.mutiny.Uni;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;
import java.util.function.Function;
import lombok.RequiredArgsConstructor;

@ApplicationScoped
@RequiredArgsConstructor
public class FruitService {

  private final PanacheRepository<FruitEntity> repository;

  @WithTransaction
  public Uni<List<FruitDto>> listFruits() {
    return repository.listAll(Sort.by("name"))
        .onItem()
        .ifNotNull()
        .transform(fruits ->
            fruits
                .stream()
                .map(FruitEntity.class::cast)
                .map(fruit -> new FruitDto(fruit.getName(), fruit.getDescription()))
                .toList()
        );
  }

  @WithTransaction
  public Uni<FruitDto> getFruit(Long id) {
    return repository
        .findById(id)
        .onItem().transform(transformFruitEntity());
  }


  @WithTransaction
  public Uni<FruitDto> createFruit(FruitDto fruitDto) {
    return
        repository.persist(
                FruitEntity
                    .builder()
                    .name(fruitDto.name())
                    .description(fruitDto.description())
                    .build()
            )
            .onItem().transform(transformFruitEntity());
  }


  private Function<PanacheEntityBase, FruitDto> transformFruitEntity() {
    return fruit ->
        fruit != null ?
            new FruitDto(
                ((FruitEntity) fruit).getName(),
                ((FruitEntity) fruit).getDescription()
            ) : null;
  }


}

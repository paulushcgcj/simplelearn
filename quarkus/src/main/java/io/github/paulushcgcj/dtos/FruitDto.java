package io.github.paulushcgcj.dtos;

import io.quarkus.runtime.annotations.RegisterForReflection;

@RegisterForReflection
public record FruitDto(
    String name,
    String description
) {

}

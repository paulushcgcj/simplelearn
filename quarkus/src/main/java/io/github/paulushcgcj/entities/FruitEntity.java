package io.github.paulushcgcj.entities;

import io.quarkus.hibernate.reactive.panache.PanacheEntityBase;
import jakarta.inject.Inject;
import jakarta.persistence.Cacheable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@Entity(name = "fruits")
@Cacheable
@Data
@Builder
@NoArgsConstructor(onConstructor_ = {@Inject})
@AllArgsConstructor(onConstructor_ = {@Inject})
public class FruitEntity extends PanacheEntityBase {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  @Column(length = 40, unique = true)
  private String name;
  @Column(length = 120)
  private String description;


}

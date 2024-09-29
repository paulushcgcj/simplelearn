package io.github.paulushcgcj.services;

import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.flywaydb.core.Flyway;

@ApplicationScoped
public class MigrationService {

  // You can Inject the object if you want to use it manually
  @Inject
  Flyway flyway;

  @PostConstruct
  public void checkMigration() {
    // This will print 1.0.0
    System.out.println(flyway.info().current().getVersion().toString());
  }
}

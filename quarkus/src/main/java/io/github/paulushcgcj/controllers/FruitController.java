package io.github.paulushcgcj.controllers;

import io.github.paulushcgcj.dtos.FruitDto;
import io.github.paulushcgcj.services.FruitService;
import io.smallrye.mutiny.Uni;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lombok.RequiredArgsConstructor;

@Path("/api/fruits")
@RequiredArgsConstructor
public class FruitController {

  private final FruitService fruitService;

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public Uni<Response> listFruits() {
    return fruitService
        .listFruits()
        .onItem().transform(Response::ok)
        .onItem().transform(Response.ResponseBuilder::build);
  }

  @GET
  @Path("/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public Uni<Response> getFruit(Long id) {
    return
        fruitService
            .getFruit(id)
            .onItem().ifNotNull().transform(fruitDto -> Response.ok(fruitDto).build())
            .onFailure()
            .recoverWithItem(failure -> Response.status(Response.Status.NOT_FOUND).build());
  }

  @POST
  @Produces(MediaType.APPLICATION_JSON)
  @Consumes(MediaType.APPLICATION_JSON)
  public Uni<Response> addFruit(FruitDto fruitDto) {
    return
        fruitService
            .createFruit(fruitDto)
            .onItem().ifNotNull().transform(fruit -> Response.ok(fruitDto).build())
            .onFailure()
            .recoverWithItem(failure -> Response.status(Response.Status.BAD_REQUEST).build());
  }


}

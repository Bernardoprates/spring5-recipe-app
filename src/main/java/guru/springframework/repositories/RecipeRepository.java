package guru.springframework.repositories;

import guru.springframework.domain.Recipe;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
    
    @Query("SELECT r FROM Recipe r LEFT JOIN FETCH r.categories LEFT JOIN FETCH r.ingredients LEFT JOIN FETCH r.notes")
    Iterable<Recipe> findAllWithCategoriesAndIngredients();
}

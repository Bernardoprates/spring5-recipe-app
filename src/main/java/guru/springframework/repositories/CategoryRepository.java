package guru.springframework.repositories;

import guru.springframework.domain.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface CategoryRepository extends CrudRepository<Category, Long> {
    
    @Query("SELECT c FROM Category c LEFT JOIN FETCH c.recipes")
    Iterable<Category> findAllWithRecipes();
    
    Optional<Category> findByDescription(String description);
}

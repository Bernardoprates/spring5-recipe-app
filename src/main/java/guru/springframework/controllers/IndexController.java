package guru.springframework.controllers;

import guru.springframework.repositories.CategoryRepository;
import guru.springframework.repositories.IngredientRepository;
import guru.springframework.repositories.RecipeRepository;
import guru.springframework.repositories.UnitOfMeasureRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Controller
public class IndexController {
    private final CategoryRepository categoryRepository;
    private final UnitOfMeasureRepository unitOfMeasureRepository;
    private final RecipeRepository recipeRepository;
    private final IngredientRepository ingredientRepository;

    public IndexController(CategoryRepository categoryRepository, 
                         UnitOfMeasureRepository unitOfMeasureRepository,
                         RecipeRepository recipeRepository,
                         IngredientRepository ingredientRepository) {
        this.categoryRepository = categoryRepository;
        this.unitOfMeasureRepository = unitOfMeasureRepository;
        this.recipeRepository = recipeRepository;
        this.ingredientRepository = ingredientRepository;
    }

    @GetMapping({"", "/", "/index"})
    public String getIndexPage(Model model) {
        model.addAttribute("recipes", StreamSupport.stream(recipeRepository.findAllWithCategoriesAndIngredients().spliterator(), false)
                .collect(Collectors.toList()));
        model.addAttribute("ingredients", StreamSupport.stream(ingredientRepository.findAll().spliterator(), false)
                .collect(Collectors.toList()));
        model.addAttribute("categories", StreamSupport.stream(categoryRepository.findAllWithRecipes().spliterator(), false)
                .collect(Collectors.toList()));
        model.addAttribute("uoms", StreamSupport.stream(unitOfMeasureRepository.findAll().spliterator(), false)
                .collect(Collectors.toList()));
        return "index";
    }
}

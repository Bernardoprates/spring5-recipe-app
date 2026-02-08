-- Insert sample categories
INSERT INTO category (description) VALUES 
('Mexican'),
('Italian'),
('American'),
('Asian'),
('Desserts');

-- Insert sample units of measure
INSERT INTO unit_of_measure (description) VALUES 
('Teaspoon'),
('Tablespoon'),
('Cup'),
('Ounce'),
('Pound'),
('Pinch'),
('Dash'),
('Liter'),
('Milliliter'),
('Gram'),
('Kilogram');

-- Insert sample recipes
INSERT INTO recipe (description, prep_time, cook_time, servings, source, url, directions, difficulty) VALUES 
('Spicy Guacamole', 15, 0, 4, 'Grandma', 'http://example.com/guac', '1. Mash avocados\n2. Add lime juice\n3. Mix in onions, tomatoes, and spices\n4. Serve immediately', 'EASY'),
('Classic Margherita Pizza', 120, 15, 2, 'Italian Cookbook', 'http://example.com/pizza', '1. Make dough\n2. Add tomato sauce\n3. Top with mozzarella and basil\n4. Bake at 450°F for 15 minutes', 'MODERATE'),
('Chocolate Chip Cookies', 20, 12, 24, 'Mom', 'http://example.com/cookies', '1. Cream butter and sugars\n2. Add eggs and vanilla\n3. Mix in flour and baking soda\n4. Fold in chocolate chips\n5. Bake at 375°F for 12 minutes', 'EASY');

-- Insert sample notes
INSERT INTO notes (recipe_notes, recipe_id) VALUES 
('Make sure avocados are ripe but not too soft. Use fresh lime juice for best flavor.', 1),
('For authentic taste, use San Marzano tomatoes. Let dough rise for at least 24 hours.', 2),
('Don''t overmix the dough. Chill dough for 30 minutes before baking for better results.', 3);

-- Insert sample ingredients for Guacamole (Recipe ID: 1)
INSERT INTO ingredient (description, amount, recipe_id, uom_id) VALUES 
('Avocado', 3.00, 1, 5),
('Lime juice', 2.00, 1, 1),
('Red onion', 0.50, 1, 5),
('Tomato', 2.00, 1, 4),
('Cilantro', 0.25, 1, 5),
('Salt', 1.00, 1, 6),
('Black pepper', 0.50, 1, 6);

-- Insert sample ingredients for Margherita Pizza (Recipe ID: 2)
INSERT INTO ingredient (description, amount, recipe_id, uom_id) VALUES 
('Pizza dough', 1.00, 2, 3),
('Tomato sauce', 0.50, 3, 2),
('Fresh mozzarella', 8.00, 2, 4),
('Fresh basil', 0.25, 2, 5),
('Olive oil', 2.00, 2, 1),
('Salt', 1.00, 2, 6);

-- Insert sample ingredients for Chocolate Chip Cookies (Recipe ID: 3)
INSERT INTO ingredient (description, amount, recipe_id, uom_id) VALUES 
('All-purpose flour', 2.25, 3, 3),
('Butter', 1.00, 3, 5),
('Brown sugar', 0.75, 3, 3),
('White sugar', 0.50, 3, 3),
('Eggs', 2.00, 3, 4),
('Vanilla extract', 2.00, 3, 1),
('Chocolate chips', 2.00, 3, 3),
('Baking soda', 1.00, 3, 1),
('Salt', 1.00, 3, 6);

-- Link recipes to categories (Mexican: ID 1, Italian: ID 2, American: ID 3)
INSERT INTO recipe_category (recipe_id, category_id) VALUES 
(1, 1),  -- Guacamole -> Mexican
(2, 2),  -- Pizza -> Italian  
(3, 3),  -- Cookies -> American
(1, 4),  -- Guacamole -> Asian (fusion)
(3, 5);  -- Cookies -> Desserts

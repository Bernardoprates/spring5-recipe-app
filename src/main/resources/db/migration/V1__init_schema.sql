CREATE TABLE category (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE recipe (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    prep_time INTEGER,
    cook_time INTEGER,
    servings INTEGER,
    source VARCHAR(255),
    url VARCHAR(255),
    directions TEXT,
    image LONGBLOB,
    difficulty VARCHAR(10) CHECK (difficulty IN ('EASY', 'MODERATE', 'HARD'))
);

CREATE TABLE notes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    recipe_notes LONGTEXT,
    recipe_id BIGINT UNIQUE,
    FOREIGN KEY (recipe_id) REFERENCES recipe(id)
);
CREATE TABLE UNIT_OF_MEASURE (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE ingredient (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    amount DECIMAL(19,2),
    recipe_id BIGINT,
    uom_id BIGINT,
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (uom_id) REFERENCES unit_of_measure(id)
);




CREATE TABLE recipe_category (
    recipe_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);
CREATE TABLE Users (
	user_id INTEGER PRIMARY KEY,
	email VARCHAR(255) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE Recipes (
	recipe_id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(MAX),
	cooking_time INTEGER,
	servings INTEGER,
	private BOOLEAN NOT NULL,
	user_id INTEGER NOT NULL REFERENCES Users(user_id)
);

CREATE TABLE Ingredients (
	ingredient_id INTEGER PRIMARY KEY,
	recipe_id INTEGER NOT NULL,
	name VARCHAR(255) NOT NULL,
	quantity INTEGER,
	recipe_id INTEGER NOT NULL REFERENCES Recipes(recipe_id)	
);

CREATE TABLE Instructions (
	instruction_id INTEGER PRIMARY KEY,
	recipe_id INTEGER NOT NULL,
	description VARCHAR(MAX),
	recipe_id INTEGER NOT NULL REFERENCES Recipes(recipe_id),
);

CREATE TABLE Grocery_lists (
	grocery_list_id INTEGER PRIMARY KEY,
	user_id INTEGER NOT NULL,
	name VARCHAR(255) NOT NULL,
	date DATE NOT NULL,
	user_id INTEGER NOT NULL REFERENCES Users(user_id)
);
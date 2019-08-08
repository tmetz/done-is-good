# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
**Goal has many incentives**

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
**Incentive belongs to goal**

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
**User has many goals through tasks**, 
**Goal has many users through tasks**

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
**See above for User and Goal (join table: Task)**

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
**task.description**

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
**Goal, Task, Incentive, User**

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
**Goal.all_for_others URL: /goals/all**

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
**Using bcrypt**

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
**OmniAuth with GitHub**

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
**goals/[:id]/tasks**

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
**goals/[:id]/tasks/new**

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
**signup**

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
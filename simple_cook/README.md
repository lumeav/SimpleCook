# Simple Cook

Simple Cook is a versatile mobile application designed to alleviate the cooking experience and to bring some creativity to the kitchen. It offers a wide range of recipes, a personalized recipe finder powered by AI, and organizational tools to help users plan and favorite their culinary endeavors. With an intuitive interface, Simple Cook makes cooking accessible and enjoyable for everyone. "Cooking with Simple Cook does not have to be imaginitive."

## Screens and Main Functionalities

- Explore View: Displays the "Recipe of the Day" along with a selection of additional main course recipes. Users can browse and discover new recipes easily.
    - Key Features:
        - Recipe of the Day highlight
        - Browsing through various recipes
        - Searching for a specific recipe

- Recipe Finder View: Allows users to generate AI-powered recipes based on selected tags and search criteria. Users can also add specific ingredients to the AI-generated recipes.
    - Key Features:
        - Tag-based recipe generation
        - Search bar for ingredient-specific additions
        - AI-generated recipe

- Favorites View: Displays all recipes that users have marked as favorites, providing quick access to preferred dishes.
    - Key Features:
        - List of favorited recipes
        - Easy access to users' most liked recipes

- Planner View: Shows recipes that users have added to their meal planner, allowing them to plan meals for specific dates.
    - Key Features:
        - Calendar view of planned recipes
        - Ability to add recipes to specific dates for future use
- Recipe View: Provides detailed information about a selected recipe, including ingredients, preparation time, cooking steps, and the number of servings.
    - Key Features:
        - List of ingredients
        - Preparation time
        - Step-by-step cooking instructions
        - Number of servings

## Personas and their benefits

SimpleCook is designed to make cooking easier, more accessible, and more creative for a wide range of users. The app is built to provide quick and simple cooking ideas based on available ingredients, helping users turn whatever they have on hand into delicious meals. Additionally the explore function allows you to scroll through a variety of different recipes, if you cannot decide on what you want. Here’s how SimpleCook addresses specific problems and benefits different personas.

### Parents

#### Challenge

Balancing a hectic schedule while ensuring that their families eat healthy, home-cooked meals.

#### Benefit from SimpleCook

SimpleCook helps parents manage their busy lives by providing quick and easy recipe ideas and allowing them to plan meals ahead of time. Parents can enter the ingredients they have, and the app will suggest recipes that match, making meal preparation more efficient and less stressful.

##### Feature highlight

The Planner View allows parents to plan meals in advance, ensuring that they have everything ready for busy weekdays.

### Students

#### Challenge

Budget constraints and limited ingredients.

#### Benefit from SimpleCook

SimpleCook allows students to save money by suggesting recipes based on what they already have in their kitchens, reducing food waste and avoiding unnecessary trips to the grocery store.

###### Feature Highlight

The Recipe Finder View helps students maximize their limited pantry items by generating recipes from available ingredients.

### Hobby Chefs

##### Challenge

Finding new and exciting recipes to try out.

##### Benefit from SimpleCook

SimpleCook broadens the culinary horizons of hobby chefs by presenting new and varied recipes. This allows them to explore new cuisines and cooking techniques, enhancing their skills and creativity in the kitchen.

###### Feature Highlight

The Explore View offers a 'Recipe of the Day' along with other curated recipes, providing a continuous stream of new cooking ideas.

### Vegetarians/Vegans

##### Challenge

Finding suitable and varied vegetarian or vegan recipes.

##### Benefit from SimpleCook

SimpleCook provides vegetarians and vegans with tailored recipes that meet their dietary preferences, ensuring that they have access to a wide variety of meals that suit their lifestyle.

###### Feature Highlight

The app includes filtering options for dietary preferences in the Recipe Finder View, allowing users to easily find vegetarian or vegan recipes.

## Useful commands

This is the command for creating APK files:

    flutter build apk --split-per-abi 
    (The flutter build command defaults to --release.)

This command results in three APK files:

    [project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    [project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
    [project]/build/app/outputs/apk/release/app-x86_64-release.apk
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

## Widgets

These are the widgets that we need based on our Wireframes: 

### Widgets for Multiple Features

- A stateless widget with the SimpleCook-Logo on every Feature-Screen
- A stateful widget for the navigation bar
- A stateful widget for liking certain recipes (the heart feature)
    - Once in the explore page
    - Once in the recipe page itself
- A stateless widget that shows the recipe itself
    - Shown in favorites-, recipefinder-, and in explore-screen
- A stateless widget-button that leads to the filter
    - Shwon in recipefinder-, and in explore-screen
- A stateful widget for the search text field
    - Shown in explore-, and in recipefinder-screen    
- A stateless widget for the grey backscreen on every screen
- A stateless widget that shows you how many recipes were found
    - Shown in Filter-, and in recipefinder-Filter-screen
- A stateless widget-button to search for recipes
    - Shown in Filter-, and in recipefinder-Filter-screen
- A stateless widget that displays the difficulty and the preparation time of the recipe
    - Shown in explore-, and in recipefinder-screen

### Widgets for the filter feature

- A stateful widget-button to enable/disable certain categories/diet types in the filter
- A stateful widget for the slider on the filter screen

    #### Widgets for the recipefinder-filter feature
    - A stateful widget for the search text field for ingredients
        - Shown in recipefinder-screen

### Widgets for the planning feature

- A stateless widget to change between weeks (an arrow)
- A stateless widget to display the current week on the page
- A stateless widget to remove a recipe from the planner
- A stateless widget to display the day the recipe is planned for

### Widgets for the recipe itself

- A stateful widget for the configuration of portion sizes
- A stateless widget-button for adding recipes to the planner
    - A stateful Date-Picker-widget to pick a date for the planner
- A stateless widget that displays the ingredients for the recipe
- A stateless widget that displays the preparation of the recipe


## Architecture

Exploreview\Widgets\
*Exploreview\Services\
Exploreview\ExploreController -> Implements MvcController
Exploreview\ExploreControllerImplementation
Exploreview\ExploreModel
Exploreview\ExploreView -> accesses the ExploreController

## Useful commands

This is the command for creating APK files:

    flutter build apk --split-per-abi 
    (The flutter build command defaults to --release.)

This command results in three APK files:

    [project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    [project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
    [project]/build/app/outputs/apk/release/app-x86_64-release.apk
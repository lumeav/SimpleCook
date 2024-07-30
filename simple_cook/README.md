# SimpleCook

SimpleCook is a versatile mobile application designed to alleviate the cooking experience and to bring some creativity to the kitchen. It offers a wide range of recipes, an explore function to scroll through different recipes, a personalized recipe finder powered by AI, and organizational tools to help users plan and favorite their culinary endeavors. With an intuitive interface, SimpleCook makes cooking accessible and enjoyable for everyone. "Cooking with SimpleCook does not have to be imaginitive."

## Screens and Main Functionalities

- **Explore View**
Displays the "Recipe of the Day" along with a selection of additional main course recipes. Users can browse and discover new recipes easily.
    - Key Features:
        - Recipe of the Day highlight
        - Browsing through various recipes
        - Searching for a specific recipe

- **Recipe Finder View**
Allows users to generate AI-powered recipes based on selected tags and search criteria. Users can also add specific ingredients to the AI-generated recipes.
    - Key Features:
        - Tag-based recipe generation
        - Search bar for ingredient-specific additions
        - AI-generated recipe

- **Favorites View**
Displays all recipes that users have marked as favorites, providing quick access to preferred dishes.
    - Key Features:
        - List of favorited recipes
        - Easy access to users' most liked recipes

- **Planner View**
Shows recipes that users have added to their meal planner, allowing them to plan meals for specific dates.
    - Key Features:
        - Calendar view of planned recipes
        - Ability to add recipes to specific dates for future use
- **Recipe View**
Provides detailed information about a selected recipe, including ingredients, preparation time, cooking steps, and the number of servings.
    - Key Features:
        - List of ingredients
        - Preparation time
        - Step-by-step cooking instructions
        - Number of servings

## User Guide

When opening the application you are greeted by the explore view, in which you can see the recipe of the day as well as other recipes that you can scroll through:

![](/assets/readme/Explore_1.png)
![](/assets/readme/Explore_2.png)
<br>
If you are not finding anything that you like in the explore view, you can simply search for a specific recipe that you would like to eat, in this example we look for a curry recipe like this:

![](/assets/readme/Explore_3.png)

After you continue, you are shown all recipes that fit the recipe which you have searched for:

![](/assets/readme/Explore_4.png)

If you have finally found what you were looking for you can simply tap on the recipe that you would like to cook:

![](/assets/readme/Recipe_1.png)

## Personas and their benefits

SimpleCook is designed to make cooking easier, more accessible, and more creative for a wide range of users. The app is built to provide quick and simple cooking ideas based on available ingredients, helping users turn whatever they have on hand into delicious meals. Additionally, the explore function allows you to scroll through a variety of different recipes, if you cannot decide on what you want. Here’s how SimpleCook addresses specific problems and benefits different personas.

- **Parents**

    - **Characteristics**
        - Typically have busy schedules with work and family responsibilities.
        - Often need to prepare meals for multiple people, including children.
        - Value efficiency and convenience in meal preparation.
        - Aim to provide healthy, home-cooked meals for their families.
    - **Challenge**

    Balancing a hectic schedule while ensuring that their families eat healthy, home-cooked meals.

    - **Benefit from SimpleCook**

    SimpleCook helps parents manage their busy lives by providing quick and easy recipe ideas and allowing them to plan meals ahead of time. Parents can enter the ingredients they have, and the app will suggest recipes that match, making meal preparation more efficient and less stressful.

    - **Feature highlight**

    The Planner View allows parents to plan meals in advance, ensuring that they have everything ready for busy weekdays.
<br>
- **Students**

    - **Characteristics**
        - Often have limited budgets and minimal cooking experience.
        - Frequently rely on inexpensive, easy-to-find ingredients.
        - Need to balance cooking with studying and social activities.
        - Value simplicity and cost-effectiveness in meal preparation.

    - **Challenge**

    Budget constraints and limited ingredients.

    - **Benefit from SimpleCook**

    SimpleCook allows students to save money by suggesting recipes based on what they already have in their kitchens, reducing food waste and avoiding unnecessary trips to the grocery store.

    - **Feature Highlight**

    The Recipe Finder View helps students maximize their limited pantry items by generating recipes from available ingredients.
<br>
- **Hobby Chefs**

    - **Characteristics**
        - Enjoy experimenting with new recipes and cooking techniques.
        - Seek to expand their culinary skills and knowledge.
        - Have a passion for trying out diverse cuisines and unique dishes.
        - Value creativity and innovation in the kitchen.

    - **Challenge**

    Finding new and exciting recipes to try out.

    - **Benefit from SimpleCook**

    SimpleCook broadens the culinary horizons of hobby chefs by presenting new and varied recipes. This allows them to explore new cuisines and cooking techniques, enhancing their skills and creativity in the kitchen.

    - **Feature Highlight**

    The Explore View offers a 'Recipe of the Day' along with other curated recipes, providing a continuous stream of new cooking ideas.
<br>
- **Vegetarians/Vegans**

    - **Characteristics**
        - Follow a vegetarian or vegan diet for health, ethical, or environmental reasons.
        - Seek a variety of plant-based recipes to diversify their meals.
        - Often require recipes that exclude certain animal products and by-products.
        - Value dietary preference filtering to easily find suitable recipes.

    - **Challenge**

    Finding suitable and varied vegetarian or vegan recipes.

    - **Benefit from SimpleCook**

    SimpleCook provides vegetarians and vegans with tailored recipes that meet their dietary preferences, ensuring that they have access to a wide variety of meals that suit their lifestyle.

    - **Feature Highlight**

    The app includes filtering options for dietary preferences in the Recipe Finder View, allowing users to easily find vegetarian or vegan recipes.

## Useful commands

This is the command for creating APK files:

    flutter build apk --split-per-abi 
    (The flutter build command defaults to --release.)

This command results in three APK files:

    [project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    [project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
    [project]/build/app/outputs/apk/release/app-x86_64-release.apk
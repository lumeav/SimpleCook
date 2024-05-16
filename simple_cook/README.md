# simple_cook

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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
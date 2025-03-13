# SwiftUI Recipes App with Favorites & Matched Geometry

A simple **iOS recipe app** built with **SwiftUI**. It demonstrates:

- **Tab-based navigation** (Home, Favorites, Settings)  
- **Matched Geometry Animations** for smoothly expanding/collapsing recipe cards in the Favorites tab  
- **Add/Remove Favorites** stored in a shared `FavoritesManager`  
- **Manual Dark Mode** toggle in **Settings**

## Features

1. **Home Screen**  
   - Horizontal scroll of recipe cards  
   - Tapping a card navigates to a RecipeDetailView for each recipe  
   - “Add to Favorites” button  

2. **Favorites Screen**  
   - Displays your favorited recipes in a grid (LazyVGrid)  
   - Tapping a card expands it with .matchedGeometryEffect()  
   - Tap outside or press “Close” to collapse the overlay  

3. **Settings Screen**  
   - Toggle for manual Dark Mode (.preferredColorScheme)

## Requirements

- Xcode 14 (or newer)  
- iOS 14 (or newer)  
- SwiftUI  

## Getting Started

1. **Clone the Repository**
```bash
   git clone https://github.com/YourUsername/YourRepoName.git](https://github.com/AbdullahHafiz30/DTP-W4D5-ClaasTask.git  
   cd YourRepoName
```
3. **Open in Xcode**  
   - Open CustomUIComponent.xcodeproj or .xcworkspace in Xcode.

4. **Run**  
   - Choose an iOS Simulator or a physical iOS device, then press **Run**.

## Usage

- **Home Tab**  
  - Scroll horizontally to see different recipes.  
  - Tap on a recipe to view its details and add it to favorites.

- **Favorites Tab**  
  - Lists recipes you’ve added to favorites.  
  - Tap a recipe to see a full-page detail overlay (expanded view).  
  - Tap outside or press “Close” to collapse.

- **Settings Tab**  
  - Toggle to enable or disable manual Dark Mode.

## Adding Your Own Recipes

1. **Add New Images** to Assets.xcassets with names like recipe6, recipe7, etc.  
2. **Update** HomeViewModel.swift by appending more Recipe data. For example:
```swift
Recipe(title: "New Recipe",
       imageName: "recipe6",
       description: "Your recipe description here...")
```
3. **Run** the app – your new recipes will appear in the Home tab.


## License

This project is provided for **learning purposes** only.  
Feel free to modify and distribute as needed for your own educational use.

**Enjoy building and customizing your SwiftUI Recipes App!** If you have questions or improvements, feel free to open a PR or file an issue in this repository.

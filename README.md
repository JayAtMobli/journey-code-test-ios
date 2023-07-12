# Coding test iOS app

---

This small app project was created for coding test.

## Requirements

---

* Create a native iOS app.  
* Use the endpoints at https://jsonplaceholder.typicode.com  
* Display posts in a list.  
* Open a detailed view with associated comments when user selects an item on the posts list.  
* Search functionality on the posts list and comments list.

## App Architecture

---
The app was developed using the SwiftUI framework with an MVVM-C (Model-View-ViewModel-Coordinator) architecture, comprising of Models, Views, View Models, and a Coordinator. While it is possible to create a simple app without utilising View Models and Coordinators, I chose to implement the complete MVVM-C architecture in this project to showcase my experience working on larger-scale applications.

### Models
Just simple data models using structure type.

* Post
* Comment

### Views
SwiftUI views are a function of state, not of sequence of event.

* HomeCoordinatorView - This view serves as the root view of the app, managing navigation between different views and taking responsibility for constructing its child views.
* PostListView - Simple list view with search bar for posts.
* CommentListView - Simple list view with search bar for comments.
 

### View Models
View models are responsible for managing the state and implementing the business logic associated with their respective views.

* PostListViewModel - post list data fetching and search logic
* CommentListViewModel - comment list data fetching and search logic


### Coordinator
The coordinator is responsible for creating and managing view models for the associated views within the navigation stack.

* HomeCoordinator


### Other layers

* Localisation
* Networking - Native concurrency framework (async/await)
* Utils and Extensions
* View Modifiers


## Testing

---

I have implemented unit testing for the core functions, although there isn't much logic to test in this small project.




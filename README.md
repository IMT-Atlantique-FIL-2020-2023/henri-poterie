# henri_poterie

Harry Potter books shop written in Flutter.

## Summary

This app features three different functionnalities :
* A view listing all books with their pictures, titles and prices
* A view displaying the detail of each book (including their synopsis)
* A basket management system (with an automatic processing of potential discount offers)


## Architecture

The app is written in the Dart language and divided in 5 packages :
### Packages
* #### bloc
The bloc package contains all the classes managing potential events about the status of the loading of the books, the state of the basket (books in basket, add/remove a book).
* #### data
The data package contains all the classes about books properties. It is divided in two sub-packages :

* ##### dto
Contains the models of a book and a commercial offer as represented in the API.
* ##### remote
Contains the service to retrieve data from the API and represent them into corresponding models available in the dto package.


* #### models
The models package contains all the different classes of objects used in the application : Book (same as in dto), Cart (representing books in basket), Library (representing all books available), Offer (representing all types of commercial offers like in dto package)


* #### screens
It contains two views : the home screen with all the books, and the book detail view. It also contains the parent view representing the basket. Both home screen and book detail view are contained inside of the basket view.


* #### widget
It contains all widgets represented on screen :
Book : Representing a book in the list of books
BookOverview : Representing basic information of the book (image, title, isbn, price)
BookSynopsis : Representing the synopsis of the book



### Routing
To make it easier, we decided to use the BasketSheet view as the main screen with the home screen as default sub view. The sub view is passed as parameter to the BasketSheet. The routing between the list of books and book detail is nested inside the BasketSheet view. We don't use named routes. Instead, we directly use view classes.
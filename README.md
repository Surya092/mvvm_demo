This project contains a simple code setup of ViewController having an embedded navigation controller and tableview.The data for the tableview is processed from the ViewModel. 
On tapping any cell on the tableview a new viewcontroller is pushed to the navigation stack. The code adheres to MVVM-C Design Pattern as per structural conformance where ViewController or View acts as View while ViewModel acts as the brain of the setup.

The model instance is loosely coupled to ViewModel to achieve Dependency injection on Testcases. 
The View is isolated from model. The view receives action and updates the same to ViewModel. ViewModel acts as the intelligence unit and updates the model and self. View is updated on refresh

The ViewModel setup is tightly coupled to view but decoupled to model which enables reusability and testability. Also viewmodel can be created at subview level which gives decoupling. The routing ability lies with the coordinator which is a drawback on MVVM where view control the routing.

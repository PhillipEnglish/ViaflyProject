#ViaflyProject
##A test project for Viafly by Phillip English

This simple project is built on an MVVM backbone so that it can easily grow in a modular fashion with the addition of more complex requirements and data. It makes generous use of the functional-reactive paradigm for a UI that is dynamic and code that is clean and easy to scale.

*__To Run__: please open xcworkspace and not xcodeproj to run in simulator or device*


The key component of this application is the reactive tableview.  Using RxSwift and RxCocoa, I bind the tableview to an array of objects generated from the inventory.  This allows me to omit tableview delegate methods, cutting back the size of the main viewcontroller, and avoiding the need to reload the table every time the data changes. This means we can modify the datamodel directly without concern for tableview code, and the view will update reactively

###Here's the only tableview setup code in the app:
```
 //From ViewDidLoad in MainViewController:
        itemVM.itemArray.asObservable().observeOn(MainScheduler.instance).bindTo(tableView.rx.items(cellIdentifier: "ItemCell", cellType: ItemCell.self)) {
            row, itemModel, cell in
            cell.catLabel.text = itemModel.category.rawValue
            cell.descriptionLabel.text = itemModel.item
            cell.priceLabel.text = itemModel.price
            cell.qtyLabel.text = String(itemModel.qty)

        }
        .addDisposableTo(disposeBag)
```

###Features by requirement:
> Find the List of items that are in-stock

>Sort the items by price

![](https://raw.githubusercontent.com/PhillipEnglish/ViaflyProject/master/Gif1.gif)


Here I use a simple segment controller to sort the data array by price. It is assumed that out of stock items are not relevant to the user, so items are only displayed if QTY is greater than zero.   It should be noted that some of the items in the inventory file have a price of $0.0. One question I have is: How would you want this case handled? To be comprehensive, I've left included them in the data model, but that does not seem correct for a production app.


> Search the items by name:

![](https://raw.githubusercontent.com/PhillipEnglish/ViaflyProject/master/Gif2.gif)

Here I've implemented a reactive search bar that displays results that contain the query.  When no results are found, it returns the original dataset: This is one part of the application where there's room for improvement.  Later I'd like to inform the user that no results were found. There's no need to press return button, and the keyboard is dismissed when a click occurs outside of it.

> Filter items based on categories

![](https://raw.githubusercontent.com/PhillipEnglish/ViaflyProject/master/Gif3.gif)

Categories are displayed in a popover, and selection filters the array by category.

###Dependencies

In this app I've used the following dependencies: **RxSwift/RxCocoa**, for the reasons listed above - to make the main view reactive, cutting down the amount of code to the MainViewController and placing concern for changes to the data solely on the model and viewModel

**CSVImporter**, to cut down on time and space spent parsing the CSV file, and for convenient initialization of a model object from the CSV file

###Business logic and opportunities for optimization
I've focused on concerns of modularity and scalability, assuming that the data may change and requirements may expand at a later date: MVVM allows me to easily make changes to the model class without worrying much about changing the view and view controller.  

If given more time, I believe there's a more elegant solution to the category sorting: Currently I repopulate the array every time a category changes: This may come with a performance cost if the app was pulling it's data from a web api.  I would like to optimize this.

Additionally, to prevent calling a populate method when search returns no results, I have a duplicate array storing values that is assigned to the data model to avoid calling the populate method.  A more elegant solution may be to have this data conform to a type that can be cached (and thus deallocated if there are memory issues) or optimizing the populate method (particularly if it become an API Call)

###For taking the time to review this project, and considering me for a positon as an iOS Engineer at Viafly, I want to say: 

![](https://media.giphy.com/media/a3IWyhkEC0p32/giphy.gif) 




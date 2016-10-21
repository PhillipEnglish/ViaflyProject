#ViaflyProject
##A test project for Viafly by Phillip English

This simple project is built on an MVVM backbone so that it can easily grow in a modular fashion with the addition of more complex requirements and data. It makes generous use of the function-reactive paradigm for a UI that is dynamic and code that is clean and easy to scale.

The key component of this application is the reactive tableview.  Using RxSwift and RxCocoa, I bind the tableview to an array of objects generated from the inventory.  This allows me to omit tableview delegate methods, cutting back the size of the main viewcontroller, and avoiding the need to reload the table every time the data changes. This means we can modify the datamodel directly without concern for tableview code, and the view will update reactively

###Here's the only tableview setup code in the app:
```swift
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

![]("http://i.giphy.com/qW314hUM91jDW.gif")

Here I use a simple segment controller to sort the data array by price

> Search the items by name




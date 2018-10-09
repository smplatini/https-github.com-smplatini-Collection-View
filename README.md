# https-github.com-smplatini-Collection-View
Simple Collection View
Steps:
1.Create a Collection View Controller with a reusable cell("Cell") in Main.storyboard.
2.Create a data class(data that will be inside this cell) called DataItem.swift
3.Create a custom cell(we will not use CollectionViewController Cell) and cast this custoom view cell as Collection View Cell. 
The custom cell is a subclass of CollectionView Cell and we will call it DataItemCell.swift
4.In the collectionView Controller class implement the following functions:

a. numberOfSections -> it will return the number of sections(how many arrays are actually combined)

b. override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
This will return the number of items in each section.

c. override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
This will configure the reusable cell.

5. Load the full data in viewDidLoad() method.

6. Remove the following lines from CollectionViewController:

self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

Also remove the following declaration at the top of the class (if your generated CollectionViewController class has it).

private let reuseIdentifier = "Cell"
//
//  CollectionCollectionViewController.swift
//  CollectionView
//
//  Created by Saad Platini on 08.10.18.
//  Copyright © 2018 Saad Platini. All rights reserved.
//




import UIKit



class CollectionCollectionViewController: UICollectionViewController {
    
    var animalDataItems = [DataItem]()
    var allItems = [[DataItem]]()
    var plantDataItems = [DataItem]()
    
    
    //Function to insert item in collections
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let item = DataItem(title: "New Item", kind: .Animal, imageName: "default.jpeg")
        let index = allItems[0].count - 7
        allItems[0].append(item)
        let indexPath = IndexPath(item: index, section: 0)
       print(index)
        collectionView?.insertItems(at: [indexPath])
        print(indexPath)
        
        
    }
    
    
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        //Changing the size of the cell at runtime
        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        for i in 1...12 {
            
            if i > 9 {
                
                plantDataItems.append(DataItem(title: "Title #\(i)", kind: Kind.Plant, imageName: "img\(i).jpg"))
                
            }
            else{
                
                plantDataItems.append(DataItem(title: "Title #0\(i)", kind: Kind.Animal, imageName: "img0\(i).jpg"))
                
            }
            
            
        }
        
        for i in 1...12 {
            if i > 9 {
                
                animalDataItems.append((DataItem(title: "Another title", kind: Kind.Animal, imageName: "anim\(i).jpg")))
                
                
            }
            else{
                animalDataItems.append(DataItem(title: "Another Title #0\(i)", kind: Kind.Animal, imageName: "anim0\(i).jpg"))
            }
            
        }

        allItems.append(plantDataItems)
        allItems.append(animalDataItems)
     
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allItems.count
    
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allItems[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DataItemCell
        let dataItem = allItems[indexPath.section][indexPath.item]
        cell.dataItem = dataItem
        
       
        // Configure the cell
        
        
    
        return cell
    }
    
   /* ****************************************** Commit 3 *************************************************** */
 
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! DataItemHeader
        
        var title = ""
        
        if let kind = Kind(rawValue: indexPath.section){
            sectionHeader.title = kind.description()
        }
        
        
        return sectionHeader
    }
    
 
    

    // MARK: UICollectionViewDelegate

  
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        print(indexPath)
        return true
    }
 

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
   
}

//
//  DataItemCell.swift
//  CollectionView
//
//  Created by Saad Platini on 09.10.18.
//  Copyright © 2018 Saad Platini. All rights reserved.
//

import UIKit

class DataItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var dataItemImageView: UIImageView!
    
    var dataItem: DataItem?{
        
        didSet{
            if let dataItem = dataItem {
                
                dataItemImageView.image = UIImage(named: dataItem.imageName)
                
            }
        }
        
    }
    
}

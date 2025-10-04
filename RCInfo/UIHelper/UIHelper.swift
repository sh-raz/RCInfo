//
//  UIHelper.swift
//  RCInfo
//
//  Created by shilani on 16/03/2024.
//

import UIKit


 struct UIHelper {
     static func configureCollectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout{
         let width = view.bounds.width
         let padding: CGFloat = 12
         let minimunItemSpacing: CGFloat = 12
         let widthAvailable = width - 2 * padding - 2 * minimunItemSpacing
         let itemWidth = widthAvailable / 3
         
         let flowLayout = UICollectionViewFlowLayout()
         flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
         flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}





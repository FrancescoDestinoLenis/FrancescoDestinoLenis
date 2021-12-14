//
//  CarouselFlowLayout.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit

class CarouselFlowLayout: UICollectionViewFlowLayout {
    
    let activeDistance: CGFloat = 120
    let zoomFactor: CGFloat = 0.3
    
    override init() {
        super.init()
    }
    
    init(scrollDirection: UICollectionView.ScrollDirection, minLineSpacing: CGFloat, minInteritemSpacing: CGFloat) {
        super.init()
        self.scrollDirection = scrollDirection
        minimumLineSpacing = minLineSpacing
        minimumInteritemSpacing = minInteritemSpacing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { fatalError() }
        let verticalInsets = (collectionView.frame.height - collectionView.adjustedContentInset.top - collectionView.adjustedContentInset.bottom - itemSize.height) / 2
        let horizontalInsets = (collectionView.frame.width - collectionView.adjustedContentInset.right - collectionView.adjustedContentInset.left - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: verticalInsets, left: horizontalInsets, bottom: verticalInsets, right: horizontalInsets)
        
        super.prepare()
    }
}

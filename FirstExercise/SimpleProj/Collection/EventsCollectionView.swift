//
//  EventsCollectionView.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit

class EventsCollectionView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let layout = CarouselFlowLayout(scrollDirection: .horizontal, minLineSpacing: 10, minInteritemSpacing: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(frame: CGRect, collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource, cellsize: CGSize, insetX: CGFloat, insetY: CGFloat) {
        super.init(frame: frame)
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = cellsize
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDataSource
        
        setup()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func registerCells() {
        self.collectionView.register(EventCollectionCell.self, forCellWithReuseIdentifier: EventCollectionCell.identifier)
    }
    
    public func reloadCollection() {
        self.collectionView.reloadData()
    }
}

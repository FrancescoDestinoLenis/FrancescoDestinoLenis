//
//  PerformersView.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit

class PerformersView: UIView {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(frame: CGRect, collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource) {
        super.init(frame: frame)
        
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDataSource
        
        setup()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        self.collectionView.register(PerformerCell.self, forCellWithReuseIdentifier: PerformerCell.identifier)
    }
    
    public func reloadCollection() {
        self.collectionView.reloadData()
    }

}

//
//  EventsCollectionViewController+Extensions.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit

extension EventsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.value.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionCell.identifier, for: indexPath) as? EventCollectionCell else { return UICollectionViewCell() }
        
        let event = self.events.value[indexPath.row]
        
        cell.configure(event: event)
        
        return cell
    }
}

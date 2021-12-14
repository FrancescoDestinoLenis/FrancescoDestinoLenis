//
//  EventsCollectionViewController+Extensions.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit

extension EventsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        do {
            return try events.value().count
        } catch {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionCell.identifier, for: indexPath) as? EventCollectionCell else { return UICollectionViewCell() }
        
        do {
        let event = try self.events.value()[indexPath.row]
        
        cell.configure(event: event)
        } catch {
            
        }
        
        return cell
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if let layout = collectionView?.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellwidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellwidthIncludingSpacing
            let roundedIndex = round(index)
            offset = CGPoint(x: roundedIndex * cellwidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
            
            targetContentOffset.pointee = offset
        }
    }
}


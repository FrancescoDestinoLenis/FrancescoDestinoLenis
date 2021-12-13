//
//  PerformersViewController+Extensions.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit

extension PerformersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return performers.value.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PerformerCell.identifier, for: indexPath) as? PerformerCell else { return UICollectionViewCell() }
        
        let performer = self.performers.value[indexPath.row]
        
        cell.configure(performer: performer)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 200)
    }
}

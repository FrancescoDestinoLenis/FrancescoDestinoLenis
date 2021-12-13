//
//  PerformerCell.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit

class PerformerCell: UICollectionViewCell {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var performerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ArialMT", size: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardView.roundWithShadow()
        imageView.layer.cornerRadius = 10
    }
    
    private func setupView() {
        
        self.contentView.addSubview(cardView)
        self.cardView.addSubview(imageView)
        self.cardView.addSubview(performerNameLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            performerNameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            performerNameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            performerNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            performerNameLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
        ])
    }
    
    public func configure(performer: Performer) {
        if let url = URL(string: performer.image) {
            imageView.load(url: url)
        }
        performerNameLabel.text = performer.name
    }
}

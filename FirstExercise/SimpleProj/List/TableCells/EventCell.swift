//
//  PeopleCell.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit

class EventCell: UITableViewCell {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ArialMT", size: 18)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var eventDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ArialMT", size: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardView.roundWithShadow()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        self.contentView.addSubview(cardView)
        self.cardView.addSubview(eventTitleLabel)
        self.cardView.addSubview(eventDateLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            eventTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            eventTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            eventTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            eventDateLabel.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor, constant: 10),
            eventDateLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            eventDateLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            eventDateLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
        ])
    }
    
    public func configure(event: SGEvent) {
        eventTitleLabel.text = event.title
        eventDateLabel.text = event.datetimeLocal.convertDate(from: "yyyy-MM-dd'T'HH:mm:ss", to: "dd/MM/yyyy - hh:MM")
    }

}

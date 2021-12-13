//
//  WelcomeView.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit
import RxSwift

class WelcomeView: UIView {
    
    public let disposeBag = DisposeBag()
    
    public var buttonAction: (() -> ())? = nil
    public var collectionAction: (() -> ())? = nil
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "ArialMT", size: 36)
        label.textColor = .black
        label.text = "WELCOME"
        return label
    }()
    
    private lazy var accessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Lista", for: .normal)
        button.backgroundColor = UIColor(hex: "#6ad29eff")
        return button
    }()
    
    private lazy var collectionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Collection", for: .normal)
        button.backgroundColor = UIColor(hex: "#12598bff")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(frame: CGRect, buttonAction: @escaping () -> (), collectionAction: @escaping () -> ()) {
        super.init(frame: frame)
        
        self.buttonAction = buttonAction
        self.collectionAction = collectionAction
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.addSubview(welcomeLabel)
        self.addSubview(accessButton)
        self.addSubview(collectionButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            accessButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            accessButton.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor),
            accessButton.widthAnchor.constraint(equalToConstant: 150),
            accessButton.heightAnchor.constraint(equalToConstant: 45),
            collectionButton.topAnchor.constraint(equalTo: accessButton.bottomAnchor, constant: 20),
            collectionButton.centerXAnchor.constraint(equalTo: accessButton.centerXAnchor),
            collectionButton.widthAnchor.constraint(equalToConstant: 150),
            collectionButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        accessButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.buttonAction?()
            })
            .disposed(by: disposeBag)
        
        collectionButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.collectionAction?()
            })
            .disposed(by: disposeBag)
    }
}

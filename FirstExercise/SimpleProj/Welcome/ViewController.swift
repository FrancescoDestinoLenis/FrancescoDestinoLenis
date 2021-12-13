//
//  ViewController.swift
//  SimpleProj
//
//  Created by Francesco Destino on 06/12/21.
//

import UIKit
import RxSwift
import RxRelay

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Resources -> \(RxSwift.Resources.total)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = WelcomeView(frame: self.view.frame, buttonAction: { [weak self] in
            guard let self = self else { return }
            let nextVc = ListViewController()
            self.navigationController?.pushViewController(nextVc, animated: true)
        }, collectionAction: { [weak self] in
            guard let self = self else { return }
            let nextVc = ListViewController()
            self.navigationController?.pushViewController(nextVc, animated: true)
        })
    }
    
}

//
//  PerformersViewController.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit
import RxRelay
import RxSwift

class PerformersViewController: UIViewController {
    
    var performersView: PerformersView?
    let performers = BehaviorRelay<[Performer]>(value: [])
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        
        self.performersView = PerformersView(frame: self.view.frame, collectionViewDelegate: self, collectionViewDataSource: self)
        
        self.view = self.performersView
        
        self.performers
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                if let view = self.performersView {
                    view.reloadCollection()
                }
            })
            .disposed(by: disposeBag)
    }

}

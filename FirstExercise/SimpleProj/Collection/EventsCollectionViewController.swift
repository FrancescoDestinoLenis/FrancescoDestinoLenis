//
//  EventsCollectionViewController.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit
import RxRelay
import RxSwift

class EventsCollectionViewController: UIViewController {
    
    var collectionView: EventsCollectionView?
    let events = BehaviorRelay<[SGEvent]>(value: [])
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startDownload() {
        let sgEvents = SGApiManager.events
        sgEvents.bind(to: events)
            .disposed(by: disposeBag)
    }
    
    override func loadView() {
        super.loadView()
        
        self.collectionView = EventsCollectionView(frame: self.view.frame, collectionViewDelegate: self, collectionViewDataSource: self)
        
        self.view = self.collectionView
        
        self.events
            .asObservable()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                if let view = self.collectionView {
                    view.reloadCollection()
                }
            })
            .disposed(by: disposeBag)
        
        startDownload()
    }

}

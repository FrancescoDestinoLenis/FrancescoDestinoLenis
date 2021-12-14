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
    
    let cellScale: CGFloat = 0.7
    
    var currentScrollOffset: CGPoint = CGPoint()

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
        
        let screenSize = UIScreen.main.bounds
        let cellwidth = floor(screenSize.width * cellScale)
        let cellHeight: CGFloat = 450
        
        self.collectionView = EventsCollectionView(frame: self.view.frame, collectionViewDelegate: self, collectionViewDataSource: self, cellsize: CGSize(width: cellwidth, height: cellHeight))
        
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

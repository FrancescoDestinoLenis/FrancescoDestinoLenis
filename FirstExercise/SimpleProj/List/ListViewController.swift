//
//  ListViewController.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit
import RxSwift
import RxRelay

class ListViewController: UIViewController {
    
    let events = BehaviorRelay<[SGEvent]>(value: [])
    let disposeBag = DisposeBag()
    
    var listView: ListView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startDownload() {
        let sgEvents = SGApiManager.events
        sgEvents.bind(to: events)
            .disposed(by: disposeBag)
    }
    
    override func loadView() {
        super.loadView()
        
        self.listView = ListView(frame: self.view.frame, tableViewDelegate: self, tableViewDataSource: self)
        self.view = listView
        
        listView?.showBlurLoader()
        
        events
            .asObservable()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] events in
                guard let self = self else { return }
                if let view = self.listView {
                    view.reloadTable()
                    view.removeBluerLoader()
                }
            }, onCompleted: {
                print("Completed!!!")
            })
            .disposed(by: disposeBag)
        
        startDownload()
    }

}

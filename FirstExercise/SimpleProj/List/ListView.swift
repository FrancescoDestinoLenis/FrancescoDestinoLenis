//
//  ListView.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import UIKit
import RxSwift
import RxCocoa

class ListView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    init(frame: CGRect, tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        super.init(frame: frame)
        
        self.tableView.delegate = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
        
        setup()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func registerCells() {
        self.tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.identifier)
    }
    
    public func reloadTable() {
        self.tableView.reloadData()
    }

}

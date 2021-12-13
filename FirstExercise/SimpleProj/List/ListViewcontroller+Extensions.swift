//
//  ListViewcontroller+Extensions.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as? EventCell else { return UITableViewCell() }
        
        let event = events.value[indexPath.row]
        
        cell.configure(event: event)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events.value[indexPath.row]
        
        let nextVc = PerformersViewController()
        nextVc.performers.accept(event.performers)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

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
        do {
            return try events.value().count
        } catch {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as? EventCell else { return UITableViewCell() }
        do {
            let event = try events.value()[indexPath.row]
            
            cell.configure(event: event)
        } catch {
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let event = try events.value()[indexPath.row]
            let nextVc = PerformersViewController()
            nextVc.performers.accept(event.performers)
            self.navigationController?.pushViewController(nextVc, animated: true)
        } catch {
            
        }
    }
}

//
//  GeneralExtension.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation

extension CodingUserInfoKey {
    static let contentIdentifier = CodingUserInfoKey(rawValue: "contentIdentifier")!
}


extension String {
    func convertDate(from dateFormatFrom: String, to dateFormatTo: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "UTC")
        dateFormatter.dateFormat = dateFormatFrom
        
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        dateFormatter.dateFormat = dateFormatTo
        
        return dateFormatter.string(from: date)
    }
}

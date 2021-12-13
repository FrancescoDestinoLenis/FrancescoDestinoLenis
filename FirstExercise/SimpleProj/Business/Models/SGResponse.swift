//
//  File.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation

struct SGResponse<Content: Decodable>: Decodable {
    
    let content: Content
    
    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int? = nil

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        guard let ci = decoder.userInfo[.contentIdentifier],
                    let contentIdentifier = ci as? String,
                    let key = CodingKeys(stringValue: contentIdentifier) else {
            throw SGError.invalidDecoderConfiguration
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decode(Content.self, forKey: key)
    }
}

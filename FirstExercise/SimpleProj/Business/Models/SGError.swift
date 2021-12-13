//
//  SGError.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation

enum SGError: Error {
    case invalidURL(String)
    case invalidParameter(String, Any)
    case invalidJSON(String)
    case requestFailed
    case invalidDecoderConfiguration
}

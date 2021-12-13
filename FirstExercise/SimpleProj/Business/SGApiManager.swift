//
//  SGApiManager.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation
import RxSwift

class SGApiManager {
    static let baseUrl = "https://api.seatgeek.com/2"
    static let eventsEndpoint = "/events"
    static let performers = "/performers"
    
    static let client_id = "MjQ5MjU2MTh8MTYzOTM5MzA5MC45NjczMzc4"
    static let client_secret = "6e399188ea23aa4874c14c8556fe792a4a4c4fe52bc6fe7e7cb893e665bf1150"
    
    static let authParams: [String: Any] = {
        return [
            "client_id": client_id,
            "client_secret": client_secret
        ]
    }()
    
    static func jsonDecoder(contentIdentifier: String) -> JSONDecoder {
      let decoder = JSONDecoder()
      decoder.userInfo[.contentIdentifier] = contentIdentifier
      decoder.dateDecodingStrategy = .iso8601
      return decoder
    }
    
    static func request<T: Decodable>(endpoint: String, query: [String: Any] = [:], contentIdentifier: String) -> Observable<T> {
        do {
            guard let url = URL(string: baseUrl)?.appendingPathComponent(endpoint), var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
              throw SGError.invalidURL(endpoint)
            }
            
            components.queryItems = try query.compactMap({ (key, value) in
                guard let val = value as? CustomStringConvertible else {
                    throw SGError.invalidParameter(key, value)
                }
                return URLQueryItem(name: key, value: val.description)
            })
            guard let finalUrl = components.url else {
                throw SGError.invalidURL(endpoint)
            }
            
            let request = URLRequest(url: finalUrl)
            
            return Observable<T>.create { observer in
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let httpResponse = response as? HTTPURLResponse {
                        let statusCode = httpResponse.statusCode
                        
                        do {
                            let _data = data ?? Data()
                            if (200...399).contains(statusCode) {
                                let decoder = self.jsonDecoder(contentIdentifier: contentIdentifier)
                                let envelope = try decoder.decode(SGResponse<T>.self, from: _data)
                                observer.onNext(envelope.content)
                            } else {
                                //MARK: observer onNext event
                                observer.onError(SGError.requestFailed)
                            }
                        } catch let error {
                            //MARK: observer onNext event
                            observer.onError(error)
                        }
                    }
                    //MARK: observer onCompleted event
                    observer.onCompleted()
                }
                task.resume()
                
                return Disposables.create {
                    task.cancel()
                }
            }
            
//            return URLSession.shared.rx.response(request: request)
//                .map { (result: (response: HTTPURLResponse, data: Data)) -> T in
//                    let decoder = self.jsonDecoder(contentIdentifier: contentIdentifier)
//                    let envelope = try decoder.decode(SGResponse<T>.self, from: result.data)
//                    return envelope.content
//                }
        } catch {
            return Observable.empty()
        }
    }
    
    static var events: Observable<[SGEvent]> = {
        let request: Observable<[SGEvent]> = SGApiManager.request(endpoint: eventsEndpoint, query: authParams, contentIdentifier: "events")
        
        return request
            .catchAndReturn([])
    }()
}

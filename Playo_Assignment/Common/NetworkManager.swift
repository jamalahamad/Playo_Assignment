//
//  NetworkManager.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import Foundation

let Api_Key = "55745d0105bc459c876844f255393132"

class NetworkManager {
    
    static let shared = NetworkManager()
    private init (){}
    
    func genericAPIGETRequest<T: Codable>(returnType: T.Type, urlStr: String, completionBlock: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlStr)  else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    self.handleNetworkError(error: error, response: response)
                    let response = try decoder.decode(T.self, from: data)
                    completionBlock(response.self, nil)
                } catch {
                    print("error in parsing : \(String(describing: error.localizedDescription))")
                    completionBlock(nil, error)
                }
            } else {
                self.handleNetworkError(error: error, response: response)
                print("no readable data in response : \(String(describing: error?.localizedDescription))")
                completionBlock(nil, error)
            }
        } .resume()
    }
    
    private func handleNetworkError(error: Error?, response: URLResponse?) {     // handles errors returned from URLResponse
        if let err = error {
            devLog("APTMobileNetworkManager returned network error \(err.localizedDescription)")
        }
        
        if let myResponse = response as? HTTPURLResponse {
            devLog("Response code: \(myResponse.statusCode))")
            devLog("Response headers: \(myResponse.allHeaderFields))")
        }
    }
    
    func devLog(_ item: Any) {
        #if DEBUG
            print(item)
        #endif
    }
}

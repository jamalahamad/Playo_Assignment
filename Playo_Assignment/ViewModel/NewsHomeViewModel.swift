//
//  NewsHomeViewModel.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import Foundation

class NewsViewModel {
    
    var networkManager = NetworkManager.shared
    
    func getNewsData(url: String, completion: @escaping (ArticlesDataModel?, Error?)->()) {

        networkManager.genericAPIGETRequest(returnType: ArticlesDataModel.self, urlStr: url) { (newsModelArray, error) in
            if error == nil {
                completion(newsModelArray, nil)
            } else {
                completion(ArticlesDataModel(), error)
            }
        }
    }

}

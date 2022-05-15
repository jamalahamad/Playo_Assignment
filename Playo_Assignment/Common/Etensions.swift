//
//  Etensions.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(urlStr: String){
        guard  let url = URL(string: urlStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                
            }
        }
        task.resume()
    }
}

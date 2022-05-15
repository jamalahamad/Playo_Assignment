//
//  HomeNewsTableViewCell.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import UIKit
import Kingfisher

class HomeNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblAuther: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpHomeNewsCell(article: Articles) {
        self.lblAuther.text = article.author
        self.lblTitle.text = article.title
        self.lblDescription.text = article.desc
        self.imgView.kf.setImage(with: URL(string: article.urlImage ?? ""), placeholder: nil, options: [ .transition(.fade(0.20))]) { (succes) in
            
            self.activityIndicator.stopAnimating()
            
        }
    }
    
    func setActivityIndicator() {
        activityIndicator.frame = self.imgView.bounds
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
    }
}

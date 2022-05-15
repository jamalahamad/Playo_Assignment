//
//  ViewController.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var homeNewsTable: UITableView!
    let refreshControl = UIRefreshControl()
    
    var articles: [Articles] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.getNewsdata()
    }
    
    func setUpUI() {
        self.homeNewsTable.register(UINib(nibName: "\(HomeNewsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(HomeNewsTableViewCell.self)")
        self.homeNewsTable.dataSource = self
        self.homeNewsTable.delegate = self
        self.homeNewsTable.allowsSelection = true
           refreshControl.addTarget(self, action: #selector(pullTorefresh), for: .valueChanged)
        homeNewsTable.refreshControl = refreshControl

    }
    
    @objc func pullTorefresh() {
        getNewsdata()
    }

    func getNewsdata() {
        let vm = NewsViewModel()
        vm.getNewsData(url: Constants.newsUrl) { (articleDataModel, error) in
            DispatchQueue.main.async {
                guard let art = articleDataModel?.articles else {return}
                self.articles = art
                self.homeNewsTable.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }

}

// MARK: -  TableView Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HomeNewsTableViewCell.self)", for: indexPath) as? HomeNewsTableViewCell
        cell?.setActivityIndicator()
        cell?.setUpHomeNewsCell(article: self.articles[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detalsVc = DetailsViewController()
        detalsVc.webUrlStr = self.articles[indexPath.row].urlNewsWeb ?? ""
        self.navigationController?.pushViewController(detalsVc, animated: true)
    }
}


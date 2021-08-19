//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Kuldeep on 19/08/21.
//

import UIKit

class NewsListTableViewController: UITableViewController {
  
  private var articleListVM: ArticleListViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-08-18&to=2021-08-18&sortBy=popularity&apiKey=3e3ca373b6204f02826f7d8d78d48b49") else {
      return
    }
    
    WebServices().getArticles(url: url) {
      artciles in
      
      if let articles = artciles {
        self.articleListVM = ArticleListViewModel(articles: articles)
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.articleListVM.numberOfRowsInSection(_section: section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
        fatalError("ArticleTableViewCell is not found")
    }
    
    let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
    
    cell.titleLable.text = articleVM.title
    cell.descriptionLable.text = articleVM.description
    
    return cell
  }
}

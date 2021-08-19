//
//  WebServices.swift
//  GoodNews
//
//  Created by Kuldeep on 19/08/21.
//

import Foundation

class WebServices  {
  
  func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        print(error.localizedDescription)
        completion(nil)
       } else if let data = data {
        
        
        let articles = try? JSONDecoder().decode(Articles.self, from: data)
        
        if let articleList = articles {
          completion(articleList.articles)
        }
        
        print(articles?.articles as Any)
        
        completion(nil)
      }
    }.resume()
  }
}

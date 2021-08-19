//
//  Articles.swift
//  GoodNews
//
//  Created by Kuldeep on 19/08/21.
//

import Foundation

struct Articles: Decodable {
  let articles: [Article]
}


struct Article: Decodable {
  let title: String
  let description: String
}

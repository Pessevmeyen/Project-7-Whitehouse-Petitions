//
//  Petition.swift
//  Project7
//
//  Created by Furkan Eruçar on 8.04.2022.
//

import Foundation

struct Petition: Codable { // Swift has built-in support for working with JSON using a protocol called Codable. When you say “my data conforms to Codable”, Swift will allow you to convert freely between that data and JSON using only a little code.
    var title: String
    var body: String
    var signatureCount: Int
}

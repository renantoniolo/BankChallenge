//
//  Statement.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

struct Statement : Codable {
    let id: Int
    let type: String
    let date: String
    let detail: String
    let value: Int
}

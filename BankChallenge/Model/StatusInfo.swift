//
//  StatusInfo.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

struct StatusInfo : Codable {
    let code: Int
    let status: String
    let data: Data
}

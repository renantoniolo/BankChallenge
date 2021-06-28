//
//  UserInfo.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

struct UserInfo : Codable {
    let name: String?
    let cpf: String?
    let saldo: Double?
    let token: String?
}

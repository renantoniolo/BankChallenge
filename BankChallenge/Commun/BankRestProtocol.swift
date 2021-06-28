//
//  BankRestProtocol.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

protocol BankRestProtocol : class  {
    func postLogin(paramets: [String])
    func getStatement()
}

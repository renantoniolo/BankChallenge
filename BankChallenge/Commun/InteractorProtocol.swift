//
//  InteractorProtocol.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

protocol InteractorProtocol: class {
    func returnUser(userInfo: UserInfo?)
    func returnStatement(statements: Statements?)
}

//
//  StatementPresenter.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

class StatementPresenter : ObservableObject {
    
    var interactor: StatementInteractor!
    var view: StatementView!
    
    init(view: StatementView) {
        self.view = view
    }
    
    // MARK: - Input
    
    func loadStatementList() {
        self.interactor.getStatementList()
    }
    
    func getLogout() {
        
    }
    
    func getUserInfo() -> UserInfo? {
        return nil
    }
    
    // MARK: - Output
    
    func setStatements(statements: Statements) {
        self.view?.setStatements(statements: statements)
    }
}

//
//  StatementInteractor.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import Foundation

class StatementInteractor : ObservableObject {
    
    // MARK: - Properties
    var presenter: StatementPresenter!
    var bank: BankRest!
    
    init(presenter: StatementPresenter) {
        self.presenter = presenter
        self.bank = BankRest(interactor:self)
    }
    
    // MARK: - Private
    
    private func setStatements(statements: Statements) {
        self.presenter.setStatements(statements: statements)
    }
    
    // MARK: - Input
    
    func getStatementList(){
        self.bank.getStatement()
    }
}

// MARK: - InteractorProtocol

extension StatementInteractor : InteractorProtocol {
    func returnStatement(statements: Statements?) {
        guard let list = statements else {
            return
        }
        setStatements(statements: list)
    }
    
    func returnUser(userInfo: UserInfo?) {
        
    }
    
}

//
//  LoginInteractor.swift
//  BankChallenge
//
//  Created by Renan Rocha on 25/05/21.
//

import Foundation

class LoginInteractor {
    
    // MARK: - Properties
    var presenter: LoginPresenter!
    var userInfo: UserInfo!
    var bank: BankRest!
    private var user: String!
    
    // MARK: - Private
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        self.bank = BankRest(interactor:self)
    }
    
    // MARK: - Input
    
    func getLoginUser(user: String, password: String){
        self.user = user
        self.bank.postLogin(paramets: [user,password])
    }
    
    func getUserStorage() {
        guard let user = BankManagerStorage.shared.loadUser() else {
            return
        }
        self.setUserLogin(userInfo: user)
    }
    
    func saveUserInfo() {
        //_ = BankManagerStorage.shared.insertUser(user: self.user)
    }
    
    // MARK: - Output
    
    private func setErrorLogin(){
        self.presenter.setErrorLoginUser()
    }
    
    private func setSucessLogin(){
        self.presenter.setSucessLoginUser()
    }
    
    private func setUserLogin(userInfo: BankStorage) {
        self.presenter.setLoginUser(user: userInfo.email!)
    }
}

// MARK: - InteractorProtocol

extension LoginInteractor : InteractorProtocol {
    func returnStatement(statements: Statements?) {
        
    }
    
    func returnUser(userInfo: UserInfo?) {
        if userInfo != nil {
            self.userInfo = userInfo
            self.setSucessLogin()
        }
        else {
            self.setErrorLogin()
        }
    }
}

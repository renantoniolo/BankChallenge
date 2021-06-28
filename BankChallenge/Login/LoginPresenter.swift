//
//  LoginPresenter.swift
//  BankChallenge
//
//  Created by Renan Rocha on 25/05/21.
//

import Foundation

class LoginPresenter: ObservableObject {
    
    // MARK: - Properties
    
    var interactor: LoginInteractor!
    var view: LoginView!
    var router: LoginRouter!
    
    var userInfo: UserInfo!
    
    // MARK: - Private
    
    init(view: LoginView) {
        self.view = view
        self.router = LoginRouter(presentingViewController: view)
    }
    
    // MARK: - Input
    
    func didTapLoginUser(user: String, password: String) {
        self.interactor?.getLoginUser(user: user, password: password)
    }
    
    func loadUserInfo() {
        self.interactor.getUserStorage()
    }
    
    func showStatementView() {
        //self.interactor.saveUserInfo()
        self.router.showStatementView()
    }
    
    // MARK: - Output
    
    func setSucessLoginUser() {
        self.view?.setLoginView()
    }
    
    func setErrorLoginUser() {
        let alert = AlertModel(title: BankStrings.titleWarnning, textMessage: BankStrings.errorLogin,
                               titleButton: BankStrings.ok, style: .alert)
        self.view?.setErrorLogin(alertModel: alert)
    }
    
    func setLoginUser(user: String) {
        self.view.setLoginUser(user: user)
    }
    
    func setUserInfo(userInfo: UserInfo) {
        self.userInfo = userInfo
    }
}

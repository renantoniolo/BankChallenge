//
//  LoginView.swift
//  BankChallenge
//
//  Created by Renan Rocha on 25/05/21.
//

import UIKit

class LoginView: UIViewController {

    var presenter: LoginPresenter!
   
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var transView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutView()
        self.presenter.loadUserInfo()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let user = userTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        /*
        DispatchQueue.main.async {
            self.presenter?.didTapLoginUser(user: user, password: password)
            self.transView.isHidden = false
            self.loadActivityIndicator.startAnimating()
        }
        */
        self.presenter.showStatementView()
    }
    
    // MARK: - Private Methods
    
    private func layoutView(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        loginButton.layer.cornerRadius = 4
        transView.isHidden = true
        passwordTextField.delegate = self
    }
    
    func showAlertView(alertModel: AlertModel){
        let alert = UIAlertController(title: alertModel.title, message: alertModel.textMessage, preferredStyle: alertModel.style)
        alert.addAction(UIAlertAction(title: alertModel.titleButton, style: .default, handler: nil))
        
        present(alert,animated: true,completion: nil)
    }
    
    // MARK: - Input Methods
    
    func setLoginView(){
        DispatchQueue.main.async {
            self.transView.isHidden = true
            self.presenter.showStatementView()
        }
        self.presenter.showStatementView()
    }
    
    func setErrorLogin(alertModel: AlertModel) {
        DispatchQueue.main.async {
            self.transView.isHidden = true
            self.showAlertView(alertModel: alertModel)
        }
    }
    
    func setLoginUser(user: String) {
        userTextField.text = user
    }
}

extension LoginView : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let teste = passwordTextField.text
        
        if ((teste?.contains("@")) != nil) {
            print("ok")
        }
    }
}

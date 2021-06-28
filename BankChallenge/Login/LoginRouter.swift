//
//  LoginRouter.swift
//  BankChallenge
//
//  Created by Renan Rocha on 25/05/21.
//

import Foundation
import UIKit

class LoginRouter {
    
    let presentingViewController: UIViewController
    
    init(presentingViewController: UIViewController) {
          self.presentingViewController = presentingViewController
      }
    
    func showStatementView() {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        let viewState = StatementView(nibName: "StatementView", bundle: nil)
        let presenter = StatementPresenter(view: viewState)
        viewState.presenter = presenter
        let interactor = StatementInteractor(presenter: presenter)
        presenter.interactor = interactor
                
        navigationController.pushViewController(viewState, animated: true)
    }
}

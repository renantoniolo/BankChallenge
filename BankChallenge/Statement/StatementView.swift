//
//  StatementView.swift
//  BankChallenge
//
//  Created by Renan Rocha on 30/05/21.
//

import UIKit

class StatementView : UIViewController {
    
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var statementTableView: UITableView!
    @IBOutlet weak var loadActivityIndicator: UIActivityIndicatorView!
    
    var presenter: StatementPresenter!
    var userInfo: UserInfo!
    var statementsList: [Statement]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutView()
        self.loadStatementList()
    }
    
    @IBAction func didTapLogout() {
        self.presenter.getLogout()
    }
    
    // MARK: - Private Methods
    
    private func layoutView() {
        statementTableView.delegate = self
        statementTableView.dataSource = self
        statementTableView.separatorStyle = .none
        statementTableView.register(UINib(nibName: "StatementViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        
        guard let user = self.presenter.getUserInfo() else { return }
        self.nameLabel.text = user.name
        self.accountLabel.text = user.cpf
        self.moneyLabel.text = NumberFormatter().formatMonetPtBR(money: Int(user.saldo ?? 0))
    }
    
    private func loadStatementList() {
        DispatchQueue.main.async {
            self.presenter.loadStatementList()
            self.loadActivityIndicator.isHidden = false
            self.loadActivityIndicator.startAnimating()
        }
    }
    
    // MARK: - Input
    
    func setStatements(statements: Statements) {
        DispatchQueue.main.async {
            self.statementsList = statements.statement
            self.loadActivityIndicator.isHidden = true
            self.statementTableView.reloadData()
        }
    }
}

extension StatementView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statementsList?.count ?? 0
    }
}

extension StatementView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statementTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StatementViewCell
        let statement = self.statementsList?[indexPath.row]
        cell.configCell(statement: statement!)
        return cell
    }
}

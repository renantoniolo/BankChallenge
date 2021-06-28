//
//  BankRest.swift
//  BankChallenge
//
//  Created by Renan Rocha on 27/05/21.
//

import Foundation

class BankRest {
    
    // MARK: - Private Variaveis
    
    private let interactor: InteractorProtocol
    private let urlLogin = URL(string: "https://api.mobile.test.solutis.xyz/login")!
    private let urlStatement = URL(string: "https://6092aef785ff5100172136c2.mockapi.io/api/statements")!
    private let arr: [Statement] = []

    // MARK: - Private Methods
    init(interactor: InteractorProtocol) {
        self.interactor = interactor
    }
    
    private func requestBank(url: URL, type: TypeHttpMethod, paramets: [String], onComplete: @escaping (StatusInfo?) -> Void) {
        
        var request = URLRequest(url: url)
        
        request.setValue(
            "authToken",
            forHTTPHeaderField: "Authorization"
        )
        
        request.httpMethod = type == TypeHttpMethod.GET ? "GET" : "POST"
        
        if type == TypeHttpMethod.POST {
            let body = ["username":paramets[0],"password":paramets[1]]
            let bodyData = try? JSONSerialization.data(
                withJSONObject: body,
                options: []
            )
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyData)
         }
 
        // Create the HTTP request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    return
                }
                if(response.statusCode == 200 || response.statusCode == 201){
                  // Recebemos da api
                  guard let data = data else {return}
                  let status = StatusInfo(code: response.statusCode, status: "OK", data: data)
                  onComplete(status)
                }
                else {
                    let status = StatusInfo(code: response.statusCode, status: "ERROR", data: Data())
                    onComplete(status)
                }
            }
            else { // Error
                onComplete(nil)
            }
        }
        task.resume()
    }
}

extension BankRest : BankRestProtocol {
    func postLogin(paramets: [String]) {
        self.requestBank(url: urlLogin, type: TypeHttpMethod.POST, paramets: paramets) { (state) in
            if state?.status != "ERROR" {
                let data = state?.data
                do {
                    let user = try JSONDecoder().decode(UserInfo.self, from: data!)
                    self.interactor.returnUser(userInfo: user)
                   } catch {
                       print("Erro a receber: \(error.localizedDescription)")
                      self.interactor.returnUser(userInfo:nil)
               }
            } else {
                self.interactor.returnUser(userInfo:nil)
            }
        }
    }
    
    func getStatement() {
        self.requestBank(url: urlStatement, type: TypeHttpMethod.POST, paramets: []) { (state) in
            if state?.status != "ERROR"  {
                let data = state?.data
                do {
                    let statements = try JSONDecoder().decode(Statements.self, from: data!)
                    self.interactor.returnStatement(statements: statements)
                   } catch {
                       print("Erro a receber: \(error.localizedDescription)")
               }
            } else {
                self.interactor.returnStatement(statements: nil)
            }
        }
    }
}

//
//  NumberFormatterExtenssion.swift
//  BankChallenge
//
//  Created by Renan Rocha on 02/06/21.
//

import Foundation


extension NumberFormatter {
    
    func formatMonetPtBR(money: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        let text = formatter.string(from: NSNumber(value: money))
        return text ?? ""
    }
    
}

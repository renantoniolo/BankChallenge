//
//  StatementViewCell.swift
//  BankChallenge
//
//  Created by Renan Rocha on 02/06/21.
//

import UIKit

class StatementViewCell: UITableViewCell {

    @IBOutlet weak var descritionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(statement: Statement) {
        descritionLabel.text = statement.detail
        dateLabel.text = statement.date
        valueLabel.text = NumberFormatter().formatMonetPtBR(money: statement.value)
    }
    
}

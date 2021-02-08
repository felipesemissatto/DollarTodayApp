//
//  TextFieldsTableViewCell.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import UIKit

class TextFieldsTableViewCell: UITableViewCell {
    // MARK: -IBOutlets
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldTwitter: UITextField!
    @IBOutlet weak var textFieldInstagram: UITextField!
    
    // MARK: -Lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

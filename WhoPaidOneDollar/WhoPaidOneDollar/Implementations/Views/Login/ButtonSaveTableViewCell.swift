//
//  ButtonSaveTableViewCell.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import UIKit

class ButtonSaveTableViewCell: UITableViewCell {
    // MARK: -IBOutlets
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: -Lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
        saveButton.layer.cornerRadius = 8
    }
}

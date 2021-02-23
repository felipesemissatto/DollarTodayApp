//
//  CurrencyTableViewCell.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    // MARK: -IBOutlets
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var labelNameCurrency: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelSymbol: UILabel!
    
    // MARK: -Lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // View background
        viewBackground.layer.shadowColor = UIColor.black.cgColor
        viewBackground.layer.shadowOpacity = 0.25
        viewBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewBackground.layer.shadowRadius = 1
        viewBackground.layer.masksToBounds = false
        
        // Image flag
        imageViewFlag.clipsToBounds = true
        imageViewFlag.layer.cornerRadius = 0.5 * imageViewFlag.bounds.size.width
        imageViewFlag.contentMode = .scaleAspectFill
    }
}

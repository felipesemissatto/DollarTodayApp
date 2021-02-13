//
//  MessageTableViewCell.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    // MARK: -IBOutlets
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imageViewProfilePic: UIImageView!
    
    @IBOutlet weak var labelPersonName: UILabel!
    @IBOutlet weak var labelMessageDate: UILabel!
    @IBOutlet weak var labelTextMessage: UILabel!
    
    // MARK: -Lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // View background
        viewBackground.layer.shadowColor = UIColor.black.cgColor
        viewBackground.layer.shadowOpacity = 0.25
        viewBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewBackground.layer.shadowRadius = 1
        viewBackground.layer.masksToBounds = false
        
        // Image profile pic
        imageViewProfilePic.clipsToBounds = true
        imageViewProfilePic.layer.cornerRadius = 0.5 * imageViewProfilePic.bounds.size.width
        imageViewProfilePic.contentMode = .scaleAspectFill
    }
}

//
//  PhotoTableViewCell.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    // MARK: -IBOutlets
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var editPhotoButton: UIButton!
    
    
    // MARK: -Lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
        photoButton.clipsToBounds = true
        photoButton.layer.cornerRadius = 0.5 * photoButton.bounds.size.width
        photoButton.tag = 1
        editPhotoButton.tag = 1
    }
}


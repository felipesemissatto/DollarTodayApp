//
//  LoadingView.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 10/02/21.
//

import Foundation
import UIKit

class LoadingView: UIView {
    // MARK: - IBOutlets
    @IBOutlet weak var labelLoadingMessage: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    required init?(message: String, error: Bool, frame: CGRect) {
        super.init(frame: frame)

        if let nib = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil), let nibView = nib.first as? UIView {
            nibView.frame = bounds
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(nibView)
            
            labelLoadingMessage.text = message
            activityIndicator.startAnimating()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

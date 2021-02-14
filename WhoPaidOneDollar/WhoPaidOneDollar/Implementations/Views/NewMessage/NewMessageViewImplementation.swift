//
//  NewMessageViewImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 13/02/21.
//

import UIKit
import AuthenticationServices

class NewMessageViewImplementation: UIView, NewMessageViewProtocol {
    
    // MARK: -IBOutlet
    
    // MARK: - Dependencies
    var viewController: NewMessageViewControllerProtocol
    
    // MARK: - Init methods
    required init(viewController: NewMessageViewControllerProtocol) {
        self.viewController = viewController
        super.init(frame: CGRect.zero)
        initFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFromNib() {
        if let nib = Bundle.main.loadNibNamed("NewMessageViewImplementation", owner: self, options: nil),
           let nibView = nib.first as? UIView {
            nibView.frame = bounds
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(nibView)
        }
    }
    @IBAction func sendNewMessage(_ sender: Any) {
        print("nova message")
    }
    
}

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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var buttonSend: UIBarButtonItem!
    
    // MARK: - Dependencies
    var viewController: NewMessageViewControllerProtocol
    
    // MARK: - Init methods
    required init(viewController: NewMessageViewControllerProtocol) {
        self.viewController = viewController
        super.init(frame: CGRect.zero)
        initFromNib()
        
        buttonSend.isEnabled = false
        
        textView.delegate = self
        textView.text = "Write something..."
        textView.textColor = UIColor.lightGray
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
    
    // MARK: -IBAction Methods
    @IBAction func sendNewMessage(_ sender: Any) {
        print(textView.text)
    }
}

// MARK: - Extension Text View
extension NewMessageViewImplementation: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write something..."
            textView.textColor = UIColor.lightGray
            buttonSend.isEnabled = false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            buttonSend.isEnabled = true
        } else {
            buttonSend.isEnabled = false
        }
    }
}

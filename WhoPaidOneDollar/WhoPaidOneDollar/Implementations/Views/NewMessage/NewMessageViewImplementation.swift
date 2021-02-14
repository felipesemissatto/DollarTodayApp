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
        // Creating the person who sends the new message
        if let id = UserDefaults.standard.string(forKey: "id"),
           let name = UserDefaults.standard.string(forKey: "name"),
           let photoUrl = UserDefaults.standard.string(forKey: "photoUrlString"),
           let twitter = UserDefaults.standard.string(forKey: "twitter"),
           let instagram = UserDefaults.standard.string(forKey: "instagram"),
           let date = UserDefaults.standard.string(forKey: "date") {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateCreated = dateFormatter.date(from: date)!
            
            let person = Person(personId: CLong(truncating: Int(id)! as NSNumber),
                                name: name,
                                photoUrl: URL(string: photoUrl),
                                twitter: twitter,
                                instagram: instagram,
                                date: dateCreated as NSDate)
            
            let localDate = Date().get(.year) + "-" + Date().get(.month) + "-" + Date().get(.day)
            
            let textMessage = textView.text ?? "I paid one dollar!!"
            
            viewController.postNewMessage(person: person, date: localDate, textMessage: textMessage)
        }
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

//
//  InboxDetailViewModel.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 09/11/20.
//

import UIKit

struct InboxDetailViewModel {
    let email: Email
    
    var subjectMessage: NSAttributedString {
        let subject = NSMutableAttributedString(string: email.subject, attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
        
        return subject
    }
    
    var htmlMessage: String? {
        let subject = String(htmlEncodedString: email.message)
        
        return subject
    }
}

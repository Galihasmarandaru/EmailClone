//
//  EmailViewModel.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 06/11/20.
//

import UIKit

struct EmailViewModel {
    
    let email: Email
    
    var subjectText: NSAttributedString {
        let subject = NSMutableAttributedString(string: email.subject, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        return subject
    }
    
    var headlineText: NSAttributedString {
        let subject = NSMutableAttributedString(string: email.headline, attributes: [.font: UIFont.boldSystemFont(ofSize: 12)])
        
        return subject
    }
}

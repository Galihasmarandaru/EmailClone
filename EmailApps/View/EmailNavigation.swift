//
//  ListEmail.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 04/11/20.
//

import UIKit

class EmailNavigation: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red        
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 48, paddingRight: 16)
        profileImageView.setDimensions(width: 50, height: 50)
        profileImageView.layer.cornerRadius =  50 / 2
        
        view.addSubview(userText)
        userText.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 64, paddingLeft: 16)
        
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4
        
       return iv
    }()
    
    private let userText: UILabel = {
        let user = UILabel()
        user.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        user.textColor = .white
        user.numberOfLines = 0
        user.text = "galih.asmarandaru@gmail.com"
        
       return user
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 120)        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

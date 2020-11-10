//
//  CoverNavigationBar.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 05/11/20.
//

import UIKit

class CoverNavigationBar: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.8)
        
        return view
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 42)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


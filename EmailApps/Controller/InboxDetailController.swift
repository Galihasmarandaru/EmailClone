//
//  InboxDetailViewController.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 05/11/20.
//

import UIKit

protocol InboxMessageDelegate {
    func removeData()
}

class InboxDetailController: UIViewController {
    
    var delegate: InboxMessageDelegate!
    
    var headerView: InboxDetailContent!
    var dataPass: Email!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }    
    
    // MARK: Function
    func configureUI() {
        headerView = InboxDetailContent(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))        
        headerView.email = dataPass
        headerView.delegate = self
        view.addSubview(headerView)
    }
}

// MARK: - ProfileHeaderDelegate

extension InboxDetailController: InboxHeaderDelegate {
    func handleDelete() {
//        delegate.removeData()
        navigationController?.popViewController(animated: true)
    }
    
    func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
}

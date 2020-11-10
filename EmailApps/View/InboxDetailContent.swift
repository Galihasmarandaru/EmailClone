//
//  InboxDetail.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 05/11/20.
//

import UIKit

protocol InboxHeaderDelegate {
    func handleDismissal()
    func handleDelete()
}

class InboxDetailContent: UIView {
    
    var email: Email?{
        didSet { configure() }
    }
    
    var delegate: InboxHeaderDelegate!
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 52, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)
        
        let stack = UIStackView(arrangedSubviews: [undreadButton, deleteButton])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 10
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 52, paddingRight: 16)
        
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_white_24dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var undreadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "mail").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleUnread), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "trash-icon").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDelete), for: .touchUpInside)
        
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        return scroll 
    }()
    
    private lazy var containerContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(subjectOfEmail)
        subjectOfEmail.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingRight: 15)
        subjectOfEmail.setDimensions(width: frame.width, height: 50)

        view.addSubview(contentOfEmail)
        contentOfEmail.anchor(top: subjectOfEmail.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingRight: 15)
        contentOfEmail.setDimensions(width: frame.width, height: 500)

        return view
    }()
    
    private lazy var subjectOfEmail: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Subject"
        
        return label
    }()
    
    private lazy var contentOfEmail: UITextView = {
        let text = UITextView()

        text.font = UIFont.systemFont(ofSize: 14)
        text.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 100)
        
        addSubview(containerContentView)
        containerContentView.anchor(top: containerView.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
    
    @objc func handleUnread() {
        
    }
    
    @objc func handleDelete() {
        delegate?.handleDelete()
    }
    
    func configure() {
        guard let email = email else { return }
        let viewModel = InboxDetailViewModel(email: email)
        
        subjectOfEmail.attributedText = viewModel.subjectMessage
        contentOfEmail.text = viewModel.htmlMessage
    }
}

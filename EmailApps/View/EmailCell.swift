//
//  CellEmail.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 04/11/20.
//

import UIKit

protocol EmailCellDelegate: class {
    func handleEmailTapped(email: Email)
}

class EmailCell: UICollectionViewCell {
    
    var email: Email?{
        didSet { configure() }
    }
    
    weak var delegate: EmailCellDelegate?
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .lightGray
        
        return iv
    }()
    
    private let captionLabel: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some text caption"
        return label
    }()
    
    private let infoLabel = UILabel()
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleCellTapped))
        addGestureRecognizer(tap)
        isUserInteractionEnabled =  true
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 8)
        
        let stack = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.text = "Galih Asmarandaru @angaliha"
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Function
    @objc func handleCellTapped() {
        delegate?.handleEmailTapped(email: email!)
    }    
    
    func configure() {
        guard let email = email else { return }
        let viewModel = EmailViewModel(email: email)
        
        guard let url = URL(string: email.profile_image) else { return }
        let getTaskImage = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.profileImageView.image = image
            }
        }
        getTaskImage.resume()
        
        captionLabel.attributedText = viewModel.headlineText
        
        infoLabel.attributedText = viewModel.subjectText
    }
}

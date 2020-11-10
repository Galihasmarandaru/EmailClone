//
//  EmailViewController.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 05/11/20.
//

import UIKit

private let reuseIdentifier = "EmailCell"

class EmailController: UICollectionViewController {
    
    var listOfEmail = [Email]() {
        didSet {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
    }
    
    let headerView = EmailNavigation()
    let navigationBarView = CoverNavigationBar()
//    var inboxController: InboxDetailController!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeader()
        configureUI()
        fetchEmail()
        
//        inboxController = InboxDetailController()
//        inboxController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Function
    
    func fetchEmail() {
        APIAccess().getEmail { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let emails):
                self?.listOfEmail = emails
            }
        }
    }
    
    func configureHeader() {
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0)
        view.addSubview(headerView)
        
        navigationBarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0)
        view.addSubview(navigationBarView)
    }
    
    func configureUI() {
        collectionView.register(EmailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
    }
}

// MARK: UICollectionViewDataSource

extension EmailController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfEmail.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EmailCell
        
        cell.delegate = self
        cell.email = listOfEmail[indexPath.row]
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension EmailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: y-40)
    }
}


// MARK: - EmailCellDelegate

extension EmailController: EmailCellDelegate {    
    func handleEmailTapped(email: Email) {
        let controller = InboxDetailController()
        controller.hidesBottomBarWhenPushed = true
        controller.dataPass = email
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension EmailController: InboxMessageDelegate {
    func removeData() {
        print("Baca")
        
        //        APIAccess().deleteEmail()
        //        listOfEmail.remove(at: 0)
        //        collectionView.reloadData()
    }
}

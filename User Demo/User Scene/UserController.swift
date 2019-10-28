//
//  ViewController.swift
//  User Demo
//
//  Created by Akib Quraishi on 27/10/2019.
//  Copyright © 2019 AkibMakesApps. All rights reserved.
//

import UIKit

class UserController: BaseController {
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .gray)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()

   private let cellId = "UserCellId"
   private let presenter:UserPresenter = UserPresenter(userService: UserService())
   private var users = [UserViewData]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        self.navigationItem.title = "UK Users"
        collectionView.backgroundColor = .white
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset  = .init(top: 16, left: 16, bottom: 16, right: 16)
        
        presenter.attachView(view: self)
        presenter.fetchUsers()
    }


}


extension UserController:UserView {
    
    func startLoading() {
        DispatchQueue.main.async {
            self.view.addSubview(self.activityIndicatorView)
            self.activityIndicatorView.fillSuperview()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {self.activityIndicatorView.stopAnimating()}
    }
    
    func setUsers(users: [UserViewData]) {
        self.users = users
        DispatchQueue.main.async {self.collectionView.reloadData()}
    }
    
    func errorGettingUsers(errStr: String) {
        
    }
    
    func setEmptyUsers() {
        
    }
    
}


extension UserController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserCell
        
        let userDetails = users[indexPath.item]
        cell.userDetails = userDetails
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
}


extension UserController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 32, height: 100)
    }
}

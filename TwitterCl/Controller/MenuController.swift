//
//  MenuController.swift
//  TwitterCl
//
//  Created by Abdullah on 28/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit
import SDWebImage

class MenuController: UIViewController {
    //MARK: - Properties
    
    var tableView: UITableView!
    
    var delegate: MainTabControllerDelegate?
    
    private let reuseIdentifier = "MenuOptionCell"
    
    var user: User?
    
    let userImageView: UIImageView = {

        let view = UIImageView()
        view.backgroundColor = UIColor(named: "twitterBlue")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 75).isActive = true
        view.widthAnchor.constraint(equalToConstant: 75).isActive = true
        view.layer.cornerRadius = 75/2
        view.clipsToBounds = true
        return view
    }()
    
    let fullNameView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.setDimensions(width: 250, height: 30)
        return label
    }()
    
    let userNameView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.setDimensions(width: 250, height: 30)
        return label
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    init(user: User?) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Handlers
    
    func configureTableView() {
        
        let userDataView = UIView()
        userDataView.backgroundColor = UIColor(named: "twitterBlue")
        userImageView.sd_setImage(with: user?.profileImageUrl, completed: nil)
        userDataView.addSubview(userImageView)
        userImageView.leftAnchor.constraint(equalTo: userDataView.leftAnchor, constant: 20).isActive = true
        userImageView.topAnchor.constraint(equalTo: userDataView.topAnchor, constant: 50).isActive = true
        
        fullNameView.text = user?.fullname
        userDataView.addSubview(fullNameView)
        fullNameView.leftAnchor.constraint(equalTo: userDataView.leftAnchor, constant: 20).isActive = true
        fullNameView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10).isActive = true
        
        userNameView.text = "@" + (user?.username ?? "")
        userDataView.addSubview(userNameView)
        userNameView.leftAnchor.constraint(equalTo: userDataView.leftAnchor, constant: 20).isActive = true
        userNameView.topAnchor.constraint(equalTo: fullNameView.bottomAnchor, constant: 10).isActive = true
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        userDataView.addSubview(dividerView)
        dividerView.anchor(left: userDataView.leftAnchor, bottom: userDataView.bottomAnchor, right: userDataView.rightAnchor, paddingLeft: 15, paddingRight: 95, height: 0.75)

        
        view.addSubview(userDataView)
        userDataView.translatesAutoresizingMaskIntoConstraints = false
        userDataView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        userDataView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        userDataView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        userDataView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        //---------------------------------------------------------------------//
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor(named: "twitterBlue")
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: userDataView.bottomAnchor).isActive = true
    }
    
    func reset() {
        userImageView.image = nil
        userNameView.text = nil
        fullNameView.text = nil
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.selectionStyle = .none
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}

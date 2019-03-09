//
//  ViewController.swift
//  vctotableviewdata
//
//  Created by Max Nelson on 3/9/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class ItemsController: UITableViewController {
    
    fileprivate let CELL_ID: String = "CELL_ID"
    var amount:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath)
        cell.textLabel?.text = "second tableVC amount: \(self.amount)"
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

class AddCellViewController:UIViewController {

    
    @objc fileprivate func handleAdd() {
        let con = UIApplication.shared.keyWindow?.rootViewController as? CustomController
        con?.amount += 1
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate let addButton:UIButton = {
        let add = UIButton()
        add.translatesAutoresizingMaskIntoConstraints = false
        add.setTitle("+1", for: .normal)
        add.backgroundColor = .blue
        add.layer.cornerRadius = 8
        return add
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(addButton)
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }
}


class ViewController: UITableViewController {
    
    fileprivate let CELL_ID: String = "CELL_ID"
    var amount:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
    }

    fileprivate func presentNewViewController() {
        let vc = AddCellViewController()
        present(vc, animated: true, completion: nil)
    }
    
    // MARK:- DELEGATE METHODS
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentNewViewController()
    }
    
    // MARK:- DATA SOURCE METHODS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.textLabel?.text = "first tableVC amount: \(self.amount)"
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}




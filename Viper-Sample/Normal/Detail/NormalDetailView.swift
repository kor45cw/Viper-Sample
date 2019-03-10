//
//  NormalDetailView.swift
//  Viper-Sample
//
//  Created by 손창우 on 04/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class NormalDetailView: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }

    var presenter: NormalDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension NormalDetailView: NormalDetailViewProtocol {
    func showError() {
        let controller = UIAlertController(title: "ERROR", message: "ERROR", preferredStyle: .alert)
        self.present(controller, animated: true, completion: nil)
    }
    
    func updateData() {
        self.tableView.reloadData()
    }
}

extension NormalDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = presenter?[indexPath.item]?.title
        return cell
    }
}

extension NormalDetailView: UITableViewDelegate {
    
}

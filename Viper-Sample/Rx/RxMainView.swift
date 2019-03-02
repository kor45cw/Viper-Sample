//
//  RxMainView.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxMainView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var presenter: RxMainPresenterProtocol!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        presenter.didItemsChange.drive(tableView.rx.items) { [weak self] (tableView, row, element) in
            guard let self = self else { return UITableViewCell() }
            let indexPath = IndexPath(row: row, section: 0)
            return self.configureCell(indexPath: indexPath, item: element)
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(MainEntity.self).asDriver()
            .drive(onNext: { [weak self] value in
                self?.presenter.showDetails(for: value)
            }).disposed(by: disposeBag)
    }
    
    private func configureCell(indexPath: IndexPath, item: MainEntity) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.rawValue.uppercased()
        return cell
    }
}

extension RxMainView: RxMainViewProtocol {
    
}

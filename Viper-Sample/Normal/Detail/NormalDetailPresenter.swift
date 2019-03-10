//
//  NormalDetailPresenter.swift
//  Viper-Sample
//
//  Created by 손창우 on 04/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import Foundation

class NormalDetailPresenter: NormalDetailPresenterProtocol {
    var view: NormalDetailViewProtocol?
    var interactor: NormalDetailInteractorInputProtocol?
    var router: NormalDetailRouterProtocol?
    var items: [Post]?
    
    func viewDidLoad() {
        interactor?.fetchDatas()
    }
    
    func showDetails(for item: MainEntity) {
        
    }
    
    var itemCount: Int {
        return items?.count ?? 0
    }
    
    subscript(index: Int) -> Post? {
        guard let items = items, !items.isEmpty && (items.count > index) else { return nil }
        return items[index]
    }
}

extension NormalDetailPresenter: NormalDetailInteractorOutputProtocol {
    func loadOnError() {
        view?.showError()
    }
    
    func loadFinished(_ result: [Post]) {
        self.items = result
        view?.updateData()
    }
}

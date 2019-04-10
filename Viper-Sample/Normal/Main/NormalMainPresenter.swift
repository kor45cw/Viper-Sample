//
//  NormalMainPresenter.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class NormalMainPresenter: NormalMainPresenterProtocol {
    var view: NormalMainViewProtocol?
    var interactor: NormalMainInteractorInputProtocol?
    var router: NormalMainRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchDatas()
    }
    
    func showDetails(for item: MainEntity) {
        router?.presentPostDetailScreen(from: view!, for: item)
    }
}

extension NormalMainPresenter: NormalMainInteractorOutputProtocol {
    func loadOnError() {
        // Error
    }
    
    func loadFinished(with datas: [MainEntity]) {
        view?.showDatas(with: datas)
    }
}

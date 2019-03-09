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
    
    func viewDidLoad() {
        
    }
    
    func showDetails(for item: MainEntity) {
        
    }
}

extension NormalDetailPresenter: NormalDetailInteractorOutputProtocol {
    func loadOnError() {
        
    }
    
    func loadFinished() {
        
    }
}

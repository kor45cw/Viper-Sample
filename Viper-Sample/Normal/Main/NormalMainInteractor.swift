//
//  NormalMainInteractor.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class NormalMainInteractor: NormalMainInteractorInputProtocol {
    var presenter: NormalMainInteractorOutputProtocol?
    
    func fetchDatas() {
        // Load Data
        presenter?.loadFinished(with: MainEntity.allCases)
    }
}

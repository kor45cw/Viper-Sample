//
//  NormalDetailView.swift
//  Viper-Sample
//
//  Created by 손창우 on 04/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class NormalDetailView: UIViewController {

    var presenter: NormalDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NormalDetailView: NormalDetailViewProtocol {
    
}

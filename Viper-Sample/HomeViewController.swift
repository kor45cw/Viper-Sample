//
//  HomeViewController.swift
//  Viper-Sample
//
//  Created by 손창우 on 26/02/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showNormal(_ sender: UIButton) {
        let normalVersion = NormalMainRouter.createModule()
        self.navigationController?.pushViewController(normalVersion, animated: true)
    }
    
    @IBAction func showRx(_ sender: UIButton) {
        let rxVersion = RxMainRouter.createModule()
        self.navigationController?.pushViewController(rxVersion, animated: true)
    }
}


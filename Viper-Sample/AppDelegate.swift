//
//  AppDelegate.swift
//  Viper-Sample
//
//  Created by 손창우 on 26/02/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

// VIPER 구성요소
// View: 사용자에게 앱 interface를 표시하고 응답을 얻는 코드가 있는 클래스
// Interactor: 앱의 비즈니스 로직 담당, 주로 API 콜을 담당, 데이터를 호출할 책임이 있지만 스스로 구현될 필요는 없다.
// Presenter: 중심, View에서 사용자의 응답을 얻고 그에 따라 작동, 다른 모든 구성요소와 통신한다.
// Entity: interactor에서 사용하는 모델 클래스
// Router(WireFrame): 화면전환, presenter로부터 어떤 화면을 표시하고 실행할지 듣습니다.


// VIPER 구현의 프로토콜 설명
// ViewProtocol: Presenter를 통해 UI의 변경 사항을 View에 반영
// PresenterProtocol: View를 통해 획득 되는 반응을 처리 (& Binding rx에서는)
// InteractorInputProtocol: Presenter가 비즈니스 로직을 전달하는 것을 구현
// InteractorOutputProtocol: Interactor를 통해 변경된 결과를 다시 Presenter로 전달하는 것으로 구성
// RouterProtocol: View를 생성하고, 다른 뷰로 화면 전환 하는 것을 구현

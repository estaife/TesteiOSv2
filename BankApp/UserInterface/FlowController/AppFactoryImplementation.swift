//
//  AppFactoryImplementation.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit
import Domain
import Presenter
import Validator
import Data
import Networking

public class AppFactoryImplementation: AppFactory {
    
    public init() { }
    
    public func makeLoginViewController() -> LoginViewController {
        let endpoint: AuthClientEndpoint = .login
        guard let url = endpoint.url else { return LoginViewController() }
        
        let loginVC = LoginViewController()
        let userNameValidate = UserNameValidate()
        let passwordValidate = PasswordValidate()
        let authClientUseCase = AuthClientUseCase(url: url, httpClient: AlamofireAdapter())
        let authPresenter = AuthUserPresenter(alertView: loginVC, loadingView: loginVC, userNameValidate: userNameValidate, passwordValidate: passwordValidate, authClientUseCase: authClientUseCase, router: loginVC)
        loginVC.loginBlock = authPresenter.auth
        
        return loginVC
    }
    
    public func makeBalanceViewController() -> UIViewController {
        return BalanceViewController()
    }
}

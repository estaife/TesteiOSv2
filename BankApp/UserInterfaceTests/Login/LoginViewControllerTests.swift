//
//  UserInterfaceTests.swift
//  UserInterfaceTests
//
//  Created by Estaife Lima on 05/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
@testable import UserInterface
import Presenter
import Domain

import UIKit

class LoginViewControllerTests: XCTestCase {

    func testifHiddenLoadingViewWhenStart() throws {
        //Given
        let sut = LoginViewController()
        
        //When
        sut.loadViewIfNeeded()
        
        //Then
        XCTAssertEqual(sut.isLoading, false)
    }
    
    func testLoginViewControllerConformToLoadingViewProtocol() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        
        //When
        let comformToLoadingViewProtocol = sut as LoadingViewProtocol
         
        //Then
        XCTAssertNotNil(comformToLoadingViewProtocol)
    }
    
    func testLoginViewControllerConformToAlertViewProtocol() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        
        //When
        let comformToAlertViewProtocol = sut as AlertViewProtocol
         
        //Then
        XCTAssertNotNil(comformToAlertViewProtocol)
    }
    
    func testLoginButtonDidTap() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        var callLogin = false
        
        //When
        sut.loginClousure = { viewModel in
            callLogin = true
        }
        sut.simulateTap()
         
        //Then
        XCTAssertEqual(callLogin, true)
    }
    
    func testLoginButtonWhenTapped() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        var callLogin = false
        
        //When
        sut.loginClousure = { viewModel in
            callLogin = true
        }
        sut.simulateTap()
         
        //Then
        XCTAssertEqual(callLogin, true)
    }
    
    func testLoginButtonWhenTappedWithCorretViewModel() throws {
        //Given
        let sut: LoginViewController = LoginViewController()
        let loginViewModel = AuthUserViewModel(userName: sut.userText, password: sut.passwordText)
        var loginViewModelReceived: AuthUserViewModel?
        
        //When
        sut.loginClousure = { loginViewModelReceived = $0 }
        sut.simulateTap()
         
        //Then
        XCTAssertEqual(loginViewModel, loginViewModelReceived)
    }
}

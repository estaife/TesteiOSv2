//
//  AlertView.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public struct AlertViewModel: Equatable {
    public var title: String
    public var message: String
}

public protocol AlertViewProtocol {
    func presentMessageWith(_ viewModel: AlertViewModel)
}

//
//  ViewModel.swift
//  DING!
//
//  Created by Febrian Daniel on 16/02/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var currentDisplayScreen: DisplayScreen = .mainMenu
    @Published var isDisabled = false
}

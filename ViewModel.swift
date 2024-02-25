//
//  ViewModel.swift
//  DING!
//
//  Created by Febrian Daniel on 16/02/24.
//

import Foundation

enum SoalPractice {
    case soal1
    case soal2
    case soal3
}

class ViewModel: ObservableObject {
    @Published var currentDisplayScreen: DisplayScreen = .mainMenu
    @Published var isDisabled = false
    @Published var currentPractice: SoalPractice = .soal1
}

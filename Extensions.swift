//
//  Extensions.swift
//  DING!
//
//  Created by Febrian Daniel on 16/02/24.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("background")
    static let ungu = Color("ungu")
    static let disabledGray = Color("disabledGray")
}

struct MainMenuButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 50)).fontWidth(.condensed).fontWeight(.medium)
            .frame(width: 239, height: 84)
            .foregroundStyle(.black)
            .background(Color.ungu)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            }
            .shadow(radius: 5, x: 0, y: 4)
    }
}

struct StartPracticeButton: ButtonStyle {
    @EnvironmentObject var vm: ViewModel
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title).fontWidth(.condensed).fontWeight(.medium)
            .frame(width: 221, height: 57)
            .foregroundStyle(.black)
            .background(vm.isDisabled ? Color.ungu : Color.disabledGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            }
            .shadow(radius: vm.isDisabled ? 5 : 0, x: 0, y: vm.isDisabled ? 4 : 0)
    }
}

struct StartButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title).fontWidth(.condensed).fontWeight(.medium)
            .frame(width: 137, height: 57)
            .foregroundStyle(.black)
            .background(Color.ungu)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            }
            .shadow(radius: 5, x: 0, y: 4)
    }
}



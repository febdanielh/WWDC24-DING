//
//  MainMenu.swift
//  WWDC24
//
//  Created by Febrian Daniel on 16/02/24.
//

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Image("ombak belakang")
                .offset(y: 250)
            Image("ombak depan")
                .offset(y: 270)
            Image("ombak depan banget")
                .offset(y: 320)
            VStack {
                HStack() {
                    ZStack {
                        Image("gelas")
                        Image("sendok")
                            .offset(x: 110, y: -110)
                        Image("impact")
                            .offset(y: -140)
                    }
                    Text("DING!")
                        .fontWidth(.condensed).font(.system(size: 120)).bold()
                }.offset(x: -30)
                
                Button("START"){
                    print("pressed")
                    vm.currentDisplayScreen = .allView
                }.buttonStyle(MainMenuButton())
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    MainMenu()
}

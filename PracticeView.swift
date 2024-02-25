//
//  PracticeView.swift
//  DING!
//
//  Created by Febrian Daniel on 20/02/24.
//

import SwiftUI

struct PracticeView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(spacing: 40) {
                Text("Let's try it out!").font(.system(size: 48)).bold()
                Text("In this practice, you will hear a series of sounds, produced by the glass and water! \n You will try to memorize those notes and recreate the sound by tapping the glasses given!")
                    .multilineTextAlignment(.center).font(.title).padding().padding(.horizontal)
                
                Text("Don't worry, you can reset your answer if you want to change it! \n\nLet's go!")
                    .multilineTextAlignment(.center).font(.title).padding().padding(.horizontal).bold()
                
                Button("Start"){
                    print("pressed")
                    vm.currentDisplayScreen = .insidePractice
                }.buttonStyle(StartButton()).padding(.top, 50)
            }
        }
    }
}

#Preview {
    //    PracticeView()
    PracticeInsideView().environmentObject(ViewModel())
}


struct PracticeInsideView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            
            switch vm.currentPractice {
            case .soal1:
                Soal1()
            case .soal2:
                Soal2()
            case .soal3:
                Soal3()
            }
        }
    }
}

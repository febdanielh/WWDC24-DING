//
//  PracticeView.swift
//  DING!
//
//  Created by Febrian Daniel on 20/02/24.
//

import SwiftUI

struct PracticeView: View {
    @EnvironmentObject var vm: ViewModel
    @State var isStarted = false
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(spacing: 40) {
                if !isStarted {
                    Text("Let's try it out!").font(.system(size: 48)).bold()
                    Text("In this practice, you will hear a sound that indicates a note, produced by the glass and water! \nYou will given options of glasses and different amout of water, and your job is to choose the correct option that produce the same sound/note!")
                        .multilineTextAlignment(.center).font(.title).padding().padding(.horizontal)
                    Image("sound")
                    Text("Press this button to hear the sound!").font(.title).bold()
                    Button("Start"){
                        print("pressed")
                        isStarted = true
                    }.buttonStyle(StartButton()).padding(.top, 50)
                } else {
                    PracticeInsideView()
                }
            }
        }
    }
}

#Preview {
    PracticeView()
//    PracticeInsideView()
}


struct PracticeInsideView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Let's try it out!").font(.system(size: 48)).bold()
            HStack(spacing: 50) {
                Button (action: {
                }, label: {
                    Image("sound")
                })
                Text("Press the button to hear the note!").font(.title).italic()
            }
        }
    }
}

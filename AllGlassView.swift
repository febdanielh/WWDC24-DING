//
//  AllGlassView.swift
//  DING!
//
//  Created by Febrian Daniel on 16/02/24.
//

import SwiftUI

struct AllGlassView: View {
    @State private var showView = false
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(){
                if !showView {
                    Text("How does it work?")
                        .font(.system(size: 48)).bold().padding(.bottom, 45)
                    HStack(spacing: 30) {
                        Image("isi 30%")
                        Image("isi 45%")
                        Image("isi 60%")
                        Image("isi 75%")
                        Image("isi 90%")
                    }.padding(.vertical, 60)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            showView = true
                        }, label: {
                            Image("next").padding(.trailing, 100)
                        })
                    }.padding(.top, 41)
                } else {
                    ExplainationView()
                }
            }
        }
    }
}

#Preview {
    //    AllGlassView()
    ExplainationView().environmentObject(ViewModel())
}

struct ExplainationView: View {
    
    private let isiGelas = ["isi 90%", "isi 75%", "isi 60%", "isi 45%", "isi 30%" ]
    
    @State private var currentIndex = 0
    @EnvironmentObject var vm: ViewModel
    
    var explainText = "When you tap the glass of water with a spoon or pencil, the water molecules vibrate and make a sound through the water, that we can hear. Different amount of water in the glass will produce different sounds. More water will produce lower pitch sound, and less water will produce higher pitch sound. \n\nWhen a glass is filled with little to no water, it has lots of air in it. This cause the glass to vibrate quickly, and produce higher pitch sound. On the other hand, more water means less air in the glass. It causes the glass to vibrate slower, and producing lower pitch sound. This is why the glass with the most water will have the lowest pitch and the glass with the least water will have highest."
    
    var body: some View {
        VStack {
            Text("How does it work?")
                .font(.system(size: 48)).bold()
            HStack(spacing: 170) {
                VStack(spacing: 30) {
                    Button (action: {
                        switch currentIndex {
                        case 0:
                            SoundManager.instance.playSound(sound: .doo)
                        case 1:
                            SoundManager.instance.playSound(sound: .re)
                        case 2:
                            SoundManager.instance.playSound(sound: .mi)
                        case 3:
                            SoundManager.instance.playSound(sound: .fa)
                        case 4:
                            SoundManager.instance.playSound(sound: .sol)
                        default:
                            break
                        }
                    }, label: {
                        Image(isiGelas[currentIndex])
                    })
                    
                    Text("Try tapping the glass!").font(.title2).bold().italic()
                    
                    if currentIndex == 0 {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                currentIndex += 1
                            }, label: {
                                Image("next")
                            })
                        }.frame(width: 244)
                    } else if currentIndex > 0 && currentIndex < isiGelas.count-1{
                        HStack {
                            Button(action: {
                                currentIndex -= 1
                            }, label: {
                                Image("prev")
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                currentIndex += 1
                            }, label: {
                                Image("next")
                            })
                        }.frame(width: 244)
                    } else {
                        HStack {
                            Button(action: {
                                currentIndex -= 1
                            }, label: {
                                Image("prev")
                            })
                            
                            Spacer()
                        }
                        .frame(width: 244)
                        .onAppear(perform: {
                            vm.isDisabled = true
                        })
                    }
//                    
//                    Button (action: {
//                    }, label: {
//                        Image("sound")
//                    })
                }.padding(.vertical)
                
                VStack {
                    Text(explainText).font(.system(size: 26))
                        .frame(width: 522).padding(.bottom, 50)
                    
                    HStack{
                        Spacer()
                        Button("Start Practice") {
                            vm.currentDisplayScreen = .practiceView
                        }.buttonStyle(StartPracticeButton())
                            .disabled(!vm.isDisabled)
                    }.frame(width: 522)
                }
            }
            .padding(.vertical)
        }
    }
}

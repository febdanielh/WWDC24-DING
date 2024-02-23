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
                        Image("isi 15%")
                        Image("isi 30%")
                        Image("isi 45%")
                        Image("isi 60%")
                        Image("isi 75%")
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
    
    private let isiGelas = ["isi 15%", "isi 30%", "isi 45%", "isi 60%", "isi 75%", "isi 90%"]
    
    @State private var currentIndex = 0
    @EnvironmentObject var vm: ViewModel
    
    var explainText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    
    var body: some View {
        VStack {
            Text("How does it work?")
                .font(.system(size: 48)).bold()
            HStack(spacing: 170) {
                VStack(spacing: 58) {
                    Image(isiGelas[currentIndex])
                    
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

//
//  Soal.swift
//  DING!
//
//  Created by Febrian Daniel on 25/02/24.
//

import SwiftUI

struct Soal1: View {
    
    @State private var jawaban1: [Int] = []
    let soal1: [Int] = [3, 2, 1, 2, 3, 3, 3]
    
    @State private var presentSheetBenar = false
    @State private var presentSheetSalah = false
    @State private var isBenar = false
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Practice #1").font(.system(size: 48)).bold()
            
            HStack(spacing: 50) {
                Button (action: {
                    SoundManager.instance.playSoundSoal(sound: .soal1)
                }, label: {
                    Image("sound")
                })
                Text("Press the button to hear the notes!").font(.title).italic()
            }
            
            HStack (spacing: 40) {
                Button (action: {
                    SoundManager.instance.playSound(sound: .doo)
                    jawaban1.append(1)
                    print(jawaban1)
                }, label: {
                    Image("isi 30%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .re)
                    jawaban1.append(2)
                    print(jawaban1)
                }, label: {
                    Image("isi 45%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .mi)
                    jawaban1.append(3)
                    print(jawaban1)
                }, label: {
                    Image("isi 60%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .fa)
                    jawaban1.append(4)
                    print(jawaban1)
                }, label: {
                    Image("isi 75%")
                })
            }
            
            HStack (spacing: 120){
                Button("Reset") {
                    jawaban1.removeAll()
                    print(jawaban1)
                }.buttonStyle(StartButton())
                
                Button("Submit") {
                    if jawaban1 == soal1{
                        presentSheetBenar = true
                        isBenar = true
                        print(isBenar)
                        jawaban1.removeAll()
                    } else {
                        presentSheetSalah = true
                        isBenar = false
                        print(isBenar)
                        jawaban1.removeAll()
                    }
                }.buttonStyle(StartButton())
            }
            .padding()
            .sheet(isPresented: $presentSheetBenar, content: {
                ZStack {
                    Color.background
                    VStack(spacing: 30) {
                        Text("You're right!").font(.system(size: 80)).bold()
                        Text("Let's try another one, shall we?")
                            .font(.system(size: 40)).fontWeight(.medium).padding()
                            .multilineTextAlignment(.center)
                        Button("Next"){
                            vm.currentPractice = .soal2
                        }.buttonStyle(StartButton()).padding()
                    }
                }
            })
            .sheet(isPresented: $presentSheetSalah, content: {
                ZStack {
                    Color.background
                    VStack(spacing: 30) {
                        Text("Almost there!").font(.system(size: 80)).bold()
                        Text("Let's try again!")
                            .font(.system(size: 40)).fontWeight(.medium).padding()
                            .multilineTextAlignment(.center)
                    }
                }
            })
        }
    }
}

struct Soal2: View {
    
    @State private var jawaban2: [Int] = []
    let soal2: [Int] = [1, 1, 2, 1, 4, 3]
    
    @State private var presentSheetBenar = false
    @State private var presentSheetSalah = false
    @State private var isBenar = false
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Practice #2").font(.system(size: 48)).bold()
            
            HStack(spacing: 50) {
                Button (action: {
                    SoundManager.instance.playSoundSoal(sound: .soal2)
                }, label: {
                    Image("sound")
                })
                Text("Press the button to hear the notes!").font(.title).italic()
            }
            
            HStack (spacing: 40) {
                Button (action: {
                    SoundManager.instance.playSound(sound: .doo)
                    jawaban2.append(1)
                    print(jawaban2)
                }, label: {
                    Image("isi 30%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .re)
                    jawaban2.append(2)
                    print(jawaban2)
                }, label: {
                    Image("isi 45%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .mi)
                    jawaban2.append(3)
                    print(jawaban2)
                }, label: {
                    Image("isi 60%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .fa)
                    jawaban2.append(4)
                    print(jawaban2)
                }, label: {
                    Image("isi 75%")
                })
            }
            
            HStack (spacing: 120){
                Button("Reset") {
                    jawaban2.removeAll()
                    print(jawaban2)
                }.buttonStyle(StartButton())
                
                Button("Submit") {
                    if jawaban2 == soal2 {
                        presentSheetBenar = true
                        isBenar = true
                        jawaban2.removeAll()
                    } else {
                        presentSheetSalah = true
                        isBenar = false
                        jawaban2.removeAll()
                    }
                }.buttonStyle(StartButton())
            }
            .padding()
            .sheet(isPresented: $presentSheetBenar, content: {
                ZStack {
                    Color.background
                    VStack(spacing: 30) {
                        Text("Spot On!").font(.system(size: 80)).bold()
                        Text("Let's keep going!")
                            .font(.system(size: 40)).fontWeight(.medium).padding()
                            .multilineTextAlignment(.center)
                        Button("Next"){
                            vm.currentPractice = .soal3
                        }.buttonStyle(StartButton()).padding()
                    }
                }
            })
            .sheet(isPresented: $presentSheetSalah, content: {
                ZStack {
                    Color.background
                    VStack(spacing: 30) {
                        
                        Text("Almost there!").font(.system(size: 80)).bold()
                        Text("Let's try again!")
                            .font(.system(size: 40)).fontWeight(.medium).padding()
                            .multilineTextAlignment(.center)
                    }
                }
            })
        }
    }
}

struct Soal3: View {
    @State private var jawaban3: [Int] = []
    let soal3: [Int] = [1, 3, 2, 5, 4, 3, 5, 1]
    
    @State private var presentSheetBenar = false
    @State private var presentSheetSalah = false
    @State private var isBenar = false
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Practice #3").font(.system(size: 48)).bold()
            
            HStack(spacing: 50) {
                Button (action: {
                    SoundManager.instance.playSoundSoal(sound: .soal3)
                }, label: {
                    Image("sound")
                })
                Text("Press the button to hear the notes!").font(.title).italic()
            }
            
            HStack (spacing: 40) {
                Button (action: {
                    SoundManager.instance.playSound(sound: .doo)
                    jawaban3.append(1)
                    print(jawaban3)
                }, label: {
                    Image("isi 30%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .re)
                    jawaban3.append(2)
                    print(jawaban3)
                }, label: {
                    Image("isi 45%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .mi)
                    jawaban3.append(3)
                    print(jawaban3)
                }, label: {
                    Image("isi 60%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .fa)
                    jawaban3.append(4)
                    print(jawaban3)
                }, label: {
                    Image("isi 75%")
                })
                
                Button (action: {
                    SoundManager.instance.playSound(sound: .sol)
                    jawaban3.append(5)
                    print(jawaban3)
                }, label: {
                    Image("isi 90%")
                })
            }
            
            HStack (spacing: 120){
                Button("Reset") {
                    jawaban3.removeAll()
                    print(jawaban3)
                }.buttonStyle(StartButton())
                
                Button("Submit") {
                    if jawaban3 == soal3 {
                        presentSheetBenar = true
                        isBenar = true
                        jawaban3.removeAll()
                    } else {
                        presentSheetSalah = true
                        isBenar = false
                        jawaban3.removeAll()
                    }
                }.buttonStyle(StartButton())
            }
            .padding()
            .sheet(isPresented: $presentSheetBenar, content: {
                ZStack {
                    Color.background
                    VStack(spacing: 30) {
                        Text("Incredible!").font(.system(size: 80)).bold()
                        Text("Thanks for playing!")
                            .font(.system(size: 40)).fontWeight(.medium).padding()
                            .multilineTextAlignment(.center)
                        
                        Button("Home"){
                            vm.currentDisplayScreen = .mainMenu
                        }.buttonStyle(StartButton()).padding()
                    }
                }
            })
            .sheet(isPresented: $presentSheetSalah, content: {
                ZStack {
                    Color.background
                    VStack(spacing: 30) {
                        Text("Almost there!").font(.system(size: 80)).bold()
                        Text("Let's try again!")
                            .font(.system(size: 40)).fontWeight(.medium).padding()
                            .multilineTextAlignment(.center)
                    }
                }
            })
        }
    }
}

#Preview {
    Soal3().environmentObject(ViewModel())
}

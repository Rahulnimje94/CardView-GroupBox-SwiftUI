//
//  ContentView.swift
//  SwiftUI_CardView
//
//  Created by Rahul on 17/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Rectangle().foregroundStyle(.gray.gradient.opacity(0.8)).ignoresSafeArea()
        VStack(spacing: 40) {
            GroupBox("My Content") {
                Text("This is my groupbox.Isn't it cool. It's like a card view. Awesome!")
            }.frame(width: 240)
                .groupBoxStyle(.music)
            
            GroupBox {
                GroupBox {
                    MusicPlayerView()
                }
                .groupBoxStyle(.music)
            } label: {
                Label("Now Playing", systemImage: "music.note")
            }
            .groupBoxStyle(.music)
            
        }.padding()
    }
    }
}

#Preview {
    ContentView()
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}

struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label.bold()
                .foregroundStyle(.pink)
            configuration.content
        }.padding().background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

struct MusicPlayerView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8.0).frame(width: 50, height: 50).foregroundStyle(.secondary)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool song title").font(.headline.bold())
                    
                    Text("Artist name").font(.footnote).foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            .padding(.bottom, 8)
            
            ProgressView(value: 0.4, total: 1).tint(.secondary).padding(.bottom, 20)
            
            HStack(spacing: 30) {
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "forward.fill")
            }.foregroundStyle(.secondary).font(.title)
        }
    }
}

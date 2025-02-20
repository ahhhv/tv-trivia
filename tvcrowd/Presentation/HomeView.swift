//
//  HomeView.swift
//  tvcrowd
//
//  Created by Alex Hernández on 18/2/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
   
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Trivia de Series")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                VStack(spacing: 15) {
                    ForEach(Constants.gameInfo) { game in
                        NavigationLink {
                            TriviaView(viewModel: viewModel, type: game.type)
                        } label: {
                            HStack {
                                Image(systemName: game.icon)
                                    .font(.title2)
                                Text(game.title)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                HStack(spacing: 30) {
                    NavigationLink(destination: Text("Ranking")) {
                        VStack {
                            Image(systemName: "trophy.fill")
                                .font(.title)
                            Text("Ranking")
                                .font(.footnote)
                        }
                    }
                    
                    NavigationLink(destination: Text("Logros")) {
                        VStack {
                            Image(systemName: "star.fill")
                                .font(.title)
                            Text("Logros")
                                .font(.footnote)
                        }
                    }
                    
                    NavigationLink(destination: Text("Configuración")) {
                        VStack {
                            Image(systemName: "gearshape.fill")
                                .font(.title)
                            Text("Ajustes")
                                .font(.footnote)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeView()
}



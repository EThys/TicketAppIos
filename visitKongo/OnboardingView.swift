//
//  OnboardingView.swift
//  visitKongo
//
//  Created by Muzola Ethberg on 22/03/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var isNavigatingToLogin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.red.opacity(1.5), Color.gray.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    TabView(selection: $currentPage) {
                        OnboardingPage(
                            imageName: "\(R.image.send.name)",
                            title: "Clôturez votre journée en 2 minutes",
                            description: "Envoyez votre rapport quotidien en quelques clics, même depuis votre mobile, et quittez le site l’esprit tranquille"
                        ).tag(0)
                        
                        OnboardingPage(
                            imageName: "\(R.image.receive.name)",
                            title: "Vos rapports, suivis en direct",
                            description: "Consultez l’état de vos envois (reçus, en traitement) et retrouvez l’historique de vos rapports en un seul endroit."
                        ).tag(1)
                        
                        OnboardingPage(
                            imageName: "\(R.image.garantie.name)",
                            title: "Plus jamais de j’ai oublié",
                            description: "Notifications intelligentes pour vous rappeler d'envoyer votre rapport en fin de journée."
                        ).tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Masquer l'indicateur par défaut
                    .transition(.slide) // Transition fluide entre les pages
                    
                    // Indicateur de page personnalisé
                    HStack(spacing: 10) {
                        ForEach(0..<3, id: \.self) { index in
                            Capsule()
                                .frame(width: currentPage == index ? 20 : 10, height: 10)
                                .foregroundColor(currentPage == index ? .white : .gray.opacity(0.5))
                                .animation(.easeInOut, value: currentPage)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // Boutons de navigation
                    HStack {
                        if currentPage > 0 {
                            Button(action: {
                                withAnimation {
                                    currentPage -= 1
                                }
                            }) {
                                Text("Précédent")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.2))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                        }
                        
                        Spacer()
                        
                        if currentPage < 2 {
                            Button(action: {
                                withAnimation {
                                    currentPage += 1
                                }
                            }) {
                                Text("Suivant")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .foregroundColor(.blue)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                        } else {
                            NavigationLink(destination: LoginView()) {
                                    Text("Commencer")
                                         .font(.headline)
                                         .padding()
                                         .frame(maxWidth: .infinity)
                                         .background(Color.white)
                                         .foregroundColor(.blue)
                                         .cornerRadius(10)
                                         .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                           }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct OnboardingPage: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 30) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .padding(.top, 50)
            
            Text(title)
                .font(.custom("Poppins-Bold", size: 25))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Text(description)
                .font(.custom("Poppins-Regular", size: 18))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

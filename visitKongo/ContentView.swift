//
//  ContentView.swift
//  visitKongo
//
//  Created by Muzola Ethberg on 21/03/2025.
//


import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        
        TabView(selection: $selectedTab) {
        
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Accueil")
                }
                .tag(0)

            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recherche")
                }
                .tag(1)

     
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profil")
                }
                .tag(2)
        }
        .accentColor(.blue) // Couleur de l'onglet sélectionné
    }
}

// Vue pour l'onglet Accueil
struct HomePageView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Bienvenue sur l'Accueil")
                .font(.largeTitle)
                .italic()
                .fontWeight(.ultraLight)
                .padding()
            Image(R.image.chancel)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5, x: 10, y: 10)
                .rotation3DEffect(.degrees(15), axis: (x: 1, y: 0, z: 0))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

// Vue pour l'onglet Recherche
struct SearchView: View {
    @State private var textSearch: String = ""
    @State private var isOnSearch: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Text("Recherchez quelque chose")
                .foregroundStyle(.orange)
                .font(.largeTitle)
                .padding()
                .lineLimit(1)
            TextField("Que recherchez-vous ?", text: $textSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 50)
                .padding(.horizontal, 10)
                //.background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                //.border(Color.blue, width: 1)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .regular))
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .keyboardType(.default)
                .onSubmit {
                    print("Texte soumis")
                }
            
            Button(action:{
                if textSearch.isEmpty {
                    print("Aucune recherche effectuée")
                }
                else{
                    print( "Ethberg! tu as saisie \(textSearch)" )
                }
            }){
                
                Label("Rechercher", systemImage: "magnifyingglass") // Icône de loupe
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
                
                /*Text("Rechercher")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)*/
            }
            /*Toggle("Activer la recherche en direct", isOn: $isOnSearch)
                .padding()*/

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

// Vue pour l'onglet Profil
struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Votre Profil")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}



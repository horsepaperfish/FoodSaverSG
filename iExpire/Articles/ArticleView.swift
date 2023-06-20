//
//  ArticleView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 18/6/23.
//

import SwiftUI

struct ArticleView: View {

    
    @State private var generatedFact: String = ""
    @State private var starredArticles: [Article] = []
    private let allArticles: [Article] = [
        Article(title: "How to start Composting",
                content: "BLAH BLAH",
                picture: "alexandra-point"),
        Article(title: "Why recycle food waste?",
                content: "XXX",
                picture: "paris-effieltower-1"),
        Article(title: "The Problem of Food Wastage",
                content: "XXX",
                picture: "paris-effieltower-1")
    ]
    
    var body: some View {
        NavigationView{
            Form{
                
                Text("Find out more.")
                
                Section("Fun Facts"){
                    VStack {
                        Text("Did you know?")
                            .font(.headline)
                            .bold()
                            .fontWeight(.bold)
                        Text(generatedFact)
                    }
                    Button(action: {
                        generateFact()
                    }) {
                        HStack{
                            Spacer()
                            Text("Generate New Fact")
                            Spacer()
                        }
                    }
                }
                
                Section("Starred Articles") {
                    
                    
                    ForEach(starredArticles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            Image(systemName: "star.fill")
                                .onTapGesture {
                                  // run the toggle starred function or whatever it is here
                                    withAnimation {
                                        toggleStarred(article)
                                }
                            }
                            Text(article.title)
                            Image("\(article.picture)")
                        }
                    }
                }
                Section("Other Articles") {
                    ForEach(allArticles) { article in
                        if !starredArticles.contains(article) {
                            NavigationLink(destination: ArticleDetailView(article: article)) {
                              Image(systemName: "star")
                                .onTapGesture {
                                  // run the toggle starred function or whatever it is here
                                    withAnimation {
                                        toggleStarred(article)
                                    }
                                }
                                HStack {
                                    Text(article.title)
                                    Image(article.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    
    func generateFact() {
       
        let allfacts =  [
        "Food waste makes up approximately 10% of the total waste generated in Singapore.",
        "On average, each Singaporean household discards about 140 kilograms of food waste per year.",
        "The food wasted in Singapore could fill more than 14 Olympic-sized swimming pools.",
        "Singapore's food waste problem has been growing rapidly, increasing by about 48% from 2006 to 2016.",
        "Restaurants and food outlets account for nearly half of the food waste generated in Singapore.",
        "Households are the second-largest source of food waste, contributing about one-third of the total amount.",
        "The hospitality sector, including hotels and resorts, is another significant contributor to food wastage.",
        "Singapore's food waste is mostly comprised of rice, noodles, bread, fruits, and vegetables.",
        "Food waste not only represents a waste of resources but also contributes to greenhouse gas emissions.",
        "Reducing food waste by just 10% could feed around 50,000 people for a year.",
        "To combat food wastage, the Singapore government launched the Save Food Cut Waste campaign in 2013.",
        "The National Environment Agency (NEA) in Singapore has set a target to reduce food waste by 20% by 2020.",
        "In recent years, more organizations and initiatives have emerged to address food waste, such as Food Bank Singapore and SG Food Rescue.",
        "Singapore has implemented the Mandatory Packaging Reporting framework, encouraging businesses to reduce packaging waste, including food packaging.",
        "Some supermarkets and grocery stores in Singapore have started selling ugly produce at a lower price to reduce food waste and promote sustainability.",
        "Food waste that cannot be avoided or reduced is recycled into compost or used for energy generation.",
        "The Singapore government encourages individuals to practice mindful eating, such as ordering only what they can consume at hawker centers and restaurants.",
        "Food wastage not only impacts the environment but also puts a strain on resources, including water, land, and energy.",
        "Singapore is actively exploring innovative solutions like food waste digesters and smart technologies to minimize food wastage across various sectors."
        
    ]
        generatedFact = allfacts.randomElement() ?? "In Singapore, it is estimated that about 763 million kilograms of food is wasted annually."
    }
    
    func toggleStarred(_ article: Article) {
        if starredArticles.contains(article) {
            starredArticles.removeAll { $0 == article }
        } else {
            starredArticles.append(article)
        }
    }
    
    func unstarArticles(at offsets: IndexSet) {
        starredArticles.remove(atOffsets: offsets)
    }
}



struct Article: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let content: String
    let picture: String
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}

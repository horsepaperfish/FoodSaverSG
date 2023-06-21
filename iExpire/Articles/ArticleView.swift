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
                content: "Composting is an excellent way to reduce waste and create nutrient-rich soil for your plants. Here's how you can start composting at home in Singapore: \n\nUnderstand the basics: \n• Learn about the different types of composting methods such as traditional composting, vermicomposting (using worms), or bokashi composting (using fermenting microbes). \n• Understand what can and cannot be composted. Compostable items include fruit and vegetable scraps, coffee grounds, eggshells, and yard waste. Avoid meat, dairy, and oily food scraps. \n\nChoose the right composting method: \n• Consider factors like space, time, and personal preferences when selecting a composting method. For limited space, vermicomposting or bokashi composting can be ideal. \n\nSet up your composting system: \n• Purchase or build a compost bin suitable for your chosen method. \n• Ensure good ventilation and drainage for proper decomposition. \n\nCollect compostable materials: \n• Set up a separate container in your kitchen to collect food scraps. Empty it regularly into your compost bin. \n\nMaintain the compost pile: \n• Add a balance of green (nitrogen-rich) and brown (carbon-rich) materials to your compost pile. \n• Turn or mix the compost regularly to aerate it and speed up decomposition. \n\nMonitor moisture levels: \n• Keep your compost moist like a wrung-out sponge. Add water if it gets too dry or add dry materials if it gets too wet. \nBe patient and observant: \n• Composting takes time. It can take several weeks to months for the compost to be ready. \n• Pay attention to any odors or pests. Adjust the compost pile accordingly to maintain a healthy balance. \n\nUse your compost: \n• Once your compost is dark, crumbly, and earthy-smelling, it's ready to use in your garden or potted plants. \n\nRemember, composting is a continuous learning process. Be open to experimenting and adjusting your methods as you gain experience. Happy composting!",
                picture: "composting"),
        Article(title: "Why recycle food waste?",
                content: "Recycling food waste is crucial in Singapore due to several reasons: \n\nReducing waste sent to landfills: \n• Food waste comprises a significant portion of Singapore's total waste. By recycling food waste, we can divert it from overflowing landfills, minimizing the environmental impact. \n\nLowering greenhouse gas emissions: \n• When food waste decomposes in landfills, it produces methane, a potent greenhouse gas that contributes to climate change. Recycling food waste through composting or other methods reduces methane emissions. \n\nCreating nutrient-rich compost: \n• Recycling food waste allows us to transform it into nutrient-rich compost. This compost can be used to enrich soil in gardens, urban farming, or landscaping projects, promoting sustainable and healthy plant growth. \n\nEncouraging a circular economy: \n• Recycling food waste aligns with the principles of a circular economy, where waste is considered a valuable resource. By composting food waste, we close the loop, creating a sustainable system that returns nutrients back to the soil. \n\nSaving resources: \n• Recycling food waste reduces the need for synthetic fertilizers, which require energy-intensive manufacturing processes. By using compost derived from food waste, we conserve resources and promote natural soil fertility. \nFostering community engagement: \n• Engaging in food waste recycling initiatives promotes community involvement and raises awareness about the importance of reducing waste. It encourages Singaporeans to take responsibility for their environmental impact. \n\nSupporting Singapore's sustainability goals: \n• Recycling food waste aligns with Singapore's commitment to becoming a zero-waste nation and achieving sustainability targets. It contributes to the overall waste reduction efforts and creates a more environmentally conscious society. \n\nBy recycling food waste, Singaporeans can make a significant contribution towards waste reduction, resource conservation, and building a more sustainable future for the nation.",
                picture: "food-waste"),
        Article(title: "The Problem of Food Wastage",
                content: "Food wastage is a significant problem in Singapore, and addressing it is crucial for several reasons: \n\nHigh food wastage levels: \n• Singaporeans discard a substantial amount of food each day. According to statistics, Singapore generates over 700,000 tonnes of food waste annually, equivalent to about two bowls of rice per person per day. \n\nEnvironmental impact: \n• Food wastage contributes to environmental degradation. When food ends up in landfills, it produces methane, a potent greenhouse gas that contributes to climate change. Additionally, wasted resources like water, land, and energy are used in producing, processing, and transporting the uneaten food. \n\nFinancial implications: \n• Food wastage has economic consequences for individuals, businesses, and the government. Wasted food represents a significant financial loss for households and businesses. It also places a burden on waste management infrastructure and increases disposal costs. \n\nFood insecurity and social inequality. \n•While food is wasted, many people in Singapore struggle with food insecurity. By reducing food wastage, surplus food can be redirected to those in need, addressing social inequality and promoting a more equitable society. \n\nChanging consumer behavior: \n• Addressing food wastage requires a shift in consumer behavior and attitudes towards food. Encouraging mindful consumption, proper meal planning, and conscious shopping can help reduce food wastage at the individual level. \n\nCollaborative efforts: \n• Tackling food wastage requires collaboration between government agencies, businesses, and individuals. Initiatives like food waste reduction campaigns, surplus food redistribution programs, and improved food packaging and storage techniques can play a significant role in combating the issue. \n\nEducation and awareness: \n• Raising awareness about the impact of food wastage through educational programs, public campaigns, and community engagement is crucial. Educating individuals about proper storage, portion control, and the value of food can lead to more responsible consumption habits. \n\nAddressing the issue of food wastage in Singapore requires a multi-faceted approach involving individuals, businesses, and policymakers. By adopting sustainable practices, fostering collaboration, and promoting awareness, Singapore can work towards reducing food wastage and building a more sustainable food ecosystem.",
                picture: "food-wastage")
    ]
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section("Fun Facts"){
                    VStack {
                        Text("Did you know?")
                            .font(.headline)
                            .bold()
                            .fontWeight(.bold)
                            .frame(width: 300, alignment: .center)
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
                    .onAppear {
                        generateFact()
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
                            VStack {
                                Text(article.title)
                                Image(article.picture)
                                    .resizable()
                                    .frame(width: 250, height: 150)
                            }
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
                                VStack {
                                    Text(article.title)
                                    Image(article.picture)
                                        .resizable()
                                        .frame(width: 250, height: 150)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Find out more")
//            .navigationBarBackButtonHidden(true)
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

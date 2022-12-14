//
//  CategoryHome.swift
//  landmark
//
//  Created by Sergei Fonov on 10.12.22.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  @State private var showingProfile = false

  var body: some View {
    NavigationView {
      List {
        PageView(pages: modelData.futures.map { FeatureCard(landmark: $0) })
          .aspectRatio(3 / 2, contentMode: .fit)
          .listRowInsets(EdgeInsets())

        ForEach(modelData.category.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.category[key] ?? [])
        }
        .listRowInsets(EdgeInsets())
      }
      .scrollIndicators(ScrollIndicatorVisibility.hidden)
      .listStyle(.inset)
      .navigationTitle("Featured")
      .toolbar {
        Button {
          showingProfile.toggle()
        } label: {
          Label("User Profile", systemImage: "person.crop.circle")
        }
      }
      .sheet(isPresented: $showingProfile) {
        ProfileHost()
      }
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }
}

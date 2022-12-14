//
//  ProfileSummary.swift
//  landmark
//
//  Created by Sergei Fonov on 11.12.22.
//

import SwiftUI

struct ProfileSummary: View {
  @EnvironmentObject var modelData: ModelData
  var profile: Profile

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text(profile.username)
          .bold()
          .font(.title)

        Text("Notifications: \(profile.prefersNotification ? "On" : "Off")")
        Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
        Text("Goal Date: ") + Text(profile.goalDate, style: .date)

        Divider()

        VStack(alignment: .leading) {
          Text("Completed Badges")
            .font(.headline)

          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: 45))
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5)
                .hueRotation(Angle(degrees: 90))
            }
            .padding(.bottom)
          }
        }

        Divider()

        VStack(alignment: .leading) {
          HStack {
            Text("Recent Hikes")
              .font(.headline)
            if modelData.hikes.isEmpty {
              ProgressView()
                .padding(.leading, 5)
            }
          }
          .padding(.top, 5)

          if let hike = modelData.hikes.first {
            HikeView(hike: hike)
          }
        }
      }
    }
    .onAppear {
      modelData.getHikes()
    }
  }
}

struct ProfileSummary_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSummary(profile: Profile.default)
      .environmentObject(ModelData())
  }
}

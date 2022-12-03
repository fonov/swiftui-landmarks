//
//  LandmarkImage.swift
//  landmark
//
//  Created by Sergei Fonov on 03.12.22.
//

import SwiftUI

struct LandmarkImage: View {
  var landmark: Landmark

  var body: some View {
    landmark.image
      .navigationTitle(landmark.name)
      .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkImage_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkImage(landmark: landmarks[0])
  }
}

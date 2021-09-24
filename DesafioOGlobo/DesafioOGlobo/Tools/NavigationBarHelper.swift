//
//  NavigationBarHelper.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 24/09/21.
//

import SwiftUI
import UIKit

struct NavigationBarColor: ViewModifier {

  init(backgroundColor: UIColor, tintColor: UIColor) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = globoBlue
    coloredAppearance.titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 26)!, .foregroundColor: tintColor]
    coloredAppearance.largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 26)!, .foregroundColor: tintColor]
                   
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
  }

  func body(content: Content) -> some View {
    content
  }
}

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

let globoBlue = UIColor.init(red: 0/255, green: 131/255, blue: 191/255, alpha: 1.0)


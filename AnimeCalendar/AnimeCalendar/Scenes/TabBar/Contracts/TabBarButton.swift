//
//  TabBarButton.swift
//  AnimeCalendar
//
//  Created by Leonardo  on 8/05/22.
//

import Foundation
import UIKit

protocol TabBarButton {
  var button: UIButton { get set }
  var onTapAction: (() -> Void)? { get set }
  func createButton(in tabBarView: UITabBar)
}

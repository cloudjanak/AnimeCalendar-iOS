//
//  HomeScreenVC.swift
//  AnimeCalendar
//
//  Created by Leonardo  on 24/04/22.
//

import UIKit

final class HomeScreen: UIViewController, ScreenProtocol {
  /// # Protocol properties
  var requestsManager: RequestProtocol

  /// # NavigationBar
  lazy var navigationBar: ScreenNavigationBar = HomeScreenNavigationBar(self)

  /// # Presents the NewScheduledAnimeScreen
  let newScheduledAnimeButton = NewScheduledAnimeButton()

  init(requestsManager: RequestProtocol) {
    self.requestsManager = requestsManager
    super.init(nibName: Xibs.homeScreenView, bundle: Bundle.main)
    print("VIEW INITTTED")
    newScheduledAnimeButton.presentsNewScreenDelegate = self
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("VIEW DIDD LOAD")
    configureDelegates()
    configureScreen()
  }
}

extension HomeScreen {
  func configureDelegates() {
//    newScheduledAnimeButton.presentsNewScreenDelegate = self
  }

  func configureScreen() {
    configureNavigationItems()
    configureScreenComponents()
  }
}

extension HomeScreen {
  func configureScreenComponents() {
    let homeHeaderComponent: ScreenComponent = HomeHeaderComponent()
    let homeDateComponent: ScreenComponent = HomeDateComponent()
    let homeAnimesComponent: ScreenComponent = HomeAnimesComponent()

    addChildVC(homeHeaderComponent)
    addChildVC(homeDateComponent)
    addChildVC(homeAnimesComponent)

    configureComponentsConstraints(
      homeHeaderComponent,
      homeDateComponent,
      homeAnimesComponent
    )
  }

  func configureComponentsConstraints(
    _ homeHeader: ScreenComponent,
    _ homeDate: ScreenComponent,
    _ homeAnimes: ScreenComponent
  ) {
    /// # HomeHeaderComponent
    let homeHeaderView: UIView = homeHeader.view
    homeHeaderView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      homeHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      homeHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
      homeHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      homeHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])

    /// # HomeDateComponent
    let homeDateView: UIView = homeDate.view
    homeDateView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      homeDateView.topAnchor.constraint(equalTo: homeHeaderView.bottomAnchor, constant: 20),
      homeDateView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
      homeDateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      homeDateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
    ])

    /// # HomeAnimesComponent
    let homeAnimesView: UIView = homeAnimes.view
    homeAnimesView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      homeAnimesView.topAnchor.constraint(equalTo: homeDateView.bottomAnchor, constant: 10),
      homeAnimesView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.58),
      homeAnimesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      homeAnimesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
    ])
  }
}

extension HomeScreen {
  func configureNavigationItems() {
    configureLeftNavigationItems()
    configureRightNavigationItems()
  }

  func configureLeftNavigationItems() {
    navigationBar.configureLeftNavigationItems()
  }

  func configureRightNavigationItems() {
    navigationBar.configureRightNavigationItems()
  }
}

extension HomeScreen: PresentsNewScreen {}

// TODO: DELETE
final class CustomScreen: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = Color.cream
    modalPresentationStyle = .formSheet
    configureScreen()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureScreen() {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("WOF", for: .normal)
    button.backgroundColor = UIColor.systemGreen
    view.addSubview(button)
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
    ])
  }
}

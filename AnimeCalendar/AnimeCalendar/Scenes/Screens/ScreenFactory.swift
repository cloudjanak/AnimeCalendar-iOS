//
//  ScreenFactory.swift
//  AnimeCalendar
//
//  Created by Leonardo  on 9/05/22.
//

import Foundation

final class ScreenFactory {
    // MARK: Methods
    /// Get Screen type UIViewController.
    /// - Parameter screen: ScreenType to decide which Screen to return.
    /// - Returns: Screen
    func getRootScreen(_ screen: ScreenType) -> Screen {
        switch screen {
            case .homeScreen:
                let homeModule = AnimeCalendarModule.shared.getHomeModule()
                return homeModule.start()
            case .newAnimeScreen:
                let newAnimeModule = AnimeCalendarModule.shared.getNewAnimeModule()
                return newAnimeModule.start()
            case .calendarScreen:
                let calendarModule = AnimeCalendarModule.shared.getCalendarModule()
                return calendarModule.start()
        }
    }
}

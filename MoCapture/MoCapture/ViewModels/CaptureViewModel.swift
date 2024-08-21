//
//  CaptureViewModel.swift
//  MoCapture
//
//  Created by Cynthia D'Phoenix on 8/21/24.
//

import UIKit
import CoreData

struct EventViewModel {
    private var events: [EventsModel]

    init(events: [EventsModel]) {
        self.events = events
    }

    func numberOfItems() -> Int {
        return events.count
    }

    func product(at index: Int) -> EventsModel {
        return events[index]
    }
}

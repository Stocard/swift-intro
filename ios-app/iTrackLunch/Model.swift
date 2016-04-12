//
//  Model.swift
//  iTrackLunch
//
//  Created by Mark Himmelsbach on 07.04.16.
//  Copyright © 2016 de.stocard.iTrackLunch. All rights reserved.
//

import Foundation

class Model {
    
    private static let lunchesFileName = "itl_lunches.archive"
    private var allLunches = Model.readPersistedLunches()

    // MARK: - Public

    func getLunches() -> [Lunch] {
        return allLunches
    }
    
    func addLunch(lunch: Lunch?) {
        if let lunch = lunch {
            allLunches.append(lunch)
        }
    }
    
    func persistData() {
        NSKeyedArchiver.archiveRootObject(allLunches, toFile: Model.getLunchesArchivePathString())
    }
    
    // MARK: - Persistency
    
    private static func readPersistedLunches() -> [Lunch] {
        let persistedLunches = NSKeyedUnarchiver.unarchiveObjectWithFile(getLunchesArchivePathString()) as? [Lunch]
        if let persistedLunches = persistedLunches {
            return persistedLunches
        }
        return []
    }
    
    private static func getLunchesArchivePathString() -> String {
        let manager = NSFileManager.defaultManager()
        let url = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first! as NSURL
        return url.URLByAppendingPathComponent(Model.lunchesFileName).path!
    }
}
//
//  StoryLineModel.swift
//  Destiny
//
//  Created by Laura Garcia Cano on 27/07/2020.
//  Copyright © 2020 LauDecked Devs. All rights reserved.
//

import Foundation

class StoryLine {
    
    //MARK: - Properties
    
    let storyText: String
    let topButtonText: String
    let bottomButtonText: String
    
    init(story: String, tButton: String, bButton: String) {
        storyText = story
        topButtonText = tButton
        bottomButtonText = bButton
    }
}

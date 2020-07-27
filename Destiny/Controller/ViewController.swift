//
//  ViewController.swift
//  Destiny
//
//  Created by Laura Garcia Cano on 27/07/2020.
//  Copyright © 2020 LauDecked Devs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let allStories = StoryLineData()
    var storyNumber: Int = 0
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    
    //MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverButtons()
        storyTextView.text = allStories.stories[storyNumber].storyText
        topButton.setTitle(allStories.stories[storyNumber].topButtonText, for: UIControl.State.normal)
        bottomButton.setTitle(allStories.stories[storyNumber].bottomButtonText, for: UIControl.State.normal)
    }

    //MARK: - ButtonProperties
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 && storyNumber == 0 {
            storyNumber = 1
            nextStory()
        } else if sender.tag == 2 && storyNumber == 0 {
            storyNumber = 3
            nextStory()
        } else if sender.tag == 1 && storyNumber == 1 {
            storyNumber = 2
            nextStory()
            hideButtons()
        } else if sender.tag == 2 && storyNumber == 1 {
            storyNumber = 4
            nextStory()
            hideButtons()
        } else if sender.tag == 1 && storyNumber == 3 {
            storyNumber = 1
            nextStory()
        } else if sender.tag == 2 && storyNumber == 3 {
            storyNumber = 5
            nextStory()
            hideButtons()
        }
    }
    
    //MARK: - StoryChanger
    
    func nextStory() {
        storyTextView.text = allStories.stories[storyNumber].storyText
        topButton.setTitle(allStories.stories[storyNumber].topButtonText, for: UIControl.State.normal)
        bottomButton.setTitle(allStories.stories[storyNumber].bottomButtonText, for: UIControl.State.normal)
    }
    
    //MARK: - hideButtonsFunction
    
    func hideButtons() {
        topButton.isHidden = true
        bottomButton.isHidden = true
        alertControl()
    }
    
    //MARK: - RecoverButtonsFunction
    
    func recoverButtons() {
        storyNumber = 0
        topButton.isHidden = false
        bottomButton.isHidden = false
    }
    
    //MARK: - RestarActionAlert
    
    func alertControl() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
        {
        let alert = UIAlertController(title: "Story Finished", message: "This story is finished, do you want to restart?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default) {(UIAlertAction)
        in self.restart()
        }
        alert.addAction(restartAction)
        self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - RestartAction
    
    func restart() {
        viewDidLoad()
    }
}

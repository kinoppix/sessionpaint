//
//  TopViewController.swift
//  sessionpaint
//
//  Created by HashimotoYusuke on 2017/12/22.
//  Copyright © 2017年 HashimotoYusuke. All rights reserved.
//

import Cocoa

class TopViewController: NSViewController {

//    @IBOutlet weak var pathTextField:  NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
//        guard let window = segue.destinationController as? NSWindowController,
//            let vc = window.contentViewController as? ViewController else {
//                return
//        }
//        vc.path = pathTextField.stringValue
    }
    
}


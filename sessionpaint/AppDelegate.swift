//
//  AppDelegate.swift
//  sessionpaint
//
//  Created by HashimotoYusuke on 2017/12/10.
//  Copyright © 2017年 HashimotoYusuke. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var tapEnableMenu: NSMenuItem!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func onClickedMenuItem(_ sender: Any) {
        toggleMenuChecked()
        
        NotificationCenter.default.post(name: NSNotification.Name("tapEnable"), object: nil)
    }
    
    func toggleMenuChecked(){
        tapEnableMenu.state = tapEnableMenu.state == .on ? .off : .on
    }
}


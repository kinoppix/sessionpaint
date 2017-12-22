//
//  ViewController.swift
//  sessionpaint
//
//  Created by HashimotoYusuke on 2017/12/10.
//  Copyright © 2017年 HashimotoYusuke. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var appDelegate: AppDelegate? = nil

    var path: String = ""
    
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = NSApplication.shared.delegate as? AppDelegate
        self.imageView.imageScaling = .scaleProportionallyUpOrDown
        
        NotificationCenter.default.addObserver(self, selector: #selector(nCenter), name: NSNotification.Name("tapEnable"), object: nil)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
//        print("path: " + path)
        
        
        if let window = self.view.window {
            window.isOpaque = false
            window.backgroundColor = .clear
            setWindowTap()
        }
        let dialog = NSOpenPanel() //ファイルを開くダイアログ
        dialog.canChooseDirectories=false // ディレクトリを選択できるか
        dialog.canChooseFiles = true // ファイルを選択できるか
        dialog.canCreateDirectories = false // ディレクトリを作成できるか
        dialog.allowsMultipleSelection = false // 複数ファイルの選択を許すか
        dialog.allowedFileTypes = NSImage.imageTypes // 選択できるファイル種別
        dialog.begin { (result) -> Void in
            if result.rawValue == NSFileHandlingPanelOKButton {// ファイルを選択したか(OKを押したか)
                guard dialog.url != nil else { return }
                self.imageView.image = NSImage(contentsOf: dialog.url!)
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @objc func nCenter(notification: NSNotification){
        setWindowTap()
    }
    
    func setWindowTap() {
        if let appDelegate = appDelegate {
            self.view.window?.ignoresMouseEvents = appDelegate.tapEnableMenu.state != .on
        }
    }

}


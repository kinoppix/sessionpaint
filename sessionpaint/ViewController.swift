//
//  ViewController.swift
//  sessionpaint
//
//  Created by HashimotoYusuke on 2017/12/10.
//  Copyright © 2017年 HashimotoYusuke. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var path: String = ""
    
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.imageScaling = .scaleProportionallyUpOrDown
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
//        print("path: " + path)
        
        
        if let window = self.view.window {
            window.isOpaque = false
            window.backgroundColor = .clear
            window.ignoresMouseEvents = true
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


}


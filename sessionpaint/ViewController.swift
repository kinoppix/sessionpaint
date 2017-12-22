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
    @IBOutlet weak var slider: NSSlider!
    
    @IBAction func sliderAction(_ sender: Any) {
        imageView.alphaValue = CGFloat(slider.floatValue)
    }
    
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
            window.level = .floating //ウインドウの表示レイヤーの設定
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
        guard let appDelegate = appDelegate else {
            return
        }
        self.view.window?.ignoresMouseEvents = appDelegate.tapEnableMenu.state != .on
        slider.isHidden = appDelegate.tapEnableMenu.state != .on
    }

}


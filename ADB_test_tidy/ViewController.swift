//
//  ViewController.swift
//  ADB_test_tidy
//
//  Created by Michele Marcucci on 26/08/18.
//  Copyright © 2018 Michele Marcucci. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var dir = "ciao"
    var dir1 = "ciao"
    var dir2 = "ciao"
    var dir3 = "ciao"
    var dir4 = "ciao"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    

    @IBAction func reboot(_ sender: Any) {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb reboot"]
        task.launch()
    }
    
    @IBAction func recovery(_ sender: Any) {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb reboot recovery"]
        task.launch()
    }
    
    @IBAction func bootloader(_ sender: Any) {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb reboot bootloader"]
        task.launch()
    }
    @IBAction func download(_ sender: Any) {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb reboot download"]
        task.launch()
    }
    @IBOutlet weak var status: NSTextField!
    @IBOutlet weak var check: NSButton!
    
    @IBAction func OEM_unlock(_ sender: Any) {
        if check.state == .on{
            let task = Process()
            task.launchPath = "/bin/bash"
            task.arguments = ["-c", "/Applications/AdbToolbox.app/source/fastboot flashing unlock"]
            task.launch()
            let message = "STATUS: OK"
            status.stringValue = message
        }
        else{
            let message = "STATUS: FAILED"
            status.stringValue = message
        }
    }
    
    @IBOutlet weak var status_critical: NSTextField!
    @IBOutlet weak var check_critical: NSButton!
    
    
    @IBAction func Unlock_critical(_ sender: Any) {
        if check_critical.state == .on{
            let task = Process()
            task.launchPath = "/bin/bash"
            task.arguments = ["-c", "/Applications/AdbToolbox.app/source/fastboot flashing unlock_critical"]
            task.launch()
            let message = "STATUS: OK"
            status_critical.stringValue = message
        }
        else{
            let message = "STATUS: FAILED"
            status_critical.stringValue = message
        }
    }
    
    
    @IBOutlet weak var recovery_dir: NSTextField!
    @IBAction func flash_recovery(_ sender: Any) {
        let dir = recovery_dir.stringValue
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/fastboot flash recovery \(dir)"]
        task.launch()
        
    }
    
    @IBOutlet weak var zip_dir_fatal: NSTextField!
    
    
    @IBAction func flash_zip(_ sender: Any) {
        let dir1 = zip_dir_fatal.stringValue
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb sideload \(dir1)"]
        task.launch()
        
    }
    
    
    
    @IBOutlet weak var file_fatal1: NSTextField!
    @IBAction func Push_file(_ sender: Any) {
        let dir2 = file_fatal1.stringValue
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb push \(dir2) /sdcard"]
        task.launch()
        
        
    }
    
    
    
    @IBOutlet weak var check_2: NSButton!
    
    
    @IBOutlet weak var status_2: NSTextField!
    
    @IBAction func OEM_lock(_ sender: Any) {
        if check_2.state == .on{
            let task = Process()
            task.launchPath = "/bin/bash"
            task.arguments = ["-c", "/Applications/AdbToolbox.app/source/fastboot flashing lock"]
            task.launch()
            let message = "STATUS: OK"
            status_2.stringValue = message
        }
        else{
            let message = "STATUS: FAILED"
            status_2.stringValue = message
        }
    }
    
    
    @IBOutlet weak var apk_dir: NSTextField!
    
    @IBAction func install_apk(_ sender: Any) {
        let dir3 = apk_dir.stringValue
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb install \(dir3)"]
        task.launch()
    }
    
    
    @IBOutlet weak var package_name: NSTextField!
    
    @IBAction func uninstall_app(_ sender: Any) {
        let dir4 = package_name.stringValue
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb shell pm uninstall -k --user 0 \(dir4)"]
    }
    
    
    
    @IBAction func Telegram_channel(_ sender: Any) {
        let url = URL(string: "https://t.me/adbtoolbox")
        NSWorkspace.shared.open(NSURL(string: "https://t.me/adbtoolbox")! as URL)
    }
    
    
    @IBOutlet weak var device_name: NSTextField!
    @IBAction func device(_ sender: Any) {
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", "/Applications/AdbToolbox.app/source/adb shell getprop ro.product.model > file.txt"]
        
    }
    
    
}


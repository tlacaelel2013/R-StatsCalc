//
//  Toolbar01-v0.2.swift
//  jsLinux++
//
//  Created by Luis Acevedo-Arreguin on 9/30/22.
//


//
//  Toolbar01-v0.2.swift
//  LinuxShell00
//
//  Created by Luis Acevedo-Arreguin on 9/15/22.
//


//
//  Toolbar01-v0.2.swift
//  R-StatsCalc
//
//  Created by Luis Acevedo-Arreguin on 8/28/22.
//

import Foundation
import SwiftUI
import Combine
import UIKit
import AudioToolbox


// extension to add toolbar


class RToolButton: UIBarButtonItem {
    var scriptLine: String = ""
}

extension UITextView {
    

    
    
    func addRButtonsOnKeyboard(){
        
        
        
        
        let rToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 38))
        

        
        rToolbar.barStyle = .default
 
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let go: UIBarButtonItem = UIBarButtonItem(title: "OFF", style: .plain, target: self, action: #selector(self.goButtonAction)) // title: "Go"
 //       let go: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chart.bar"), style: .plain, target: self, action: #selector(self.goButtonAction)) // title: "Go"
        let clear: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"trash"), style: .done, target: self, action: #selector(self.clearButtonAction)) // title: "Clr"
        let enter: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"return"), style: .done, target: self, action: #selector(self.returnButtonAction)) // title: "Enter"

        let delete: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"delete.left"), style: .done, target: self, action: #selector(self.deleteButtonAction)) // title: "Delete"
        let esc: UIBarButtonItem = UIBarButtonItem(title: "esc", style: .done, target: self, action: #selector(self.escButtonAction)) // title: "Escape"
        let ctrlC: UIBarButtonItem = UIBarButtonItem(title: "^C", style: .done, target: self, action: #selector(self.ctrlCButtonAction)) // title: "Control-C"
        let ctrlD: UIBarButtonItem = UIBarButtonItem(title: "^D", style: .done, target: self, action: #selector(self.ctrlDButtonAction)) // title: "Control-D"
        let ctrlZ: UIBarButtonItem = UIBarButtonItem(title: "^Z", style: .done, target: self, action: #selector(self.ctrlZButtonAction)) // title: "Control-Z"
        
//        let delete: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"arrow.left.to.line.alt"), style: .done, target: self, action: #selector(self.deleteButtonAction)) // title: "Delete"
        let tab: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"arrow.right.to.line.alt"), style: .done, target: self, action: #selector(self.tabButtonAction)) // title: "Tab"




        let rToolButtons: [RToolButton] = ["|"].map {
 
            let button = RToolButton()
            button.scriptLine = "\($0)"
            button.title = "\($0)"
            button.customView?.sizeToFit()
            button.style = .plain // .done
            button.tintColor = UIColor.darkGray
            button.target = self
            button.action = #selector(self.didTapRButton(_:))
            
             return button
        }
   
        
        
        
        let items = [clear, esc, ctrlC, ctrlD, ctrlZ, delete, flexSpace] + rToolButtons + [ enter, go]
        rToolbar.items = items
        // rToolbar.sizeToFit()
        
         self.inputAccessoryView = rToolbar
        // self.inputView = rToolbar
 
    } // end function addRButtons...
    
    @objc func goButtonAction() {
    
        // htmlUpdate2(text: text)
        text = "# Visit the website for more #\n# https://github.com/tlacaelel2013 #\n" + text
        self.resignFirstResponder()
        
        
    }
    @objc func didTapRButton(_ sender: RToolButton) {
        AudioServicesPlaySystemSound(1057)
        insertText("\(sender.scriptLine)")
    }
    @objc func clearButtonAction(){
        AudioServicesPlaySystemSound(1057)
        text = " "
        insertText("\(text ?? "")")
    }
    @objc func returnButtonAction(){
        AudioServicesPlaySystemSound(1057)
        insertText("\r")
    }
    @objc func tabButtonAction(){
        AudioServicesPlaySystemSound(1057)
        insertText("\u{09}")
    }
    @objc func deleteButtonAction(){
        AudioServicesPlaySystemSound(1057)
        // insertText("\u{7F}")
        deleteBackward() // insertText("\u{08}")
        // insertText("\u{7F}")
    }
    @objc func escButtonAction(){
        AudioServicesPlaySystemSound(1057)
        insertText("\u{1b}")
    }
    @objc func ctrlCButtonAction(){
        AudioServicesPlaySystemSound(1057)
        insertText("\u{03}")
    }
    @objc func ctrlDButtonAction(){
        AudioServicesPlaySystemSound(1057)
        insertText("\u{04}")
    }
    @objc func ctrlZButtonAction(){
        AudioServicesPlaySystemSound(1057)
        insertText("\u{1A}")
    }
    
    
} // end  extension



// Sources of information for code debugging:
/*
 
 https://sfsymbols.com
 https://en.wikipedia.org/wiki/ASCII#ASCII_control_code_chart
 https://datatracker.ietf.org/doc/html/rfc5137
 https://www.fileformat.info/info/charset/UTF-8/list.htm
 https://www.unicode.org/Public/UCD/latest/ucd/NameAliases.txt
 https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/
 https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
 https://stackoverflow.com/questions/27350006/invalid-escape-sequence-in-literal-b
 
 https://stackoverflow.com/questions/28541517/how-to-assign-escape-as-key-equivalent-to-a-button-in-swift
 
 */




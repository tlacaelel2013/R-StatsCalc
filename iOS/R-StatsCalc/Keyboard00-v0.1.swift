//
//  Keyboard00-v0.1.swift
//  jsLinux++
//
//  Created by Luis Acevedo-Arreguin on 9/30/22.
//


//
//  Keyboard00-v0.1.swift
//  LinuxShell00
//
//  Created by Luis Acevedo-Arreguin on 9/15/22.
//


//
//  Keyboard00-v0.1.swift
//  R-StatsCalc
//
//  Created by Luis Acevedo-Arreguin on 9/1/22.
//

import Foundation
import SwiftUI
import AudioToolbox



class KeyButton2: UIButton {
    
    var scriptLine: String = ""
    
}

public class AlphaNumericKeyboard2: UIView {
    weak var target: (UIKeyInput & UITextInput)?
    
    var text: String = "Script Zone"
    var capsLock: Bool
    
    
    lazy var keyboardButtons: [KeyButton2] = ["q","w","e","r","t","y","u","i","o","p",":","0","1","2","3","{","}","(",")","[","]","%","a","s","d","f","g","h","j","k","l","'",";","\\","4","5","6","+","-","*","/","^","?","!","#","z","x","c","v","b","n","m","\"","=",",",".","7","8","9","_","<",">","@","&","$","~"].map {
        let button = KeyButton2(type: .system)
        
        button.scriptLine = "\($0)"
        button.setTitle("\($0)", for: .normal)
        if "\($0)" == "\n" { button.setImage(UIImage(systemName:"return"), for: .normal)}
        if "\($0)" == "\"" { button.scriptLine = "\u{22}"}
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
//        button.AudioServicesPlaySystemSound(1123) // Value of type 'KeyButton2' has no member 'AudioServicesPlaySystemSound'
        
        button.addTarget(self, action: #selector(didTapKeyButton(_:)), for: .touchUpInside)
        return button
    }

    lazy var capsLockButton: UIButton = {
        let button = UIButton(type: .system)
      //  button.setImage(UIImage(systemName:"capslock.fill"), for: .normal)
      //  button.setTitle("CAPS LOCK", for: .normal)
        button.setTitle("Shift", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Caps Lock"
        button.addTarget(self, action: #selector(didTapCapsLockButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var tabButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TAB", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Tab"
        button.addTarget(self, action: #selector(didTapTabButton(_:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
     //   button.setTitle("⌫", for: .normal)
        button.setTitle("DELETE", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Delete"
        button.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var spaceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SPACE BAR", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Space Bar"
        button.addTarget(self, action: #selector(didTapSpaceButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var spaceButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SPACE", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Space Bar"
        button.addTarget(self, action: #selector(didTapSpaceButton(_:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ENTER", for: .normal)
//        button.setImage(UIImage(systemName:"return"), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Enter"
        button.addTarget(self, action: #selector(didTapReturnButton(_:)), for: .touchUpInside)
        return button
    }()
    lazy var upArrowButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setTitle("UP ARROW", for: .normal)
        button.setImage(UIImage(systemName:"arrow.up"), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Up Arrow"
        button.addTarget(self, action: #selector(didTapUpButton(_:)), for: .touchUpInside)
        return button
    }()
    lazy var downArrowButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setTitle("DOWN ARROW", for: .normal)
        button.setImage(UIImage(systemName:"arrow.down"), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Down Arrow"
        button.addTarget(self, action: #selector(didTapDownButton(_:)), for: .touchUpInside)
        return button
    }()
    lazy var rightArrowButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setTitle("RIGHT ARROW", for: .normal)
        button.setImage(UIImage(systemName:"arrow.right"), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Right Arrow"
        button.addTarget(self, action: #selector(didTapRightButton(_:)), for: .touchUpInside)
        return button
    }()
    lazy var leftArrowButton: UIButton = {
        let button = UIButton(type: .system)
//        button.setTitle("LEFT ARROW", for: .normal)
        button.setImage(UIImage(systemName:"arrow.left"), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.accessibilityTraits = [.keyboardKey]
        button.accessibilityLabel = "Left Arrow"
        button.addTarget(self, action: #selector(didTapLeftButton(_:)), for: .touchUpInside)
        return button
    }()
    

    init(target: UIKeyInput & UITextInput, capsLock: Bool = false) {

        self.target = target
        self.target?.insertText("")
        self.capsLock = capsLock

        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// MARK: - Actions

extension AlphaNumericKeyboard2 {
    
    
    
    @objc func didTapKeyButton(_ sender: KeyButton2) {
    //    capsLock.toggle()
        AudioServicesPlaySystemSound(1057) // keytone: (1075) // typewriter: (1306) // Touchtone:(1200) // PIN Key (1057) // typewriter: (1035) (1335) // telegraph: (1333) // (1123) // (1104) // (0x450)
        if capsLock {
            target?.insertText("\(sender.scriptLine.uppercased())")
        } else {
            target?.insertText("\(sender.scriptLine)")
        }

 
    }

    @objc func didTapDeleteButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
     
     //   target?.insertText("\u{08}")
        target?.deleteBackward()
        target?.insertText("\u{7F}")
        //   target?.deleteBackward()
    }
    
    @objc func didTapCapsLockButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
     
        capsLock.toggle()
        if capsLock {
            capsLockButton.setTitle("CAPS", for: .normal)
            capsLockButton.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        } else {
            capsLockButton.setTitle("Shift", for: .normal)
            capsLockButton.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        }
    }
    
    @objc func didTapSpaceButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText(" ")
    }
    
    @objc func didTapTabButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText("\u{09}")
    }
    
    @objc func didTapReturnButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText("\u{0D}")
    }

    @objc func didTapUpButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText("\u{1b}\u{5b}\u{41}")
    }
    @objc func didTapDownButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText("\u{1b}\u{5b}\u{42}")
    }
    @objc func didTapRightButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText("\u{1b}\u{5b}\u{43}")
    }
    @objc func didTapLeftButton(_ sender: KeyButton2) {
        AudioServicesPlaySystemSound(1057)
        target?.insertText("\u{1b}\u{5b}\u{44}")
    }
    
    
} // end extension

/*
extension AlphaNumericKeyboard2 {
    
    func getCurrentScript() -> String {

        
        guard let start = target?.beginningOfDocument else { return "Hello, chatos"}
        guard let end = target?.endOfDocument else { return "Nothing here"}
        guard let allRange = target?.textRange(from: start, to: end) else { return "Empty Zone"}
        guard let tinyTinyScript = target?.text(in: allRange) else {return "La Vida Loca!!"}
        
        return tinyTinyScript
        
    }
} // end public extension
 
*/
// MARK: - Private initial configuration methods

private extension AlphaNumericKeyboard2 {
    func configure() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addButtons()
    }

    func addButtons() {
        
        let stackView = createStackView(axis: .vertical)
        stackView.frame = bounds
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(stackView)

        for row in 0 ..< 3 {
            let subStackView = createStackView(axis: .horizontal)
           // stackView.addArrangedSubview(subStackView)

            for column in 0 ..< 22 {
                subStackView.addArrangedSubview(keyboardButtons[row * 22 + column + 0])
                // stackView.addArrangedSubview(subStackView)
            }
            stackView.addArrangedSubview(subStackView)
        }

        let subStackView = createStackView(axis: .horizontal)
        subStackView.addArrangedSubview(capsLockButton)
        subStackView.addArrangedSubview(tabButton)
        subStackView.addArrangedSubview(enterButton)
        subStackView.addArrangedSubview(spaceButton2)
        subStackView.addArrangedSubview(leftArrowButton)
        subStackView.addArrangedSubview(rightArrowButton)
        subStackView.addArrangedSubview(upArrowButton)
        subStackView.addArrangedSubview(downArrowButton)
        subStackView.addArrangedSubview(deleteButton)
        stackView.addArrangedSubview(subStackView)
        
        let subStackView2 = createStackView(axis: .horizontal)
        subStackView2.addArrangedSubview(spaceButton)
        stackView.addArrangedSubview(subStackView2)

    }
 
        
    func createStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }

    func insertText(_ string: String) {
        guard let range = target?.selectedRange else { return }

        if let textField = target as? UITextField, textField.delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) == false {
            return
        }

        if let textView = target as? UITextView, textView.delegate?.textView?(textView, shouldChangeTextIn: range, replacementText: string) == false {
            return
        }

        target?.insertText(string)
    }
}

    


// MARK: - UITextInput extension

extension UITextInput {
    var selectedRange: NSRange? {
        guard let textRange = selectedTextRange else { return nil }
        
        let location = offset(from: beginningOfDocument, to: textRange.start)
        let length = offset(from: textRange.start, to: textRange.end)
        return NSRange(location: location, length: length)
    }
}


/*
 
 Information for code debugging and other similar projects:
 
 https://stackoverflow.com/questions/33449741/how-to-make-custom-keyboard-only-for-my-app-in-swift
 https://stackoverflow.com/questions/33474771/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard
 https://stackoverflow.com/questions/33497693/how-to-input-text-using-the-buttons-of-an-in-app-custom-keyboard
 https://code.tutsplus.com/tutorials/ios-8-creating-a-custom-keyboard-in-swift--cms-22344
 https://www.appsloveworld.com/swift/100/3/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard
 
 https://swiftstudent.com/2020-01-15-swiftui-inputaccessoryview/
 https://riptutorial.com/ios/example/10333/replace-keyboard-with-uipickerview
 https://stackoverflow.com/questions/59114647/swiftui-inputaccesoryview-implementation
 https://stackoverflow.com/questions/63543759/swiftui-view-as-a-uitextview-inputaccessoryview-has-incorrect-frame
 https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-toolbar-above-the-keyboard-using-inputaccessoryview
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-stateobject-to-create-and-monitor-external-objects
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-observedobject-to-manage-state-from-external-objects
 https://swiftwombat.com/how-to-display-uikit-view-in-swiftui-using-uiviewrepresentable/
 https://www.raywenderlich.com/21522453-swiftui-property-wrappers
 
 https://stackoverflow.com/questions/56941206/inputaccessoryview-view-pinned-to-keyboard-with-swiftui
 https://stackoverflow.com/questions/18265496/iphone-how-to-create-a-scrolling-uitoolbar-above-keyboard
 https://stackoverflow.com/questions/71839469/unrecognized-selector-sent-to-class-uncaught-exception-of-type-nsexception-n
 https://stackoverflow.com/questions/35167123/swift-error-editor-placeholder-in-source-file
 https://stackoverflow.com/questions/57975634/is-there-any-way-to-set-inputview-for-textfield-in-swiftui
 https://stackoverflow.com/questions/60013189/adding-an-uneditable-suffix-to-a-swiftui-textfield
 https://codeutility.org/odd-behavior-when-using-multiple-securefields-following-a-textfield-in-a-swiftui-view-stack-overflow/
 https://stackoverflow.com/questions/61671313/making-parts-of-text-bold-in-swiftui
 https://stackoverflow.com/questions/29129582/how-i-can-change-font-to-uitextview-in-swift
 https://stackoverflow.com/questions/34922331/getting-and-setting-cursor-position-of-uitextfield-and-uitextview-in-swift/34922332#34922332
 https://stackoverflow.com/questions/61446026/pass-state-binding-to-uiviewrepresentable
 https://stackoverflow.com/questions/61669540/press-return-key-without-dismissing-software-keyboard-swiftui/61677963#61677963
 https://stackoverflow.com/questions/37772411/how-to-add-system-icons-for-a-uibutton-programmatically
 https://stackoverflow.com/questions/38044233/trying-to-create-an-ios-wkwebview-with-a-size-smaller-than-the-screen-programmat
 
 
 https://www.hackingwithswift.com/read/19/7/fixing-the-keyboard-notificationcenter
 https://programmingwithswift.com/get-keyboard-height-swiftui/
 
 https://github.com/suragch/MongolAppDevelopment-iOS
 
 https://github.com/WebKit/webkit/blob/main/Source/WebKit/UIProcess/API/Cocoa/WKWebView.mm#L1638
 https://github.com/WebKit/webkit/blob/main/Source/WebKit/UIProcess/API/Cocoa/WKWebView.mm#L1623
 
 https://stackoverflow.com/questions/10299021/how-to-play-keyboard-click-sound-in-custom-keyboard
 https://github.com/TUNER88/iOSSystemSoundsLibrary
 https://www.rockhoppertech.com/blog/apple-system-sounds/
 https://iphonedev.wiki/index.php/AudioServices
 
 https://stackoverflow.com/questions/28541517/how-to-assign-escape-as-key-equivalent-to-a-button-in-swift
 */



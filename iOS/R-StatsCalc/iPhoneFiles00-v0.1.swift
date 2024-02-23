//
//  iPhoneFiles00-v0.1.swift
//  jsLinux++
//
//  Created by Luis Acevedo-Arreguin on 9/30/22.
//


//
//  iPhoneFiles00.swift
//  LinuxShell00
//
//  Created by Luis Acevedo-Arreguin on 9/15/22.
//

import Foundation
import WebKit
import SwiftUI

func setupWebR() {
    
    print("directory of App: \(getAppDirectory())\n")
    print("directory of Docs: \(getDocumentsDirectory())\n")
    
    let folder = "webR-0.0"
 //   let folder = "webR-0.2"
  
    
    let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
    
    if let bundleURL = Bundle.main.url(forResource: "/"+folder, withExtension: "") {

        print("[0] bundleURL: \(bundleURL)\n")
        print("[0] tempDirectoryURL: \(tempDirectoryURL)\n")
            // Create a destination URL.
        let targetURL = tempDirectoryURL.appendingPathComponent(folder).appendingPathExtension("")
            // Copy the folder.
            do {
                try FileManager.default.copyItem(at: bundleURL, to: targetURL)
                print("\n...copyng from: \(bundleURL) to \(targetURL)... ")
                // copy extra file [1]
                
                // https://stackoverflow.com/questions/35761326/save-image-file-to-temp-directory
                
                if let bundleURL1 = URL(string: bundleURL.absoluteString+"libRblas.bin") { // Bundle.main.url(forResource: "/"+folder+"libRblas", withExtension: "bin") {

                        // Create a destination URL.
                    let targetURL1 = tempDirectoryURL.appendingPathComponent(folder+"/libRblas").appendingPathExtension("so")
                    print("[1] targetURL = \(targetURL)\n")
                        // Copy the file.
                        do {
                            try FileManager.default.copyItem(at: bundleURL1, to: targetURL1)
                            print("\n...copyng from: \(bundleURL1) to \(targetURL1)... ")
                            
                            // copy another extra file [2] in a nested way
                            
                            if let bundleURL2 = URL(string: bundleURL.absoluteString+"libRlapack.bin") { // Bundle.main.url(forResource: "/"+folder+"libRlapack", withExtension: "bin") {

                                    // Create a destination URL.
                                let targetURL2 = tempDirectoryURL.appendingPathComponent(folder+"/libRlapack").appendingPathExtension("so")
                                print("[2] targetURL = \(targetURL)\n")
                                    // Copy the file.
                                    do {
                                        try FileManager.default.copyItem(at: bundleURL2, to: targetURL2)
                                        print("\n...copyng from: \(bundleURL2) to \(targetURL2)... ")
                                        return // targetURL2
                                    } catch let error {
                                        NSLog("Unable to copy file: \(error)")
                                    }
                            } else {print("I could not find the file libRlapack.bin at \(Bundle.main.url(forResource: "/"+folder+"libRlapack", withExtension: "bin"))")}
                            
                            
                            // end copying another nested file [2]
                            
                            return // targetURL1
                        } catch let error {
                            NSLog("Unable to copy file: \(error)")
                        }
                } else {print("I could not find the file libRblas.bin at \(Bundle.main.url(forResource: "/"+folder+"libRblas", withExtension: "bin"))")}
                
                // end copying extra file [1]
                return // targetURL0
            } catch let error {
                NSLog("Unable to copy file: \(error)")
            }
    } else {print("I could not find folder webR!!")}

    
} // end setupWebR

func setupSource() {
   
    let srcdir = "src"
    
    let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
    print("\n...ending first copy of webR... following src...\n")
     
     if let bundleURL0 = Bundle.main.url(forResource: "/"+srcdir, withExtension: "") {

         print("[0] bundleURL0: \(bundleURL0)\n")
         print("[0] tempDirectoryURL: \(tempDirectoryURL)\n")
             // Create a destination URL.
         let targetURL0 = tempDirectoryURL.appendingPathComponent(srcdir).appendingPathExtension("")
             // Copy the folder.
             do {
                 try FileManager.default.copyItem(at: bundleURL0, to: targetURL0)
                 print("\n...copyng from: \(bundleURL0) to \(targetURL0)... ")
                 // copy extra files ?? nope!
     return // targetURL0
 } catch let error {
     NSLog("Unable to copy file: \(error)")
 }
} else {print("I could not find folder src!!")}
    
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

func getAppDirectory() -> String {
    
    let path = Bundle.main.resourcePath!
    return path
}



func getAppDirectoryFiles() {
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!

    do {
        let items = try fm.contentsOfDirectory(atPath: path)
  //      print("\npath: \(path)")

        for item in items {
            print("Found \(item)")
        }
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }
}


func getDeviceDirectoryFiles() {
    
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    
    let fm = FileManager.default
    let path = documentsDirectory.absoluteString // Bundle.main.resourcePath!

    do {
        let items = try fm.contentsOfDirectory(atPath: path)
        print("\npath: \(path)")
        

        for item in items {
            print("Found \(item)")
        }
    } catch {
        print("Do you have permission to read this folder???")
        // failed to read directory – bad permissions, perhaps?
    }
}


// let tempDirectoryURL = FileManager.default.temporaryDirectory

func getTemporaryDirectoryFiles() {
    
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    print("contents of documentDirectory: \n \(paths)")
    let documentsDirectory = paths[0]
    print("\n... getting directory \(paths) structure...")
    let fm = FileManager.default
    let path = documentsDirectory.absoluteString // Bundle.main.resourcePath!
    print("\n... getting folder \(path) structure...")
    do {
        let items = try fm.contentsOfDirectory(atPath: path)
        print("\npath: \(path)")
        

        for item in items {
            print("Found \(item)")
        }
    } catch {
        print("Do you have permission to read this folder???")
        // failed to read directory – bad permissions, perhaps?
    }
}




struct RplotViewer: UIViewRepresentable {

//    @Binding var text00: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        let superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
//        superWeb.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
        superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let url = Bundle.main.url(forResource: "Plot_00", withExtension: "pdf", subdirectory: "jor1k/openrisc-sys/fs/root")!
        let urlSettings = url.description+""
        print(urlSettings)
        let url2 = url.deletingLastPathComponent()
        print(url2.description)
        let url3 = URL(string: url2.deletingLastPathComponent().description + "home/user/R.pdf")!
        print(url3.description)
        
       // var fileURL = URL(fileURLWithPath: Bundle.main.path(forResource:"file", ofType: "pdf", inDirectory: "jor1k/openrisc-sys/fs/home/user")!)

       // print(fileURL.description)
        
        do {
                 let   fileURL = try fileURLForBuggyWKWebView8(fileURL: url3)
            print(fileURL.description)
                    superWeb.load(URLRequest(url: fileURL))
                } catch let error as NSError {
                    print("Error: " + error.debugDescription)
                }
        
    
    // superWeb.loadFileURL(url3, allowingReadAccessTo: url3.deletingLastPathComponent())
        
        return superWeb
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
    //    webView.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
    }
    
    /*
     // https://stackoverflow.com/questions/59881415/wkwebview-ignoring-request-to-load-this-main-resource-because-it-is-outside-th
     
    public func loadFileURL(_ URL: URL, allowingReadAccessTo readAccessURL: URL) -> WKNavigation?
    public func loadHTMLString(_ string: String, baseURL: URL?) -> WKNavigation?

     */

 /*
  
  https://stackoverflow.com/questions/24882834/wkwebview-not-loading-local-files-under-ios-8
  */
    
    func fileURLForBuggyWKWebView8(fileURL: URL) throws -> URL {
        // Some safety checks
        if !fileURL.isFileURL {
            throw NSError(
                domain: "BuggyWKWebViewDomain",
                code: 1001,
                userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("URL must be a file URL.", comment:"")])
        }
        try! fileURL.checkResourceIsReachable()

        // Create "/temp/www" directory
        let fm = FileManager.default
        let tmpDirURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("www")
        try! fm.createDirectory(at: tmpDirURL, withIntermediateDirectories: true, attributes: nil)

        // Now copy given file to the temp directory
        let dstURL = tmpDirURL.appendingPathComponent(fileURL.lastPathComponent)
        let _ = try? fm.removeItem(at: dstURL)
        try! fm.copyItem(at: fileURL, to: dstURL)

        // Files in "/temp/www" load flawlesly :)
        return dstURL
    }
    
    
    
    
} // end struct



/*
 
 https://programmingwithswift.com/open-pdf-file-with-swift-pdfkit-wkwebview/
 */

/*
private func resourceUrl(forFileName fileName: String) -> URL? {
    if let resourceUrl = Bundle.main.url(forResource: fileName,
                                         withExtension: "pdf") {
        return resourceUrl
    }
    
    return nil
}

private func createWebView(withFrame frame: CGRect) -> WKWebView? {
    let webView = WKWebView(frame: frame)
    webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    if let resourceUrl = resourceUrl(forFileName: "heaps") {
        webView.loadFileURL(resourceUrl,
                            allowingReadAccessTo: resourceUrl)
        
        return webView
    }
    
    return nil
}

private func displayWebView() {
    if let webView = createWebView(withFrame: self.view.bounds) {
        self.view.addSubview(webView)
    }
}


 
 private func createWebView(withFrame frame: CGRect) -> WKWebView? {
     let webView = WKWebView(frame: frame)
     webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     
     if let resourceUrl = URL(string: "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf") {
         let request = URLRequest(url: resourceUrl)
         webView.load(request)
         
         return webView
     }
     
     return nil
 }
 */





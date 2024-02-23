//
//  LinuxTerm00-v0.1.swift
//  jsLinux++
//
//  Created by Luis Acevedo-Arreguin on 9/30/22.
//


//
//  LinuxCalc00.swift
//  LinuxShell00
//
//  Created by Luis Acevedo-Arreguin on 9/17/22.
//


//
//  StatsCalc01-v0.3.swift
//  LinuxShell00
//
//  Created by Luis Acevedo-Arreguin on 9/15/22.
//


//  StatsCalc01-v0.3.swift
//  R-StatsCalc
//
//  Created by Luis Acevedo-Arreguin on 8/28/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import WebKit
import PDFKit

import QuickLook


import SafariServices



struct LinuxTerminal: UIViewRepresentable {

    @Binding var text00: String
    @Binding var text03A: String
    
    /*
     // working distros:
     
     let url = URL(string: "http://localhost:9080/public/index2.html?url=freedos.cfg&graphic=1")
     
     // on jslinux2022a
     let url = URL(string: "http://localhost:9080/public/index.html?url=alpine-x86.cfg&mem=192")
     let url = URL(string: "http://localhost:9080/public/index.html?url=freedos.cfg&mem=64&graphic=1&w=720&h=400")
     
     let url = URL(string: "http://localhost:9080/public/index2.html?url=freedos.cfg&mem=64&graphic=1")
     let url = URL(string: "http://localhost:9080/public/index3.html?cpu=x86") // Doesn't read the cfg file but reads the associated folder!!  jslinux01; linux2018
     let url = URL(string: "http://localhost:9080/public/index3.html?cpu=riscv64") // jslinux01; linux2018
     let url = URL(string: "http://localhost:9080/public/index3.html?url=root-riscv64.cfg")
     
     */
    /*
     let url = URL(string: "http://localhost:9080/public/index.html?url=root-x86.cfg") // not working ??!!
     
     
    let url = URL(string: "http://localhost:9080/public/index.html?url=alpine-x86-xwin.cfg&mem=256&graphic=1")
     let url = URL(string: "http://localhost:9080/public/index.html?cpu=riscv64&url=fedora33-riscv.cfg&mem=256")
     
     let url = URL(string: "http://localhost:9080/public/index.html?url=win2k.cfg&mem=192&graphic=1")
     
     let url = URL(string: "http://localhost:9080/public/index.html?url=fedora33-riscv-xwin.cfg&mem=256&graphic=1")
     
    */
    
    // Using jslinux-deobfuscated
   // let url = URL(string: "http://localhost:9080/public/index1.html")
    
    // Using jslinux2022a
    // let url = URL(string: "http://localhost:9080/public/index.html?url=alpine-x86.cfg&mem=192")
    // let url = URL(string: "http://localhost:9080/public/index.html?cpu=riscv64&url=fedora33-riscv.cfg&mem=256")
    
    // Using jor1k
     let url = URL(string: "http://localhost:9080/public/index.html")
    
    let htmlUrl = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jslinux01")

    // let server = HttpServer()
    @Binding var getWebView: Bool
    
    
    let pasteboard = UIPasteboard.general
    /*
     pasteboard.string = "Hello, world!"
     
     if let string = pasteboard.string {
         // text was found and placed in the "string" constant
     }
     */
   
    
    func makeUIView(context: Context) -> WKWebView {
        /*
        let superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
        superWeb.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
        superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        */
        
        var superWeb: WKWebView!
        superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
        // superWeb.navigationDelegate = self
        superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // superWeb.widthAnchor.constraint(equalToConstant: 1228).isActive = true
        // superWeb.heightAnchor.constraint(equalToConstant: 228).isActive = true
        
        let url2 = getAppDirectory()
        let publicDir = url2+"/jor1k/"
        
        // let publicDir = url2+"/linux20180923/"
        // let publicDir = url2+"/jslinux2022a/"
        // let publicDir = url2+"/jslinux-deobfuscated/"
        
        
    
        
        return superWeb
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        
        var lastChar: Character = Character(" ")
        var minString: String = " "
        
    //    webView.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil) // DataCamp website
        print("\ninjecting JS into a textarea...")
        print("text00 = \(text00)")
        pasteboard.string = text00
        
        /*
         Change Bool from false to true on Term.js:
         // paste
         document.defaultView.addEventListener("paste",
                                               this.pasteHandler.bind(this), true);
         */
        // The following line provides the terminal screen contents:
   //     let jsMessage1 = "window.document.getElementById(\"term_wrap\").innerText" \\ jslinux01
   //     let jsMessage1 = "window.document.getElementById(\"LinuxShow\").innerText"
     //   let jsMessage1 = "window.document.querySelector(\"body\").innerHTML"  // "showCL(\"\(text00)\")" // "alert()" // showCL(\"\(text00)\")" // "document.getElementById(\"term_wrap\").innerHTML" // console.log('cpu=' + cpu + ' url=' + url + ' mem=' + mem_size);" // "document.getElementById('textarea').innerText;" // ='\(text00)';"
        
        // For jor1k use the following js script to link the terminal and the editor
         //    let jsMessage1 = "window.document.getElementById(\"tty\").innerText"
        // For jslinux systems use the following line to link the terminal and the editor
        let jsMessage1 = "window.document.getElementById(\"term\").innerText"
        
        
        webView.evaluateJavaScript(jsMessage1) { (result, error) in
            if let result = result {
                print("result[1]:",result)
            }
            else {
                print("error[1]:", error as Any)
            }
            
        } // js injection
        // queue_chars(str);
        
        lastChar = "\(text00)".last ?? Character(" ")
        print("lastChar: \(lastChar)\n")
        print("lastChar: \(lastChar.description)\n")
        
        if lastChar == "\n" { minString = "\\n"} else
        if lastChar == "\r" { minString = "\\r"} else
   //     if lastChar == "\b" { minString = "\\b"} else
        if lastChar == "\t" { minString = "\\t"} else {
            minString = String(lastChar)
        }
        
        let jsMessage2 = "text00Char(\"\(minString)\");" // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
        webView.evaluateJavaScript(jsMessage2) { (result, error) in
            if let result = result {
                print("result[2]:",result)
            }
            else {
                print("error[2]:", error as Any)
            }
        } // js injection
        
        if lastChar == "\n" {
            //     let jsMessage3 = "window.document.getElementById(\"term_wrap\").innerText"
          //  let jsMessage3 = "window.document.getElementById(\"LinuxShow\").innerText"
            let jsMessage3 = "window.document.getElementById(\"tty\").innerText"
            webView.evaluateJavaScript(jsMessage3) { (result, error) in
                if let result = result {
                    text03A = "\(result)"
                    print("result[3]:",result)
                }
                else {
                    print("error[3]:", error as Any)
                }
                
            } // js injection
        }
        
        /*
         // The following block allows to enter expressions one line at a time by entering "\n"
        if lastChar == "\n" {
            
            // lastChar = Character("\n") // unexpected EOF
            
        let jsMessage4 = "text00Char(\"\(text00.dropLast())\\n\");" // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
        webView.evaluateJavaScript(jsMessage4) { (result, error) in
            if let result = result {
                text00 = " " // This does not clean the text editor !!
                print("result[4]:",result)
            }
            else {
                print("error[4]:", error as Any)
            }
        } // js injection
            
            
            print("text00 inside if : \(text00)")
        } // end if
         */
        
        print("text00 after if : \(text00)")
        print("\nclipboard: \(pasteboard.string)")
        
        /*
        if getWebView == false {
            
            do {
              try server.stop()
              print("Server has stopped ( port = \(try server.port()) ). Try to connect now...")
            //    runningServer = true
                
        //      semaphore.wait()
            } catch {
              print("Server stop error: \(error)")
             // semaphore.signal()
            } // end catch
        } // end if
        
        */
        
        
    } // end func updateUIView
    
    
 
} // end struct


/*
 https://bellard.org/jslinux/vm.html?url=alpine-x86-xwin.cfg&mem=256&graphic=1
 https://bellard.org/tinyemu/
 https://vfsync.org/
 
 https://vfsync.org/u/os/buildroot-riscv64 // access denied
 https://vfsync.org/u/os/alpine-x86 // access denied
 https://vfsync.org/u/os/fedora33-riscv // access denied
 
 https://vfsync.org/u/os/bbl64.bin
 
 https://bellard.org/jslinux/os/buildroot-riscv64 // nope
 
 https://bellard.org/jslinux/images
 https://bellard.org/jslinux/root-x86.cfg // nope
 https://bellard.org/jslinux/root-x86.bin // nope
 https://bellard.org/jslinux/root-x86/blk // nope
 https://bellard.org/jslinux/riscvemu64.js
 https://bellard.org/jslinux/riscvemu64-wasm.js
 https://bellard.org/jslinux/riscvemu64-wasm.wasm
 https://bellard.org/jslinux/riscvemu32.js
 https://bellard.org/jslinux/riscvemu32-wasm.js
 https://bellard.org/jslinux/riscvemu32-wasm.wasm
 
 https://bellard.org/jslinux/style.css
 https://bellard.org/jslinux/x86emu-wasm.js
 https://bellard.org/jslinux/x86emu-wasm.wasm
 https://bellard.org/jslinux/x86emu.js
 https://bellard.org/jslinux/freedos_v1/blk.txt
 https://bellard.org/jslinux/win2k_v2/blk.txt
 https://bellard.org/jslinux/
 https://bellard.org/tinyemu/
 https://bellard.org/tinyemu/readme.txt
 
 */





/*
 ============================================
 */

struct LinuxTerm: UIViewRepresentable {
   // let url: URL
    
    @Binding var text00: String
    @Binding var text03A: String
    
    @Binding var testJor1k: Bool
    @Binding var getJSLinux: Bool
    @Binding var getKerTeX: Bool
    @Binding var selectedLinux: String
    
    @Binding var getPDF: Bool
    @Binding var getFile1: Bool
    @Binding var plotImage: UIImage
    
    let pasteboard = UIPasteboard.general
    
   // let navigationHelper = WebViewHelper() // original working CODE
    var enableDeveloperTools: Bool = true
    
    // New CODE
    @Binding var currentURL: String
    @ObservedObject var viewModel: ViewModel
    func makeCoordinator() -> Coordinator {
      //  Coordinator(parent: self, text: $text, webTemplate: $webTemplate) // to use with class Coordinator
        Coordinator(parent: self) // to use with final class Coordinator
     }
    // end New CODE

    func makeUIView(context: UIViewRepresentableContext<LinuxTerm>) -> WKWebView {
      
        let configs = WKWebViewConfiguration()
        configs.setValue(true, forKey: "_allowUniversalAccessFromFileURLs")
       // configs.setValue(true, forKey: "allowFileAccessFromFileURLs")
       // configs.setValue(true, forKey: "developerExtrasEnabled")
        let webview = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 1228, height: 0.1), configuration: configs)
     //   let webview = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1), configuration: configs) // WKWebView(frame: .zero, configuration: configs)
        webview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       
        
      //   let webview = WKWebView()
        var urlSettings: String = ""
        
 //       webview.navigationDelegate = navigationHelper // original working CODE
        webview.navigationDelegate = context.coordinator  // new CODE
        webview.configuration.preferences.setValue(enableDeveloperTools, forKey: "developerExtrasEnabled")
        webview.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
      //  webview.configuration.preferences.setValue()
 //       webview.configuration.preferences.setValue(enableDeveloperTools, forKey: "_allowUniversalAccessFromFileURLs")
        
        /*
        let url = URL(string: "http://localhost:9080/public/index.html")
        let request = NSURLRequest(url: url! as URL) as URLRequest
        webview.load(request)
         
         
         
         
         var superWeb: WKWebView!
         superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
         // superWeb.navigationDelegate = self
         superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         // superWeb.widthAnchor.constraint(equalToConstant: 1228).isActive = true
         // superWeb.heightAnchor.constraint(equalToConstant: 228).isActive = true
         
         let url2 = getAppDirectory()
         let publicDir = url2+"/jor1k/"
         
         // let publicDir = url2+"/linux20180923/"
         // let publicDir = url2+"/jslinux2022a/"
         // let publicDir = url2+"/jslinux-deobfuscated/"
         
         
        */
        
        
      //  var url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jslinux01")!
      //  var url = Bundle.main.url(forResource: "vm", withExtension: "html", subdirectory: "jsLinux00")!
      //  var url = Bundle.main.url(forResource: "vm", withExtension: "html", subdirectory: "00alpine")!
        
        
        // features = url.description+"?url=alpine-x86.cfg&mem=192"
        // features = url.description+"?url=freedos.cfg" // &graphic=1"
        // features = url.description+"?cpu=x86"
        
        
        /*
         let url = URL(string: "http://localhost:9080/public/index.html?url=root-x86.cfg") // not working ??!!
         
         let url = URL(string: "http://localhost:9080/public/index.html?url=freedos.cfg&mem=64&graphic=1&w=720&h=400")
        let url = URL(string: "http://localhost:9080/public/index.html?url=alpine-x86-xwin.cfg&mem=256&graphic=1")
         let url = URL(string: "http://localhost:9080/public/index.html?cpu=riscv64&url=fedora33-riscv.cfg&mem=256")
         
         let url = URL(string: "http://localhost:9080/public/index.html?url=win2k.cfg&mem=192&graphic=1")
         
         let url = URL(string: "http://localhost:9080/public/index.html?url=fedora33-riscv-xwin.cfg&mem=256&graphic=1")
         
        */
        
        
        print("testing Linux...")
      //  var url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jslinux-deobfuscated")!
        
        var url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jor1k")!
        
        if testJor1k {
            url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jor1k")!
            urlSettings = url.description+""
        } else
        if getJSLinux {
            print("selectedLinux: \(selectedLinux)")
            url = Bundle.main.url(forResource: "vm", withExtension: "html", subdirectory: "jsLinux00")!
            urlSettings = url.description+"?"+selectedLinux+""
            
        } else
            if getKerTeX {
                url = Bundle.main.url(forResource: "vm", withExtension: "html", subdirectory: "JSLinuxKTeX")!
                urlSettings = url.description+"?url=alpine-x86-xwin.cfg&mem=256&graphic=1&guest_url=kertex/pub"
            } else {
                /*
                url = Bundle.main.url(forResource: "vm", withExtension: "html", subdirectory: "JSLinuxKTeX")!
                urlSettings = url.description+"?url=alpine-x86-xwin.cfg&mem=256&graphic=1&guest_url=kertex/pub"
                 
            url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jslinux-deobfuscated")!
            urlSettings = url.description+"?cpu=x86"
                 */
                url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jor1k")!
                urlSettings = url.description+""
        }
        
        
        print("...after selecting Linux...")
        print("url: \(url)\n")
        print("urlsettings: \(urlSettings)")
        
        url = URL(string: urlSettings)!
        print(urlSettings)
        
        webview.loadFileURL(url, allowingReadAccessTo: url) // .deletingLastPathComponent())
   //     let request = URLRequest(url: url)
   //     webview.load(request)
        
        print("inside webview make function...")
        webview.allowsBackForwardNavigationGestures = true
        

    
        return webview
        }  // end func makeUIView
    
    
    

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<LinuxTerm>) {
     //   let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
     //   webview.load(request)
        
        var lastChar: Character = Character(" ")
        var minString: String = " "
        var word: String = ""
        
    //    webView.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil) // DataCamp website
        print("\ninjecting JS into a textarea...")
        print("text00 = \(text00)")
        pasteboard.string = text00
        
         var jsMessage1 = "window.document.getElementById(\"tty\").innerText"
        
        if testJor1k {
            jsMessage1 = "window.document.getElementById(\"tty\").innerText"
        } else
        if getJSLinux {
            jsMessage1 = "window.document.getElementById(\"term_wrap\").innerText"
        } else
        if getKerTeX {
            jsMessage1 = "window.document.getElementById(\"term_wrap\").innerText"
        } else {
            jsMessage1 = "window.document.querySelector(\"table\").innerText"
        }
        
   webview.evaluateJavaScript(jsMessage1) { (result, error) in
       if let result = result {
           print("result[1]:",result)
       }
       else {
           print("error[1]:", error as Any)
       }
       

       
   } // js injection
   // queue_chars(str);
   
   lastChar = "\(text00)".last ?? Character(" ")
   print("lastChar: \(lastChar)\n")
   print("lastChar: \(lastChar.description)\n")
   
        
        if lastChar == "A" {
            word = String(text00.suffix(3))
            print("word = \(word)")
            minString = "A"
            if String(word.prefix(2)) == "\u{1b}[" { minString = "\u{1b}[A"}
        } else
        if lastChar == "B" {
            word = String(text00.suffix(3))
            print("word = \(word)")
            minString = "B"
            if String(word.prefix(2)) == "\u{1b}[" { minString = "\u{1b}[B"}
        } else
        if lastChar == "C" {
            word = String(text00.suffix(3))
            print("word = \(word)")
            minString = "C"
            if String(word.prefix(2)) == "\u{1b}[" { minString = "\u{1b}[C"}
        } else
        if lastChar == "D" {
            word = String(text00.suffix(3))
            print("word = \(word)")
            minString = "D"
            if String(word.prefix(2)) == "\u{1b}[" { minString = "\u{1b}[D"}
        } else
   if lastChar == "\n" { minString = "\\n"} else
   if lastChar == "\r" { minString = "\\r"} else
//     if lastChar == "\b" { minString = "\\b"} else
   if lastChar == "\t" { minString = "\\t"} else {
       minString = String(lastChar)
   }
   
   let jsMessage2 = "text00Char(\"\(minString)\");" // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
   webview.evaluateJavaScript(jsMessage2) { (result, error) in
       if let result = result {
           print("result[2]:",result)
       }
       else {
           print("error[2]:", error as Any)
       }
   } // js injection
   
   if lastChar == "\n" {
       //     let jsMessage3 = "window.document.getElementById(\"term_wrap\").innerText"
     //  let jsMessage3 = "window.document.getElementById(\"LinuxShow\").innerText"
       // For jor1k use the following js script to link the terminal and the editor
        //    let jsMessage1 = "window.document.getElementById(\"tty\").innerText"
       // For jslinux systems use the following line to link the terminal and the editor
      // let jsMessage3 = "window.document.querySelector(\"table\").innerText"
       
       var jsMessage3 = "window.document.getElementById(\"tty\").innerText"
       
       if testJor1k {
           jsMessage1 = "window.document.getElementById(\"tty\").innerText"
       } else
       if getJSLinux {
           jsMessage3 = "window.document.getElementById(\"term_wrap\").innerText"
       } else
       if getKerTeX {
           jsMessage1 = "window.document.getElementById(\"term_wrap\").innerText"
       } else {
           jsMessage3 = "window.document.querySelector(\"table\").innerText"
       }
       
       webview.evaluateJavaScript(jsMessage3) { (result, error) in
           if let result = result {
               text03A = "\(result)"
               print("result[3]:",result)
           }
           else {
               print("error[3]:", error as Any)
           }
           
       } // js injection
   } // end if
        
        print("text00 after if : \(text00)")
        print("\nclipboard: \(pasteboard.string)")

        if getPDF {
            
       //     let jsMessage0 = "download('/home/user', 'R.pdf', 'application/pdf');"
       //     let jsMessage0 = "window.jor1k.fs.PDF(window.document.getElementById(\"loadPath\").value)"
            let jsMessage0 =   "text00pdf();"
            
            webview.evaluateJavaScript(jsMessage0)
                                                        { (result, error) in
                if let result = result {
                    print("result[1]:",result)
                }
                else {
                    print("error[1]:", error as Any)
                }
                                                        
        }
            print("\n Current webURL showing PDF: \n")
            print(webview.url as Any)
         //   currentURL = webview.url!.description
            

            
            // https://stackoverflow.com/questions/35406976/how-to-capture-a-full-page-screenshot-of-wkwebview
            
            let rect = CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height*0.822/2+82.2
                
               // width: 228,
               //  height: 228
            )

            let configuration = WKSnapshotConfiguration()

            configuration.rect = rect

            if #available(iOS 13.0, *) {
                configuration.afterScreenUpdates =  true
            }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            webview.takeSnapshot(with: configuration) { (snapshotImage, error) in
                guard let snapshotImage = snapshotImage else {
                    //[Potential error handling...]
                    print("error: \(error)")
                    return
                }
                
                plotImage = snapshotImage
            

               // [Do something with the image]
                print("snapshot taken: \(snapshotImage)")
              //  UIImageWriteToSavedPhotosAlbum(snapshotImage, nil, nil, nil) // app crashes!!
                ImageSaver(image: snapshotImage) {
                 print("Save completed!")
                         } onFail: { _ in
                 print("error: \(error?.localizedDescription)")
                }
                
            }
            
                } // end queue
            
            
            /*
             
             https://stackoverflow.com/questions/65997361/swift-create-pdf-with-wkwebviews-createpdf
             */
            
            if let downloadDir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first {
                        let savePath = downloadDir.appendingPathComponent("R").appendingPathExtension("pdf")
                        
            let pdfConfiguration = WKPDFConfiguration()
            pdfConfiguration.rect = CGRect(x: 0, y: 0,
                                           width: UIScreen.main.bounds.width,
                                           height: UIScreen.main.bounds.height*0.822
                                           )
                                           // width: 595.28, height: 841.89)
            
                
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
              
                
                webview.createPDF(configuration: pdfConfiguration) { result in
                              switch result {
                              
                              case .success(let data):
                                  do {
                                      try data.write(to: savePath)
                                      print("Successfully created and saved pdf…")
                                  } catch let error {
                                      print("Could not _save_ pdf: \(error)")
                                  }
                              case .failure(let error):
                                  print("Could not create pdf: \(error)")
                              }
                          }
                      } // end queue
            } // end downloadDir
            
            
            
            
                
            getPDF = false
            
        } // end getPDF
        
        

    } // end func updateUIView
    
  
/*
    func goBack(_ webview: WKWebView) { // }, context: UIViewRepresentableContext<LinuxTerm>){
        webview.goBack()
    }

    func goForward(_ webview: WKWebView) { // }, context: UIViewRepresentableContext<LinuxTerm>){
        webview.goForward()
    }
    

    
    
    func reloadTabAction(_ webview: WKWebView) {
        let originalURL = URL(string: "https://s-macke.github.io/jor1k/demos/main.html?user=eQPDaJ08TF&cpu=asm&n=1&relayURL=wss%3A%2F%2Frelay.widgetry.org%2F")
        /*
        let originalURL = URL(string: "http://localhost:9080/public/index.html?url=alpine-x86-xwin.cfg&mem=256")
         */
        
        if  webview.url != nil {
            webview.reload()
        } else {
            webview.load(URLRequest(url: originalURL!))
        }
        
    }
 */
    
}


// new CODE
class Coordinator: NSObject, WKNavigationDelegate {
    
    
     var parent: LinuxTerm

     init(parent: LinuxTerm) {
         self.parent = parent
     }
    var webViewOptionsSubscriber: AnyCancellable?
    
    deinit {
      webViewOptionsSubscriber?.cancel()
    }
    
    // New CODE:
    
    var documentPreviewController = QLPreviewController()
    var documentUrl = URL(fileURLWithPath: "")
    var documentDownloadTask: URLSessionTask?
    
    // initial configuration of custom JavaScripts
   // webViewConfiguration.userContentController = userContentController.default()
    // webViewConfiguration.websiteDataStore = WKWebsiteDataStore.default()


     // init this view controller to receive JavaScript callbacks
   //  userContentController.add(self, name: "openDocument")
   //  userContentController.add(self, name: "jsError")


     // QuickLook document preview
   //  documentPreviewController.dataSource  = self
    // end New CODE
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webViewOptionsSubscriber = parent.viewModel.webViewOptionsPublisher.sink(receiveValue: { webViewOption in
          // create a switch statement for each of the different options
            switch webViewOption {
            case .back:
              if webView.canGoBack {
                webView.goBack()
              }
            case .forward:
              if webView.canGoForward {
                webView.goForward()
              }
            case .share:
                self.parent.viewModel.shouldShowShareSheet = true
            case .refresh:
              webView.reload()
            case .stop:
              webView.stopLoading()
            }
            
        })
    } // end func webView
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webview didFinishNavigation")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("webviewDidCommit")
    }
    

    /*
     
     https://developer.apple.com/forums/thread/99027
     
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

      if let urlStr = navigationAction.request.url?.absoluteString {
        print(urlStr)
      }

      decisionHandler(.allow)
    }
     */
    
    
    /*
     
     https://developer.apple.com/forums/thread/108394
     */
    // WKWebView option
    
    private func loadAndDisplayDocumentFrom(url downloadUrl : URL) {
        let localFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(downloadUrl.lastPathComponent)

            debugPrint("Downloading document from url=\(downloadUrl.absoluteString)")
            URLSession.shared.dataTask(with: downloadUrl) { data, response, err in
                guard let data = data, err == nil else {
                    debugPrint("Error while downloading document from url=\(downloadUrl.absoluteString): \(err.debugDescription)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    debugPrint("Download http status=\(httpResponse.statusCode)")
                }

                // write the downloaded data to a temporary folder
                do {
                    try data.write(to: localFileURL, options: .atomic)   // atomic option overwrites it if needed
                    debugPrint("Stored document from url=\(downloadUrl.absoluteString) in folder=\(localFileURL.absoluteString)")
                    
                    DispatchQueue.main.async {
                        self.documentUrl = localFileURL
                        self.documentPreviewController.refreshCurrentPreviewItem()
             //           self.present(self.documentPreviewController, animated: true, completion: nil)
                    }
                } catch {
                    debugPrint(error)
                    return
                }
            }.resume()
        } // end func load and display
    
  

    
    // JS option
    /*
     Open downloaded document in QuickLook preview
     */
    private func previewDocument(messageBody: String) {
        // messageBody is in the format ;data:;base64,
        
        // split on the first ";", to reveal the filename
        let filenameSplits = messageBody.split(separator: ";", maxSplits: 1, omittingEmptySubsequences: false)
        
        let filename = String(filenameSplits[0])
        
        // split the remaining part on the first ",", to reveal the base64 data
        let dataSplits = filenameSplits[1].split(separator: ",", maxSplits: 1, omittingEmptySubsequences: false)
        
        let data = Data(base64Encoded: String(dataSplits[1]))
        
        if (data == nil) {
            debugPrint("Could not construct data from base64")
            return
        }
        
        // store the file on disk (.removingPercentEncoding removes possible URL encoded characters like "%20" for blank)
        let localFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(filename.removingPercentEncoding ?? filename)
        
        do {
            try data!.write(to: localFileURL);
        } catch {
            debugPrint(error)
            return
        }
        
        // and display it in QL
        DispatchQueue.main.async {
            self.documentUrl = localFileURL
            self.documentPreviewController.refreshCurrentPreviewItem()
        //    self.present(self.documentPreviewController, animated: true, completion: nil)
        }
    }
    
    
    /*
     Handler method for JavaScript calls.
     Receive JavaScript message with downloaded document
     */
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        debugPrint("did receive message \(message.name)")


        if (message.name == "openDocument") {
            previewDocument(messageBody: message.body as! String)
        } else if (message.name == "jsError") {
            debugPrint(message.body as! String)
        }
    }
    
    
    /*
     Checks if the given url points to a document download url
     */
    private func openInDocumentPreview(_ url : URL) -> Bool {
    // this is specific for our application - can be everything in your application
     //   return url.absoluteString.contains("/APP/connector")
        print("... checking file type ... ")
        return url.absoluteString.contains("blob:file:///")
    }
    
    
    /*
     Intercept the download of documents in webView, trigger the download in JavaScript and pass the binary file to JavaScript handler in Swift code
     */
    private func executeDocumentDownloadScript(_ webView: WKWebView, forAbsoluteUrl absoluteUrl : String) {
        // TODO: Add more supported mime-types for missing content-disposition headers
        webView.evaluateJavaScript("""
            (async function download() {
                const url = '\(absoluteUrl)';
                try {
                    // we use a second try block here to have more detailed error information
                    // because of the nature of JS the outer try-catch doesn't know anything where the error happended
                    let res;
                    try {
                        res = await fetch(url, {
                            credentials: 'include'
                        });
                    } catch (err) {
                        window.webkit.messageHandlers.jsError.postMessage(`fetch threw, error: ${err}, url: ${url}`);
                        return;
                    }
                    if (!res.ok) {
                        window.webkit.messageHandlers.jsError.postMessage(`Response status was not ok, status: ${res.status}, url: ${url}`);
                        return;
                    }
                    const contentDisp = res.headers.get('content-disposition');
                    if (contentDisp) {
                        const match = contentDisp.match(/(^;|)\\s*filename=\\s*(\"([^\"]*)\"|([^;\\s]*))\\s*(;|$)/i);
                        if (match) {
                            filename = match[3] || match[4];
                        } else {
                            // TODO: we could here guess the filename from the mime-type (e.g. unnamed.pdf for pdfs, or unnamed.tiff for tiffs)
                            window.webkit.messageHandlers.jsError.postMessage(`content-disposition header could not be matched against regex, content-disposition: ${contentDisp} url: ${url}`);
                        }
                    } else {
                        window.webkit.messageHandlers.jsError.postMessage(`content-disposition header missing, url: ${url}`);
                        return;
                    }
                    if (!filename) {
                        const contentType = res.headers.get('content-type');
                        if (contentType) {
                            if (contentType.indexOf('application/pdf') === 0) {
                                filename = 'unnamed.pdf';
                            } else if (contentType.indexOf('image/tiff') === 0) {
                                filename = 'unnamed.tiff';
                            }
                        }
                    }
                    if (!filename) {
                        window.webkit.messageHandlers.jsError.postMessage(`Could not determine filename from content-disposition nor content-type, content-dispositon: ${contentDispositon}, content-type: ${contentType}, url: ${url}`);
                    }
                    let data;
                    try {
                        data = await res.blob();
                    } catch (err) {
                        window.webkit.messageHandlers.jsError.postMessage(`res.blob() threw, error: ${err}, url: ${url}`);
                        return;
                    }
                    const fr = new FileReader();
                    fr.onload = () => {
                        window.webkit.messageHandlers.openDocument.postMessage(`${filename};${fr.result}`)
                    };
                    fr.addEventListener('error', (err) => {
                        window.webkit.messageHandlers.jsError.postMessage(`FileReader threw, error: ${err}`)
                    })
                    fr.readAsDataURL(data);
                } catch (err) {
                    // TODO: better log the error, currently only TypeError: Type error
                    window.webkit.messageHandlers.jsError.postMessage(`JSError while downloading document, url: ${url}, err: ${err}`)
                }
            })();
            // null is needed here as this eval returns the last statement and we can't return a promise
            null;
        """) { (result, err) in
            if (err != nil) {
                debugPrint("JS ERR: \(String(describing: err))")
            }
        }
    }
    
    // end New CODE
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        print("\n Current webURL before request: \n")
        print(webView.url as Any)
        
        if let urlStr = navigationAction.request.url { // }.absoluteString {
            print("\n current page URL = ", urlStr.absoluteString)
            parent.currentURL = urlStr.absoluteString
            
            
             
             let jsMessage0 =   "var blobdat = document.documentElement.innerHTML; blobdat"
             
             webView.evaluateJavaScript(jsMessage0)
                                                         { (result, error) in
                 if let result = result {
                     print("result[blob]:",result)
                 }
                 else {
                     print("error[blob]:", error as Any)
                 }
                                                         
         }
            /*
             
             let s = URLSession.shared
            let u = urlStr // .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed) //stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
             
             let t = s.dataTask(with: u) { (d: Data?, r: URLResponse?, e:Error?) in
               //      if e != nil {
                             print("error: \(e)")
               //      }
                 print("undecoded Data: \(d)")
                     let decoded = String(data: d!, encoding: .utf8)
                     print("decoded Data: \(decoded)")
                     print("url Response: \(r)")
                     print("Breakpoint")
             }.resume()
            print("scheme= \(urlStr.scheme)")
            
            let parsed = urlStr.absoluteString.replacingOccurrences(of: "blob:", with: "")
            print("new path= \(parsed)")
            print("bytes= \(URL(string: parsed)?.resourceBytes)")
            print("data-text= \(urlStr.lines)")
        //    print("data= \(urlStr.bookmarkData(options: <#T##URL.BookmarkCreationOptions#>, includingResourceValuesForKeys: <#T##Set<URLResourceKey>?#>, relativeTo: <#T##URL?#>))")
          //  urlStr = URL(string: parsed)!
            */
            let data = try? Data(contentsOf: urlStr)
            debugPrint("data-blob: \(data?.base64EncodedData())")
            
            let localFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(urlStr.absoluteString)//.lastPathComponent)

                debugPrint("Downloading document from url=\(urlStr.absoluteString)")
                URLSession.shared.dataTask(with: urlStr) { data, response, err in
                    guard let data = data, err == nil else {
                        debugPrint("Error while downloading document from url=\(urlStr.absoluteString): \(err.debugDescription)")
                        return
                    }
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        debugPrint("Download http status=\(httpResponse.statusCode)")
                    }

                    // write the downloaded data to a temporary folder
                    do {
                        try data.write(to: localFileURL, options: .noFileProtection)   // atomic option overwrites it if needed
                        debugPrint("Stored document from url=\(urlStr.absoluteString) in folder=\(localFileURL.absoluteString)")
                        self.parent.currentURL = localFileURL.absoluteString
                    } catch {
                        debugPrint(error)
                        return
                    }
                }.resume()
            
            
            
            
            if parent.getPDF {
            if (openInDocumentPreview(urlStr)) {
              //  decisionHandler(.cancel)
              //  executeDocumentDownloadScript(webView, forAbsoluteUrl: urlStr.absoluteString)
                print("... opening document preview...")
                let documentUrl = urlStr //?.appendingPathComponent(navigationResponse.response.suggestedFilename!)
                loadAndDisplayDocumentFrom(url: documentUrl)
                decisionHandler(.cancel)
                
                  } else {
                      
                      print("not allowed if getPDF is true")
            //      decisionHandler(.allow)
                  }
        } // end if getPDF
            
        }
        
        print("\n Current webURL after request: \n")
        print(webView.url as Any)
        // decisionHandler(.allow)
        /*
         
         Clicking button...true ...
         testing Linux...
         ...after selecting Linux...
         url: file:///private/var/containers/Bundle/Application/26508FFF-6802-4022-B434-ABA52108642A/R-StatsCalc.app/jor1k/index.html

         urlsettings: file:///private/var/containers/Bundle/Application/26508FFF-6802-4022-B434-ABA52108642A/R-StatsCalc.app/jor1k/index.html
         file:///private/var/containers/Bundle/Application/26508FFF-6802-4022-B434-ABA52108642A/R-StatsCalc.app/jor1k/index.html
         inside webview make function...

         injecting JS into a textarea...
         text00 = # R-StatsCalc - ver: 0.3
         # Powered by DataCamp #
         lastChar:

         lastChar:

         text00 after if : # R-StatsCalc - ver: 0.3
         # Powered by DataCamp #

         clipboard: Optional("# R-StatsCalc - ver: 0.3\n# Powered by DataCamp # ")

          current page URL =  file:///private/var/containers/Bundle/Application/26508FFF-6802-4022-B434-ABA52108642A/R-StatsCalc.app/jor1k/index.html
         2023-02-05 18:52:42.609304-0800 R-StatsCalc[57900:2948069] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Completion handler passed to -[R_StatsCalc.Coordinator webView:decidePolicyForNavigationAction:decisionHandler:] was called more than once'
         *** First throw call stack:
         (0x1a60d1288 0x1bedcb744 0x1a6128390 0x1b4ebfcd4 0x1b50c7060 0x10017189c 0x10017179c 0x10017184c 0x1b50c0bb8 0x1b52d2d1c 0x1b52d1af8 0x1b52d1958 0x1b5646ae0 0x1b50976f8 0x1b52f8714 0x1b508afec 0x1b508a7f8 0x1b12dd9c4 0x1b12de760 0x1a60f3414 0x1a61041a0 0x1a603d694 0x1a604305c 0x1a6056bc8 0x1c218a374 0x1a89c6648 0x1a8747d90 0x1adea8f24 0x1addd6e08 0x1addb80f4 0x100180324 0x1001803d4 0x100369ce4)
         libc++abi: terminating with uncaught exception of type NSException
         dyld4 config: DYLD_LIBRARY_PATH=/usr/lib/system/introspection DYLD_INSERT_LIBRARIES=/Developer/usr/lib/libBacktraceRecording.dylib:/Developer/usr/lib/libMainThreadChecker.dylib:/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib
         *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Completion handler passed to -[R_StatsCalc.Coordinator webView:decidePolicyForNavigationAction:decisionHandler:] was called more than once'
         terminating with uncaught exception of type NSException
         (lldb)
         
         */
        
 /*
        if navigationAction.request.url?.scheme == "blob" {
         //   UIApplication.shared.openURL(navigationAction.request.url!)
            decisionHandler(.download)
        } else
 
  */
        if navigationAction.request.url?.pathExtension == ".pdf" {

            decisionHandler(.download)
            print("webviewDidDecidePolicyOnPDF")

        } else
        if navigationAction.request.url?.pathExtension == ".tar" {

            decisionHandler(.download)
            print("webviewDidDecidePolicyOnTAR")

        } else

        if navigationAction.request.url?.pathExtension == ".bin" {

            decisionHandler(.download)
            print("webviewDidDecidePolicyOnBin")

        } else {

           // print(".. decison handler not allowed to be .allow ")
            
                decisionHandler(.allow)

        }

    }


func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

 /*
    if navigationResponse.response.mimeType == "application/pdf" { // "application/word" {

        decisionHandler(.download)
        print("webviewDidDecidePolicyOnFileType")

    } else
    if navigationResponse.response.mimeType == "application/x-tar" { // "application/word" {

        decisionHandler(.download)
        print("webviewDidDecidePolicyOnFileType")

    } else
     
  */
    if navigationResponse.response.mimeType == "application/octet-stream" { // "application/word" {

        decisionHandler(.download)
        print("webviewDidDecidePolicyOnFileType")

    }
    
    /*
     //Thread 1: "Completion handler passed to -[R_StatsCalc.Coordinator webView:decidePolicyForNavigationResponse:decisionHandler:] was called more than once"
     */
    else {

        decisionHandler(.allow)

    }
     

}



    @objc func handleRefresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }
    
 } // end final class end New CODE





 class WebViewHelper: NSObject, WKNavigationDelegate {
    
    // new CODE
    var parent: LinuxTerm
    var webViewOptionsSubscriber: AnyCancellable?
    
    init(parent: LinuxTerm) {
        self.parent = parent
    }
    
    // end new CODE
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webview didFinishNavigation")
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
        
        
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("webviewDidCommit")
    }
    
 
    /*
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       decisionHandler(.allow)
        print("webviewDidDecidePolicy")
    }
     */
    
    // early decision per URL

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {



            if navigationAction.request.url?.pathExtension == ".bin" {

                decisionHandler(.download)
                print("webviewDidDecidePolicyOnBin")

            } else {

                decisionHandler(.allow)
 
            }

        }


    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        if navigationResponse.response.mimeType == "application/octet-stream" { // "application/word" {

            decisionHandler(.download)
            print("webviewDidDecidePolicyOnFileType")

        } else {

            decisionHandler(.allow)
 
        }

    }
    
    
/*
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print("didReceiveAuthenticationChallenge")
        completionHandler(.performDefaultHandling, nil)
    }

    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust  else {
            completionHandler(.useCredential, nil)
            return
        }
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
        
    }
 */
    
}  // end struct Webview


/*
 
 https://news.ycombinator.com/item?id=6399091
 https://embed.plnkr.co/C1BoW7lPIaKzXehzeKQ6/
 
 https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview
 https://www.hackingwithswift.com/articles/112/the-ultimate-guide-to-wkwebview
 
 https://swiftobc.com/repo/SwiftWebUI-SwiftWebUI-swift-swiftui-app
 
 https://book.hacktricks.xyz/mobile-pentesting/ios-pentesting/ios-webviews
 
 https://stackoverflow.com/questions/59083340/how-to-download-files-in-wkwebview
 https://stackoverflow.com/questions/24882834/wkwebview-not-loading-local-files-under-ios-8
 https://stackoverflow.com/questions/49638653/load-local-web-files-resources-in-wkwebview
 https://stackoverflow.com/questions/24570124/enable-web-inspector-on-a-webview-in-swift
 https://developer.apple.com/forums/thread/657413
 
 */



// ===========================================================================================

// In-App Custom Keyboard
// IMPORTANT: Embed this struct into a VStack block or possibly a NavigationView block

struct ShellEditor: UIViewRepresentable {
    
    @Binding var consoleMode: Bool
    @Binding var consoleBackground: Bool
    @Binding var text01: String
    
    @Binding var text03B: String
    
    @Binding var capsLockOn: Bool
 //   let url = URL(string: "http://localhost:9080/public/index.html") // http://localhost:4000")
 //   let htmlUrl = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "jslinux01")

    

    func makeUIView(context: Context) -> UITextView {
     
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        // stackView.frame = bounds
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        
   //     stackView.addArrangedSubview(superWeb)
        
        
        let view = UITextView(frame: .zero) // (frame: CGRect(x: 0, y: 0, width: 0, height: 0)) // (frame: CGRect(x: 10, y: 0, width: 1000, height: 0))
        view.delegate = context.coordinator
        
        view.font = UIFont(name: "Courier", size: 22)
        if consoleBackground {
            view.backgroundColor = .black
            view.textColor = .white

        } else {
            view.backgroundColor = .systemGray5
            view.textColor = .black
        }
        view.backgroundColor = .systemGray5
        view.textColor = .black
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.cornerRadius = 8
   
        view.addRButtonsOnKeyboard()
        
        // The following line activates a screen for the tiny keyboard
        stackView.addArrangedSubview(view)
        
        
        let scrollView = UIScrollView(frame: .zero) // ()
        scrollView.contentSize = CGSize(width: 1228, height: 0)  // .init(width: 700, height: 50)

        scrollView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth , UIView.AutoresizingMask.flexibleRightMargin]

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true; // false;
        scrollView.showsHorizontalScrollIndicator = true; // false;
        scrollView.isDirectionalLockEnabled = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = false
        scrollView.isPagingEnabled = false
        scrollView.zoomScale = .greatestFiniteMagnitude   // 2.0
        scrollView.contentInsetAdjustmentBehavior = .never // .scrollableAxes // .always // .automatic // .never
     
        scrollView.delegate = scrollView.self as? UIScrollViewDelegate // context.coordinator
     
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefresh),
                                          for: .valueChanged)
        
 
        
        var kView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
        
 //       kView = AlphaNumericKeyboard(target: view)
        kView = AlphaNumericKeyboard2(target: view, capsLock: capsLockOn)

     
        kView.backgroundColor = .yellow
        kView.contentMode = .scaleAspectFill
        kView.clipsToBounds = true
        kView.translatesAutoresizingMaskIntoConstraints = false
        // The following parameters define the dimensions of the scrolling keyboard
        kView.widthAnchor.constraint(equalToConstant: 1228).isActive = true
        kView.heightAnchor.constraint(equalToConstant: 288).isActive = true

        scrollView.addSubview(kView)

        stackView.addArrangedSubview(scrollView)
      
        // The following view possibly prevents from the system keyboard to show up (recursive formula?)
        view.inputView = stackView // it shows the keyboard at the right place
        
        return view
    } // end func makeView
    

    func makeCoordinator() -> Coordinator {
      //  Coordinator(parent: self, text: $text, webTemplate: $webTemplate) // to use with class Coordinator
        Coordinator(parent: self) // to use with final class Coordinator
     }

    func updateUIView(_ uiView: UITextView, context: Context) {

        if consoleBackground {
            uiView.backgroundColor = .systemGray5
            uiView.textColor = .black
        } else {
            uiView.backgroundColor = .black
            uiView.textColor = .white
        }
 
    }
    


    
//} // end struc // the struct has to contain the class coordinator

 
  // https://onmyway133.com/posts/how-to-use-uitextview-in-swiftui/
  
  final class Coordinator: NSObject, UITextViewDelegate {
      
      
       let parent: ShellEditor

       init(parent: ShellEditor) {
           self.parent = parent
       }

      func textViewDidChange(_ textView: UITextView)  {
           if textView.text != parent.text01 {
  //             parent.text = textView.text // compiler warning: do not modify state variables here!
           }
          if parent.consoleMode {
          //    print("Hello...")
              parent.text01 = textView.text
              // The following if-block resets the textview when user enters "\n"
              // If the user enters "\n" twice, the textview recovers the Linux Shell most recent screen !!
              if parent.text01.last == "\n" {
                  textView.text = parent.text03B
            
                //  parent.text01 = parent.text03B
              }
          }
 
          
       }

      @objc func handleRefresh(sender: UIRefreshControl) {
          sender.endRefreshing()
      }
      
   } // end final class
  
  

    
 } // end struct ??
    



// More sources of information for code debugging:

/*

// wkwebview inspector:
 https://developer.apple.com/forums/thread/657413

 https://www.appsloveworld.com/swift/100/3/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard
 
 
 https://github.com/datacamp/datacamp-light/issues/103
 https://github.com/datacamp/datacamp-light/issues/164
 https://github.com/datacamp/datacamp-light/issues/154
 https://github.com/datacamp/datacamp-light/issues/99
 https://github.com/datacamp/datacamp-light/issues/54
 https://github.com/datacamp/datacamp-light/issues/21
 https://github.com/datacamp/datacamp-light/issues
 
 
 https://github.com/datacamp/tutorial
 https://gist.github.com/mhughes2k/065f7e02c5b29fde475e85f8f264c1fc
 
 https://cdn.datacamp.com/dcl-react-prod/index.html#tutorial-customizing-integrating
 
 https://github.com/ronreiter/interactive-tutorials
 
 https://stackoverflow.com/questions/73314364/wkwebview-viewportsizing-logs-in-swiftui
 https://stackoverflow.com/questions/59587229/using-webkit-in-swiftui-hides-keyboard-when-view-updates
 https://stackoverflow.com/questions/68773023/inputaccessoryview-api-error-uikbcompatinputview-uiviewnointrinsicmetric-si
 
 https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview
 
 https://tutorialmeta.com/question/wkwebview-update-html-tags-from-swiftui-textfields
 

*/







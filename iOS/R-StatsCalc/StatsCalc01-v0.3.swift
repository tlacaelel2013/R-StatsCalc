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
import SafariServices

func htmlUpdate1(codeText: String) -> String {
    
    
    let webTemplate_update =
    """
        <!DOCTYPE html>
    <html>
      <head>
        <title>WebR Test Console</title>
      </head>
      <body>

        <div>
          <pre><code id="out">Loading webR, please wait...</code></pre>
          <input spellcheck="false" autocomplete="off" id="input" type="text">
          <button onclick="globalThis.sendInput()" id="run">Run</button>
        </div>
        <div>
          <canvas width="500" height="500" id="plot-canvas"></canvas>
        </div>
        
        <script type="module">
          /* Create a webR console using the Console helper class */
          import { Console } from 'https://webr.r-wasm.org/latest/webr.mjs';

        
          var canvas = document.getElementById("plot-canvas")
          var ctx = canvas.getContext('2d');
          const webRConsole = new Console({
            stdout: line => document.getElementById('out').append(line + '\n'),
            stderr: line => document.getElementById('out').append(line + '\n'),
            prompt: p => document.getElementById('out').append(p),
            canvasImage: ci => ctx.drawImage(ci, 0, 0),
            canvasNewPage: () => ctx.reset(),
          });
          webRConsole.run();


                await webRConsole.stdin("options(device=webr::canvas(250, 250))");

          /* Write to the webR console using the ``stdin()`` method */
          let input =  document.getElementById('input');
          globalThis.sendInput = () => {
            webRConsole.stdin(input.value);
            document.getElementById('out').append(input.value + '\n');
            input.value = "";
          }

          /* Send input on Enter key */
          input.addEventListener(
            "keydown",
            (evt) => {if(evt.keyCode === 13) globalThis.sendInput()}
          );

          
        </script>

      </body>
    </html>
    """
    return webTemplate_update
} // end function htmlUpdate1


func htmlUpdate2(codeText: String) -> String {
    
    
    let webTemplate_update =
    """
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>DataCamp Light | Terminal: Minimalist Setting</title>
    <script async src="https://cdn.datacamp.com/dcl-react.js.gz"></script>
    </head>
    <body>
    <div class="input">
    <div class="title">
      <h3>R Editor and Shell from DataCamp</h3>
    </div>
    <div data-datacamp-exercise data-lang="revo" data-height="100" id="R-StatsCalc" data-show-run-button="true" data-no-lazy-load="true">
    <code data-type="pre-exercise-code">
    </code>
    <code data-type="sample-code">
        \(codeText)
    </code>

    </div>
    </div>
    </body>
    </html>

    """
    
   // webTemplate = webTemplate_update
 return webTemplate_update

} // end function


// ===========================================================================================

@available(iOS 13.0, *)
struct WebRSite: UIViewRepresentable {
    
    
    let url = URL(string: "http://localhost:9822/public/index1.html")
//  let url = URL(string: "http://localhost:9822/public/webR-0.2/index1.html") // http://localhost:4000")
let htmlUrl = Bundle.main.url(forResource: "index1", withExtension: "html", subdirectory: "webR-0.0")

    @Binding var text00: String
    @Binding var server00: HttpServer
    @Binding var flag1: Bool
    @Binding var flag2: Bool
//    @Binding var flag3: Bool
    

//    @Binding var text00: String
    
    func makeUIView(context: Context) -> WKWebView {
        var superWeb: WKWebView!
        superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
        superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
 //       let url2 = getAppDirectory()+"/"
        let url2 = NSTemporaryDirectory()
        
        let publicDir = url2+"/webR-0.0/"
//        let publicDir = url2+"/webR-0.2/"
        print("\n... inside makeUIView with publicDir = \(publicDir)...")
  //      let server = HttpServer()
        
 
        server00["/hello"] = { .ok(.htmlBody("You asked for \($0)"))  }
        
        
        
//        server00["/public/libRblas.so:path"] = shareFilesFromDirectory(NSTemporaryDirectory()+"webR-0.0/libRblas.so")
//        server00["/public/libRlapack.so:path"] = shareFilesFromDirectory(NSTemporaryDirectory()+"webR-0.0/libRlapack.so")
        
        server00["/public/src/:path"] = shareFilesFromDirectory(url2+"/src/")
        server00["/public/src/webR/:path"] = shareFilesFromDirectory(url2+"/src/webR/")
        server00["/public/src/webR/chan/:path"] = shareFilesFromDirectory(url2+"/src/webR/chan/")
        // for webR-0.0:
        server00["/public/:path"] = shareFilesFromDirectory(publicDir)
        // for webR-0.2:
//        server00["/public/:path"] = shareFilesFromDirectory(url2)
        
        
        server00["/public/images/:path"] = shareFilesFromDirectory(publicDir+"images/")
        server00["/public/css/:path"] = shareFilesFromDirectory(publicDir+"css/")
        server00["/public/js/:path"] = shareFilesFromDirectory(publicDir+"js/")
//        server00["/public/webR-0.0/:path"] = shareFilesFromDirectory(publicDir)
        server00["/public/webR-0.2/:path"] = shareFilesFromDirectory(publicDir)
        
        
//            server00["/public/webR-0.2/libRblas.so/:path"] = shareFilesFromDirectory(NSTemporaryDirectory()+"webR-0.2/libRblas.so/")
//            server00["/public/webR-0.2/libRlapack.so/:path"] = shareFilesFromDirectory(NSTemporaryDirectory()+"webR-0.2/libRlapack.so/")
         
            
//        server00["/public/libRblas.so:path"] = shareFilesFromDirectory(publicDir+"../libRblas.bin")
 //       server00["/public/libRlapack.so:path"] = shareFilesFromDirectory(publicDir+"../libRlapack.bin")
        

        
        

        server00["/public/webR-0.2/vfs/:path"] = shareFilesFromDirectory(publicDir+"vfs/")
        server00["/public/webR-0.2/vfs/etc/:path"] = shareFilesFromDirectory(publicDir+"vfs/etc/")
        server00["/public/webR-0.2/vfs/etc/fonts/:path"] = shareFilesFromDirectory(publicDir+"vfs/etc/fonts/")

        server00["/public/webR-0.2/vfs/var/:path"] = shareFilesFromDirectory(publicDir+"vfs/var/")
        server00["/public/webR-0.2/vfs/var/cache/:path"] = shareFilesFromDirectory(publicDir+"vfs/var/cache/")
        server00["/public/webR-0.2/vfs/var/cache/fontconfig/:path"] = shareFilesFromDirectory(publicDir+"vfs/var/cache/fontconfig/")

        server00["/public/webR-0.2/vfs/usr/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/")
        server00["/public/webR-0.2/vfs/usr/share/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/share/")
        server00["/public/webR-0.2/vfs/usr/share/fonts/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/share/fonts")
        server00["/public/webR-0.2/vfs/usr/share/gdal/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/share/gdal/")
        server00["/public/webR-0.2/vfs/usr/share/proj/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/share/proj/")
        server00["/public/webR-0.2/vfs/usr/share/udunits/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/share/udunits/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/")
        server00["/public/webR-0.2/vfs/usr/lib/R/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/doc/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/doc/")
        server00["/public/webR-0.2/vfs/usr/lib/R/doc/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/doc/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/doc/html/katex/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/doc/html/katex/")
        server00["/public/webR-0.2/vfs/usr/lib/R/doc/html/katex/fonts/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/doc/html/katex/fonts/")
        server00["/public/webR-0.2/vfs/usr/lib/R/doc/manual/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/doc/manual/")
        server00["/public/webR-0.2/vfs/usr/lib/R/doc/manual/images/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/doc/manual/images/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/base/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/base/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/base/demo/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/base/demo/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/base/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/base/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/base/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/base/html/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/compiler/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/compiler/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/compiler/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/compiler/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/compiler/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/compiler/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/compiler/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/compiler/tests/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/datasets/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/datasets/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/datasets/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/datasets/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/datasets/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/datasets/html/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/graphics/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/graphics/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/graphics/demo/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/graphics/demo/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/graphics/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/graphics/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/graphics/help/figures/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/graphics/help/figures/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/graphics/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/graphics/html/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/afm/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/afm/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/demo/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/demo/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/enc/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/enc/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/fonts/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/fonts/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/fonts/Montserrat/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/fonts/Montserrat/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/fonts/Montserrat/static/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/fonts/Montserrat/static/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/fonts/Roboto/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/fonts/Roboto/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/libs/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/libs/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grDevices/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grDevices/tests/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grid/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grid/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grid/doc/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grid/doc/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grid/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grid/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grid/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grid/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/grid/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/grid/tests/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/methods/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/methods/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/methods/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/methods/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/methods/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/methods/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/methods/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/methods/tests/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/doc/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/doc/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/libs/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/libs/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/Meta/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/Meta/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/R/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/R/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/parallel/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/parallel/tests/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/splines/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/splines/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/splines/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/splines/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/splines/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/splines/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/splines/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/splines/tests/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats/demo/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats/demo/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats/tests/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats4/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats4/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats4/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats4/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats4/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats4/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/stats4/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/stats4/tests/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/demo/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/demo/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/exec/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/exec/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/Meta/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/Meta/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tcltk/R/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tcltk/R/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tools/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tools/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tools/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tools/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tools/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tools/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/tools/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/tools/tests/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/translations/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/translations/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/library/utils/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/utils/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/utils/doc/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/utils/doc/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/utils/help/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/utils/help/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/utils/html/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/utils/html/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/utils/misc/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/utils/misc/")
        server00["/public/webR-0.2/vfs/usr/lib/R/library/utils/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/library/utils/tests/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/share/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/dictionaries/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/dictionaries/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/encodings/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/encodings/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/java/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/java/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/licenses/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/licenses/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/make/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/make/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/R/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/R/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/share/Rd/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/Rd/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/Rd/macros/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/Rd/macros/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/share/sh/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/sh/")
        
        server00["/public/webR-0.2/vfs/usr/lib/R/share/texmf/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/texmf/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/texmf/bibtex/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/texmf/bibtex/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/texmf/bibtex/bib/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/texmf/bibtex/bib/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/texmf/bibtex/bst/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/texmf/bibtex/bst/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/texmf/tex/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/texmf/tex/")
        server00["/public/webR-0.2/vfs/usr/lib/R/share/texmf/tex/latex/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/texmf/tex/latex/")
        
        
        server00["/public/webR-0.2/vfs/usr/lib/R/share/zoneinfo/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/share/zoneinfo")
        
        

        server00["/public/webR-0.2/vfs/usr/lib/R/tests/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/tests/")
        server00["/public/webR-0.2/vfs/usr/lib/R/tests/Packages/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/tests/Packages/")
        server00["/public/webR-0.2/vfs/usr/lib/R/tests/Examples/:path"] = shareFilesFromDirectory(publicDir+"vfs/usr/lib/R/tests/Examples/")
        
        

        
        let semaphore = DispatchSemaphore(value: 0)
        do {
          try server00.start(9822, forceIPv4: true)
          print("Server has started ( port = \(try server00.port()) ). Try to connect now...")
            
        //    runningServer = true
//            superWeb.load(URLRequest(url: url!))
//            print("[2] ... loading website")
     //     semaphore.wait()
        } catch {
          print("[2] Server start error: \(error)")
          semaphore.signal()
        } // end demo
        
  
// routine to load an HTML local file
/*
        let tempDirectoryURL = FileManager.default.temporaryDirectory // NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
        let targetURL = tempDirectoryURL.appendingPathComponent("webR-0.0")
        
        let url = targetURL.appendingPathComponent("index1.html") // publicDir + "index1.html"
        let urlSettings = url.description + ""


print("...after selecting WebR...")
print("url: \(url)\n")
print("urlsettings: \(urlSettings)")

 // var url0 = URL(string: url)!
print(urlSettings)

superWeb.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        print("creating website...")
        print("\n ... with URL= \(url.description)\n")
*/

// routine to load a local file by using a local web server
//        let url = URL(string: "http://localhost:9822/public/index1.html") // http://localhost:4000")
//        let htmlUrl = Bundle.main.url(forResource: "index1", withExtension: "html", subdirectory: "webR-0.2")
        superWeb.load(URLRequest(url: url!))
        print("[2] ... loading website")
        
        
        return superWeb
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
//        webView.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
 //       webView.load(URLRequest(url: url!)) // this line resets the website and prevents from JS injection code !!!!
   //     webView.loadFileURL(htmlUrl!, allowingReadAccessTo: htmlUrl!.deletingLastPathComponent())
 
 //        let url2 = getAppDirectory()
        let url2 = NSTemporaryDirectory()
        let urlSettings2 = url2.description + ""
        print("url for webr = \(urlSettings2)\n")
        
        let url = URL(string: "http://localhost:9822/public")!
        
        let jsMessage0 = "text00URL(\"\(url.description)\");"
        webView.evaluateJavaScript(jsMessage0) { (result, error) in
            if let result = result {
                print("result[0]:",result)
            }
            else {
                print("error[0]:", error as Any)
            }
        } // js injection
        
        print("text00 = \(text00)")
        
        var lastChar: Character = Character(" ")
        var minString: String = " "
        var word: String = ""

        
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
        print("minString == \(minString)")
        var urlBase = getAppDirectory()
//        urlBase = urlBase + "/webr-0.2.1-iOS/webr.mjs"
        print("url_base = \(urlBase.description)\n\n")
//        let jsMessage2 = "text00Char(urlBase,minString);" //
        let jsMessage2 = "text00Char(\"\(minString)\");" //
        // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
        webView.evaluateJavaScript(jsMessage2) { (result, error) in
            if let result = result {
                print("result[2]:",result)
            }
            else {
                print("error[2]:", error as Any)
            }
        } // js injection
        
        
        print("FLAGS:")
        print("flag1 = \(flag1)")
        print("flag2 = \(flag2)")
//        print("flag3 = \(flag3)")
//        print("getPDF = \(getPDF)")
//        print("getFiles = \(getFiles)\n")
        
        if flag1 {
            print("inside updateview flag 1")
            let jsMessage1 =   "myTerminal();"
            
            webView.evaluateJavaScript(jsMessage1)
            { (result, error) in
                
                
                if let result = result {
                    print("result[1] from myTerminal:",result)
                }
                else {
                    print("error[1]--myTerminal-->:", error as Any)
                    
                }
                
            } // end JavaScript evaluation of jsMessage0
            
        } // end flag 1
        
        
        
        print("\nflag2 again= \(flag2)")
        if flag2 {
            print("inside updateview flag 2")
            let jsMessage3 =   "myGraphical();"
            
            webView.evaluateJavaScript(jsMessage3)
            { (result, error) in
                
                
                if let result = result {
                    print("result[2] from myGraphical:",result)
                }
                else {
                    print("error[2]--myGraphical-->:", error as Any)
                    
                }
                
            } // end JavaScript evaluation of jsMessage0
            
        } // end flag2
        
        // new code
        
        
    } // end function updateUIView
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust  else {
            completionHandler(.useCredential, nil)
            return
        }
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
        
    }
    
 
} // end struct










// ===========================================================================================
// This App contains a link to an R console powered by R-wasm.org as well as an editor with a scrolling keyboard.


/*
 https://www.mas.ncl.ac.uk/~ngs54/webR/
 */
struct WebRWebsite: UIViewRepresentable {

    @Binding var text00: String
    
    func makeCoordinator() -> Coordinator2 {
      //  Coordinator(parent: self, text: $text, webTemplate: $webTemplate) // to use with class Coordinator
        Coordinator2(parent: self) // to use with final class Coordinator
     }
    
    func makeUIView(context: Context) -> WKWebView {
        
        // Allow access to local files.
        let config = WKWebViewConfiguration()
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        
        let superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 1228, height: 0.1), configuration: config) // (frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
 //        superWeb.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
        superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
 //       superWeb.uiDelegate = self
 //       superWeb.navigationDelegate = self
        superWeb.navigationDelegate = context.coordinator  // new CODE

        
//   var  url = Bundle.main.url(forResource: "index-08-console-plot", withExtension: "html", subdirectory: "webr-0.2.1-iOS")!  JS tag script type="module" not working
        
        var  url = Bundle.main.url(forResource: "index1", withExtension: "html", subdirectory: "webR")!
        
   var     urlSettings = url.description + ""


print("...after selecting WebR...")
print("url: \(url)\n")
print("urlsettings: \(urlSettings)")

url = URL(string: urlSettings)!
print(urlSettings)

superWeb.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        
    //    url = URL(string: "https://webr.r-wasm.org/latest/")! // not working on WKWebView
    //    url = URL(string: "https://www.mas.ncl.ac.uk/~ngs54/webR/")!
    // let request = URLRequest(url: url)
    // superWeb.load(request)

print("inside superWeb make function...")
        
        
        return superWeb
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
  //      webView.loadHTMLString(htmlUpdate1(codeText: text00), baseURL: nil)
        
        print("\ninjecting JS into a textarea...")
/*
        var  url2 = Bundle.main.url(forResource: "webr", withExtension: "mjs", subdirectory: "webr-0.2.1-iOS")!
        var     urlSettings2 = url2.description + ""
        
        print("url for webr = \(urlSettings2)\n")
        let jsMessage0 = "text00URL(\"\(url2.description)\");" //
        // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
        webView.evaluateJavaScript(jsMessage0) { (result, error) in
            if let result = result {
                print("result[0]:",result)
            }
            else {
                print("error[0]:", error as Any)
            }
        } // js injection
 */
        var url2 = getAppDirectory()
        var     urlSettings2 = url2.description + ""
        print("url for webr = \(urlSettings2)\n")
        let jsMessage0 = "text00URL(\"\(url2.description)\");"
        webView.evaluateJavaScript(jsMessage0) { (result, error) in
            if let result = result {
                print("result[0]:",result)
            }
            else {
                print("error[0]:", error as Any)
            }
        } // js injection
        
        /*
        let webr = "WebR starts here! \n"
        let jsMessage1 = "text00Char(\"\(webr)\");" //
        // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
        webView.evaluateJavaScript(jsMessage1) { (result, error) in
            if let result = result {
                print("result[1]:",result)
            }
            else {
                print("error[1]:", error as Any)
            }
        } // js injection
*/



        print("text00 = \(text00)")
        
        var lastChar: Character = Character(" ")
        var minString: String = " "
        var word: String = ""

        
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
        print("minString == \(minString)")
        var urlBase = getAppDirectory()
//        urlBase = urlBase + "/webr-0.2.1-iOS/webr.mjs"
        print("url_base = \(urlBase.description)\n\n")
//        let jsMessage2 = "text00Char(urlBase,minString);" //
        let jsMessage2 = "text00Char(\"\(minString)\");" //
        // window.document.getElementById(\"term_paste\").innerText=\"\(text00)\";"
        webView.evaluateJavaScript(jsMessage2) { (result, error) in
            if let result = result {
                print("result[2]:",result)
            }
            else {
                print("error[2]:", error as Any)
            }
        } // js injection
        
    } // end func updateUIView
    
    class Coordinator2: NSObject, WKNavigationDelegate {
        
        
        var parent: WebRWebsite
        
        init(parent: WebRWebsite) {
            self.parent = parent
        }
        var webViewOptionsSubscriber: AnyCancellable?
        
        deinit {
            webViewOptionsSubscriber?.cancel()
        }
        
        
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("webview didFinishNavigation")
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print("webviewDidCommit")
        }
        
    } // end class Coordinator2
 
} // end struct WebRWebsite




// ===========================================================================================


// This App contains a link to an R console powered by DataCamp as well as an editor with a scrolling keyboard.
// It uses DataCamp server at https://cdn.datacamp.com/datacamp-light-latest.min.js
// These are publically available resources: https://cdn.datacamp.com/dcl-react.js.gz
// For more information go to: https://github.com/datacamp/datacamp-light


struct DCLWebsite: UIViewRepresentable {

    @Binding var text00: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        let superWeb = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 1228, height: 0.1)) // (frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
        superWeb.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
        superWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        return superWeb
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlUpdate2(codeText: text00), baseURL: nil)
    }
    
    
 
} // end struct




// ===========================================================================================

// In-App Custom Keyboard
// IMPORTANT: Embed this struct into a VStack block or possibly a NavigationView block

struct StatsCalcView: UIViewRepresentable {
    
    @Binding var consoleMode: Bool
    @Binding var consoleBackground: Bool
    @Binding var text01: String
    @Binding var capsLockOn: Bool
    

    func makeUIView(context: Context) -> UITextView {
        
        
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        // stackView.frame = bounds
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        
        let view = UITextView(frame: .zero) // (frame: CGRect(x: 0, y: 0, width: 0, height: 0)) // (frame: CGRect(x: 10, y: 0, width: 1000, height: 0))
        view.delegate = context.coordinator
        
        view.font = UIFont(name: "Courier", size: 28)
        if consoleBackground {
            view.backgroundColor = .systemGray5
            view.textColor = .black
        } else {
            view.backgroundColor = .black
            view.textColor = .white
        }

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
        kView.heightAnchor.constraint(equalToConstant: 228).isActive = true

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
      
      
       let parent: StatsCalcView

       init(parent: StatsCalcView) {
           self.parent = parent
       }

      func textViewDidChange(_ textView: UITextView)  {
           if textView.text != parent.text01 {
  //             parent.text = textView.text // compiler warning: do not modify state variables here!
           }
          if parent.consoleMode {
          //    print("Hello...")
              parent.text01 = textView.text
          }
 
          
       }

      @objc func handleRefresh(sender: UIRefreshControl) {
          sender.endRefreshing()
      }
      
   } // end final class
  
  

    
 } // end struct ??
    



// More sources of information for code debugging:

/* https://www.appsloveworld.com/swift/100/3/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard
 
 
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
 
 
 https://tutorialmeta.com/question/wkwebview-update-html-tags-from-swiftui-textfields
 

*/


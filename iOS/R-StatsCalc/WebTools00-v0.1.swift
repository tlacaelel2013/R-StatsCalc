//
//  WebTools00-v0.1.swift
//  R-StatsCalc
//
//  Created by Luis Acevedo-Arreguin on 2/5/23.
//


/*
 
 https://67443.cmuis.net/labs/3
 
 */
import Foundation
import SwiftUI
import Combine
import WebKit


struct SearchBar: View {
    
    @ObservedObject var viewModel: ViewModel
    
  var body: some View {
      HStack {
        Text("URL:")
        TextField("URL", text: $viewModel.urlString)
              .keyboardType(.URL)
              .autocapitalization(.none)
              .disableAutocorrection(true)
      }
  }
}


struct BottomBar: View {
    
    @ObservedObject var viewModel: ViewModel
    
  var body: some View {
      
      HStack {
           Spacer()
          Group {
          Button(action: {
              self.viewModel.goBack()
          }) {
            Image(systemName: "pc")
         //     Image(systemName: "chevron.left")
          }
          Spacer()
          Button(action: {
              self.viewModel.goForward()
          }) {
            Image(systemName: "chart.bar")
         //     Image(systemName: "chevron.right")
          }
          Spacer()
 /*
          Button(action: {
              self.viewModel.share()
          }) {
            Image(systemName: "square.and.arrow.up")
          }
          Spacer()
              
          Button(action: {
              self.viewModel.refresh()
          }) {
            Image(systemName: "arrow.clockwise")
          }
          Spacer()
          Button(action: {
              self.viewModel.stop()
          }) {
            Image(systemName: "xmark")
          }
  */
          } // end Group
           Spacer()
          
      }
  }
}


class ViewModel: ObservableObject {
  @Published var urlString: String = ""
  @Published var webViewOptionsPublisher = PassthroughSubject<WebViewOptions, Never>()
    @Published var shouldShowShareSheet: Bool = false
    
    
    func goBack() {
      webViewOptionsPublisher.send(.back)
    }
    func goForward() {
      webViewOptionsPublisher.send(.forward)
    }
    func share() {
      webViewOptionsPublisher.send(.share)
    }
    func refresh() {
      webViewOptionsPublisher.send(.refresh)
    }
    func stop() {
      webViewOptionsPublisher.send(.stop)
    }
    
}

enum WebViewOptions {
  case back
  case forward
  case share
  case refresh
  case stop
}

struct ShareSheet: UIViewControllerRepresentable {
  typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void

  let activityItems: [Any]
  let applicationActivities: [UIActivity]? = nil
  let excludedActivityTypes: [UIActivity.ActivityType]? = nil
  let callback: Callback? = nil

  func makeUIViewController(context: Context) -> UIActivityViewController {
    let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    controller.excludedActivityTypes = excludedActivityTypes
    controller.completionWithItemsHandler = callback
    return controller
  }

  func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}



/*
 
 https://stackoverflow.com/questions/67368211/swift-check-permission-if-has-access-to-save-uiimagewritetosavedphotosalbum
 */

class ImageSaver: NSObject {
    
    var onSuccess:(()->()) = {}
    var onFail:((Error?)->()) = {_ in }
    
    init(image: UIImage,onSuccess:@escaping (()->()),onFail:@escaping ((Error?)->()) ){
        self.onSuccess = onSuccess
        self.onFail = onFail
        super.init()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            onFail(error)
        } else {
            onSuccess()
        }
    }
}


/*
 
 https://www.hackingwithswift.com/books/ios-swiftui/how-to-save-images-to-the-users-photo-library
 */

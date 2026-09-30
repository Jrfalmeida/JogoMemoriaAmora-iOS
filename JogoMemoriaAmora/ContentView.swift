import SwiftUI
import UIKit
import WebKit

struct ContentView: View {
    var body: some View { MemoryGameWebView().ignoresSafeArea() }
}

struct MemoryGameWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.scrollView.bounces = false
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.alwaysBounceHorizontal = false
        webView.allowsBackForwardNavigationGestures = false
        webView.isUserInteractionEnabled = true
        webView.backgroundColor = .systemBackground
        webView.isOpaque = false
        if let htmlURL = Bundle.main.url(forResource: "memoria-amora", withExtension: "html") {
            webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
        }
        return webView
    }
    func updateUIView(_ webView: WKWebView, context: Context) {}
}

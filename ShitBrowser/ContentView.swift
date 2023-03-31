//
//  ContentView.swift
//  ShitBrowser
//
//  Created by Hariz Shirazi on 2023-03-31.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct ContentView: View {
    @State var currentPage: URL = URL(string: "https://bomberfish.ca")!
    @State var newPage: String = "https://bomberfish.ca"
    var body: some View {
        VStack {
            WebView(url: currentPage)
                .cornerRadius(16)
            HStack {
                TextField(text: $newPage, prompt: Text("Enter website URL...")) {
                    Text("Enter website URL...")
                }
                .cornerRadius(16)
                .padding()
                .background{
                    Color(UIColor.secondarySystemBackground)
                        .cornerRadius(16)
                }
                Button(action: {
                    currentPage = URL(string: newPage)!
                }, label: {
                    Label("Go", systemImage: "arrow.right")
                })
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

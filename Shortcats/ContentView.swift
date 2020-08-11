//
//  ContentView.swift
//  Shortcats
//
//  Created by Chris Jones on 06/08/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel.shared

    var body: some View {
        VStack {
            Spacer()
            Text("Last seen shortcut type: \(viewModel.shortcutType)")
            Spacer()
            Label(
                title: { Text("didFinishLaunchingWithOptions called?") },
                icon: { Image(systemName: viewModel.didFinishCalled) }
            )
            Label(
                title: { Text("didFinish had shortcut?") },
                icon: { Image(systemName: viewModel.didFinishHadShortcutItem) }
            )
            Spacer()
            Label(
                title: { Text("didPerformActionFor called?") },
                icon: { Image(systemName: viewModel.didPerformAF) }
            )
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

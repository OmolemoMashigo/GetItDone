//
//  SplashScreenView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/27.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var fadeOut = false

    var body: some View {
        ZStack {
            if isActive {
                // main app entry point
                TodoListView()
            } else {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.16, green: 0.45, blue: 0.93),
                            Color(red: 0.09, green: 0.22, blue: 0.47)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Text("GetItDone")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white.opacity(0.9))
                            .opacity(fadeOut ? 0.0 : 1.0)
                            .animation(.easeOut(duration: 1.0), value: fadeOut)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            fadeOut = true
                        }
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

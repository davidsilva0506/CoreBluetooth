//
//  PeripheralsView.swift
//  Core_Bluetooth
//
//  Created by David Silva on 02/11/2023.
//

import SwiftUI

struct PeripheralsView: View {
    
    @ObservedObject private var viewModel = BluetoothViewModel()
    
    var body: some View {

        NavigationStack {
            
            List(viewModel.peripheralNames, id: \.self) { name in
                
                Text(name)
            }
            .navigationTitle("Peripherals")
        }
    }
}

struct PeripheralsView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralsView()
    }
}

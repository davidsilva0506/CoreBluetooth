//
//  BluetoothViewModel.swift
//  Core_Bluetooth
//
//  Created by David Silva on 02/11/2023.
//

import Foundation
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject {

    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    
    @Published var peripheralNames: [String] = []
    
    override init() {
       
        super.init()
        
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        if central.state == .poweredOn {
            
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if self.peripherals.contains(peripheral) == false {
            
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "na")
        }
    }
}

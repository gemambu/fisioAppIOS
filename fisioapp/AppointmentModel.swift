
import Foundation

final class AppointmentModel {
    let customer: String
    let address: String
    let isConfirmed: Bool
    let isCancelled: Bool
    let price: Int
    let lat: Float
    let long: Float
    
    init(customer: String,
         address: String,
         isConfirmed: Bool,
         isCancelled: Bool,
         price: Int,
         lat: Float,
         long: Float){
        (self.customer, self.address, self.isConfirmed, self.isCancelled, self.price, self.lat, self.long) = (customer, address, isConfirmed, isCancelled, price, lat, long)
    }
}



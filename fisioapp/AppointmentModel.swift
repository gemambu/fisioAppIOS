
import Foundation

final class AppointmentModel {
    let customer: String
    let address: String
    let date: String
    let isConfirmed: Bool
    let isCancelled: Bool
    let price: Int
    let lat: Float
    let long: Float
    
    init(customer: String,
         address: String,
         date: String,
         isConfirmed: Bool,
         isCancelled: Bool,
         price: Int,
         lat: Float,
         long: Float){
        (self.customer, self.address, self.date, self.isConfirmed, self.isCancelled, self.price, self.lat, self.long) = (customer, address, date, isConfirmed, isCancelled, price, lat, long)
    }
}



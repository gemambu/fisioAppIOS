
import Foundation

final class AppointmentModel {
    let id: String
    let customer: String
    let address: String
    let date: String
    let isConfirmed: Bool
    let isCancelled: Bool
    let price: Int
    let lat: Float
    let long: Float
    let extraInfo: String
    
    init(id: String,
         customer: String,
         address: String,
         date: String,
         isConfirmed: Bool,
         isCancelled: Bool,
         price: Int,
         lat: Float,
         long: Float,
         extraInfo: String){
        (self.id, self.customer, self.address, self.date, self.isConfirmed, self.isCancelled, self.price, self.lat, self.long, self.extraInfo) = (id, customer, address, date, isConfirmed, isCancelled, price, lat, long, extraInfo)
    }
}



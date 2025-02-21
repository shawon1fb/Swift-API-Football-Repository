//
//  VenueLocalRepository.swift
//  API-Football
//
//  Created by Shahanul Haque on 2/21/25.
//

import Foundation
import CoreData


protocol IVenueLocalRepository:Actor{
    func getVenueByID(id: Int) async -> VenueData?
    func getVenueByCountry(name:String) async -> [VenueData]?
    func getUniqueCountry() async ->  [String]?
    
    func saveVenueData(data: VenueData) async
    func saveVenueList(datas: [VenueData]) async
    
}

actor VenueLocalRepository : IVenueLocalRepository{
    
    private let context: NSManagedObjectContext

        init(context: NSManagedObjectContext) {
            self.context = context
        }
    
    
    func saveVenueData(data: VenueData) async {
        do{
            
            if let id = data.id {
                let venue =  VenueDB(context: context)
                
                venue.id =  Int64(id)
                
                
                venue.address =  data.address
                venue.city = data.city
                venue.country = data.country
                venue.name = data.name
                venue.image = data.image
                venue.surface = data.surface
                if let capacity = data.capacity{
                    venue.capacity =  Int64(capacity)
                }
    //            try context.save()
                saveContext()
            }
            
        
               
        }
       
    }
    
    
    
    func saveVenueList(datas: [VenueData]) async {
        do {
            for data in datas {
                if let id = data.id{
                    let venue = VenueDB(context: context)
                    venue.id = Int64(id)
                    venue.address = data.address
                    venue.city = data.city
                    venue.country = data.country
                    venue.name = data.name
                    venue.image = data.image
                    venue.surface = data.surface
                    if let capacity = data.capacity {
                        venue.capacity = Int64(capacity)
                    }
                }
               
            }
          //  try context.save()
            saveContext()
        }
    }
    
    func getVenueByID(id: Int)async -> VenueData? {
        do {
            let request: NSFetchRequest<VenueDB> = VenueDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", id)
            request.fetchLimit = 1
            
            let venues = try  context.fetch(request)
            if let venue = venues.first {
                
                return VenueData(
                    id: Int(venue.id),
                    name: venue.name ?? "",
                    address: venue.address,
                    city: venue.city ?? "",
                    country: venue.country ?? "",
                    capacity: Int(venue.capacity ),
                    surface: venue.surface,
                    image: venue.image
                )
               
            }
        } catch {
            print("CoreData error while fetching venue by ID: \(error)")
        }
        return nil
    }
    
    func getVenueByCountry(name: String) async -> [VenueData]? {
        do {
               let fetchRequest: NSFetchRequest<VenueDB> = VenueDB.fetchRequest()
               fetchRequest.predicate = NSPredicate(format: "country == %@", name)
               
               let venues = try  context.fetch(fetchRequest)
               
               let venueDataArray = venues.map { venue in
                   return VenueData(
                    id: Int(venue.id),
                    name: venue.name ?? "",
                    address: venue.address,
                    city: venue.city ?? "",
                    country: venue.country ?? "",
                    capacity: Int(venue.capacity ),
                    surface: venue.surface,
                    image: venue.image
                   )
               }
               
               return venueDataArray
           } catch {
               print("CoreData error while fetching venues by country: \(error)")
           }
        return nil
    }

    
    private func saveContext(){
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
           // you need that line

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("CoreData error while fetching venues by country: \(error)")
            }
            
        }
    }
    
    func getUniqueCountry() async -> [String]? {
        do {
            let fetchRequest: NSFetchRequest<VenueDB> = VenueDB.fetchRequest()
            fetchRequest.resultType = .managedObjectResultType // Set result type to managed objects
            
            let venues = try  context.fetch(fetchRequest)
            
            var uniqueCountriesSet = Set<String>()
            
            venues.forEach { venue in
                if let country = venue.country {
                    uniqueCountriesSet.insert(country)
                }
            }
            
            let uniqueCountriesArray = Array(uniqueCountriesSet)
            
            return uniqueCountriesArray
        } catch {
            print("CoreData error while fetching unique countries: \(error)")
        }
        
        return nil
    }

}

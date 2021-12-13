//
//  SGEvent.swift
//  SimpleProj
//
//  Created by Francesco Destino on 13/12/21.
//

import Foundation

struct SGEvent: Decodable {
    let type: String
    let id: Int
    let datetimeUTC: String
    let datetimeTbd: Bool
    let performers: [Performer]
    let isOpen: Bool
    let datetimeLocal: String
    let timeTbd: Bool
    let shortTitle, visibleUntilUTC: String
    let url: String
    let score: Double
    let announceDate, createdAt: String
    let dateTbd: Bool
    let title: String
    let popularity: Double
    let eventDescription, status: String

    enum CodingKeys: String, CodingKey {
        case type, id
        case datetimeUTC = "datetime_utc"
        case datetimeTbd = "datetime_tbd"
        case performers
        case isOpen = "is_open"
        case datetimeLocal = "datetime_local"
        case timeTbd = "time_tbd"
        case shortTitle = "short_title"
        case visibleUntilUTC = "visible_until_utc"
        case url, score
        case announceDate = "announce_date"
        case createdAt = "created_at"
        case dateTbd = "date_tbd"
        case title, popularity
        case eventDescription = "description"
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(String.self, forKey: .type)
        id = try container.decode(Int.self, forKey: .id)
        datetimeUTC = try container.decode(String.self, forKey: .datetimeUTC)
        datetimeTbd = try container.decode(Bool.self, forKey: .datetimeTbd)
        performers = try container.decode([Performer].self , forKey: .performers)
        isOpen = try container.decode(Bool.self, forKey: .isOpen)
        datetimeLocal = try container.decode(String.self, forKey: .datetimeLocal)
        timeTbd = try container.decode(Bool.self, forKey: .timeTbd)
        shortTitle = try container.decode(String.self, forKey: .shortTitle)
        visibleUntilUTC = try container.decode(String.self, forKey: .visibleUntilUTC)
        url = try container.decode(String.self, forKey: .url)
        score = try container.decode(Double.self, forKey: .score)
        announceDate = try container.decode(String.self, forKey: .announceDate)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        dateTbd = try container.decode(Bool.self, forKey: .dateTbd)
        title = try container.decode(String.self, forKey: .title)
        popularity = try container.decode(Double.self, forKey: .popularity)
        eventDescription = try container.decode(String.self, forKey: .eventDescription)
        status = try container.decode(String.self, forKey: .status)
    }
}

// MARK: - Performer
struct Performer: Decodable {
    let type: String
    let name: String
    let image: String
    let id: Int
    let images: Images
    let hasUpcomingEvents: Bool
    let url: String
    let score: Double
    let slug: String
    let shortName: String
    let numUpcomingEvents: Int
    let popularity: Int
    let lastFullIndexAt: Date

    enum CodingKeys: String, CodingKey {
        case type, name, image, id, images, divisions
        case hasUpcomingEvents = "has_upcoming_events"
        case stats, taxonomies
        case imageAttribution = "image_attribution"
        case url, score, slug
        case homeVenueID = "home_venue_id"
        case shortName = "short_name"
        case numUpcomingEvents = "num_upcoming_events"
        case colors
        case imageLicense = "image_license"
        case popularity, location
        case lastFullIndexAt = "last_full_index_at"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        id = try container.decode(Int.self, forKey: .id)
        images = try container.decode(Images.self, forKey: .images)
        hasUpcomingEvents = try container.decode(Bool.self, forKey: .hasUpcomingEvents)
        url = try container.decode(String.self, forKey: .url)
        score = try container.decode(Double.self, forKey: .score)
        slug = try container.decode(String.self, forKey: .slug)
        shortName = try container.decode(String.self, forKey: .shortName)
        numUpcomingEvents = try container.decode(Int.self, forKey: .numUpcomingEvents)
        popularity = try container.decode(Int.self, forKey: .popularity)
        lastFullIndexAt = try container.decode(Date.self, forKey: .lastFullIndexAt)
    }
}

// MARK: - Images
struct Images: Decodable {
    let huge: String?
    let large: String?
    let small: String?
    let medium: String?
}

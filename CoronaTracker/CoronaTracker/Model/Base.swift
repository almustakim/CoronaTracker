
import Foundation
struct Base : Codable {
	let title : String?
	let last_updated : String?
	let entries : [Entries]?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case last_updated = "last_updated"
		case entries = "entries"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
		entries = try values.decodeIfPresent([Entries].self, forKey: .entries)
	}

}

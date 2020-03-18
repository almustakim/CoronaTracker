
import Foundation
struct Entries : Codable {
	let country : String?
	let cases : String?
	let deaths : String?
	let recovered : String?
	let lastupdated : String?

	enum CodingKeys: String, CodingKey {

		case country = "country"
		case cases = "cases"
		case deaths = "deaths"
		case recovered = "recovered"
		case lastupdated = "lastupdated"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		cases = try values.decodeIfPresent(String.self, forKey: .cases)
		deaths = try values.decodeIfPresent(String.self, forKey: .deaths)
		recovered = try values.decodeIfPresent(String.self, forKey: .recovered)
		lastupdated = try values.decodeIfPresent(String.self, forKey: .lastupdated)
	}

}

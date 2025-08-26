import struct DrumKit.Venue

public extension Venue {
	static func info(for record: String, at streetAddress: String) -> (String, String?) {
		switch streetAddress {
		case "1 Big Red Dr": return ("Plymouth High School Stadium", "Plymouth High School")
		case "1 Citrus Bowl Pl": return ("Camping World Stadium", nil)
		case "1 Crusader Way": return ("Rocco Ortenzio Stadium", "Bishop McDevitt High School")
		case "1 MetLife Stadium Dr": return ("MetLife Stadium", nil)
		case "100 Calumet Ave": return ("Spartan Stadium", "Lima Senior High School")
		case "100 Carson Park Dr": return ("Carson Park", nil)
		case "1000 Machmueller St": return ("Stiehm Stadium", "DC Everest Junior High School")
		case "1000 Mulberry St": return ("St. Vincent Health Stadium", "Zionsville Community High School")
		case "1000 S Silver Springs Rd": return ("Silver Springs Stadium", "Silver Springs")
		case "1000 Weigles Hill Rd": return ("Weigles Hill Stadium", "Jeffersonville")
		case "10211 W Parmer Ln": return ("Parmer Lane Stadium", "Austin")
		case "1055 Fowler Ave": return ("Fowler Stadium", "Tampa")
		case "11111 Artesia Blvd": return ("Artesia Stadium", "Cerritos")
		case "11237 Kingston Pike": return ("Kingston Pike Stadium", "Knoxville")
		case "114 17th Ave East": return ("17th Avenue Stadium", "Seattle")
		case "1165 Eaton Ave": return ("Eaton Stadium", "Hamilton")
		case "1213 W Allison Rd": return ("Allison Road Stadium", "Cheyenne")
		case "1282 N Dupont Hwy": return ("Dupont Highway Stadium", "Dover")
		case "1327 Stadium Dr": return ("Stadium Dr", "Arlington")
		case "1420 11th Ave SE": return ("11th Avenue Stadium", "Minneapolis")
		case "1500 Greenland Dr": return ("Greenland Dr Stadium", "Murfreesboro")
		case "152 Kroncke Dr": return ("Kroncke Dr Stadium", "Sun Prairie")
		case "15301 S McNab Ave": return ("McNab Avenue Stadium", "Bellflower")
		case "1565 East Central Ave": return ("Central Avenue Stadium", "Wichita")
		case "1600 Stadium Dr": return ("Stadium Dr", "Birmingham")
		case "1606 Norman Dr": return ("Norman Dr Stadium", "Valdosta")
		case "1620 E Bulldog Ln": return ("Bulldog Lane Stadium", "Fresno")
		case "1630 Bogie Lake Rd": return ("Bogie Lake Stadium", "White Lake")
		case "1701 Bryant St": return ("Bryant Street Stadium", "Denver")
		case "1801 SE J St": return ("J Street Stadium", "Bentonville")
		case "1900 Avalon Ave": return ("Avalon Avenue Stadium", "Muscle Shoals")
		case "1AMB Dr NW": return ("AMB Dr Stadium", "Atlanta")
		case "200 Elizabeth St": return ("Elizabeth Street Stadium", "Pittsburgh")
		case "2000 Brush St": return ("Brush Street Stadium", "Detroit")
		case "2000 S Millenium Way": return ("Millenium Way Stadium", "Meridian")
		case "201 Rinehardt Dr": return ("Rinehardt Dr Stadium", "Mooresville")
		case "20235 Cypress Rosehill Rd": return ("Cypress Rosehill Stadium", "Cypress")
		case "20655 Flagstaff Ave": return ("Flagstaff Avenue Stadium", "Farmington")
		case "2091 238 St": return ("238 Street Stadium", "Bronx")
		case "2213 Summit St": return ("Summit Street Stadium", "Columbus")
		case "24 High School Dr": return ("High School Dr Stadium", "St. Louis")
		case "2401 Panther Pl": return ("Panther Place Stadium", "Panther City")
		case "2521 Walnut Ave": return ("Walnut Avenue Stadium", "Buena Park")
		case "2800 W Gore Blvd": return ("Gore Boulevard Stadium", "Lawton")
		case "3000 Gateway Campus Blvd": return ("Gateway Campus Stadium", "Monroeville")
		case "304 Farragut Rd": return ("Farragut Road Stadium", "Brooklyn")
		case "308 Warhawk Way": return ("Warhawk Way Stadium", "Montevallo")
		case "3128 Graydon Ave": return ("Graydon Avenue Stadium", "Norfolk")
		case "3201 Peters Ave": return ("Peters Avenue Stadium", "Vallejo")
		case "33000 Yucaipa Blvd": return ("Yucaipa Boulevard Stadium", "Yucaipa")
		case "3333 10th St": return ("10th Street Stadium", "Greeley")
		case "335 S Hollywood St": return ("Hollywood Street Stadium", "Memphis")
		case "350 N Dreier Blvd": return ("Dreier Boulevard Stadium", "Evansville")
		case "373 Malvern Rd": return ("Malvern Road Stadium", "Hot Springs")
		case "375 E Exchange St": return ("Exchange Street Stadium", "Akron")
		case "378 Wightman St": return ("Wightman Street Stadium", "Pittsburgh")
		case "3835 Freeport Blvd": return ("Freeport Boulevard Stadium", "Sacramento")
		case "3885 Jefferson St": return ("Jefferson Street Stadium", "Napa")
		case "3900 E Raab Rd": return ("Raab Road Stadium", "Normal")
		case "4000 Ontario Center": return ("Ontario Center Stadium", "Ontario")
		case "4000 St Francis Dr": return ("St. Francis Dr Stadium", "Santa Fe")
		case "4001 Wildcat Dr": return ("Wildcat Dr Stadium", "El Dorado")
		case "405 Logan Ave N": return ("Logan Avenue Stadium", "Minneapolis")
		case "4100 Kroes St NE": return ("Kroes Street Stadium", "Rockford")
		case "44 School Dr": return ("School Dr Stadium", "Haverhill")
		case "4400 Braselton Hwy": return ("Braselton Highway Stadium", "Buford")
		case "4800 Magnolia Ave": return ("Magnolia Avenue Stadium", "Riverside")
		case "500 E Veterans Way": return ("Veterans Way Stadium", "Tempe")
		case "500 Turin St": return ("Turin Street Stadium", "Rome")
		case "5151 Park Ave": return ("Park Avenue Stadium", "Fairfield")
		case "5175 Franz Rd": return ("Franz Road Stadium", "Katy")
		case "525 7th St NE": return ("7th Street Stadium", "Washington")
		case "529 Hurffville - Cross Keys Rd 2831": return ("Cross Keys Road Stadium", "Washington Township")
		case "5469 Trussville Clay Rd": return ("Trussville Clay Road Stadium", "Trussville")
		case "600 Lake Rd": return ("Lake Road Stadium", "Milford")
		case "600 Lincoln Ave": return ("Lincoln Avenue Stadium", "Steamboat Springs")
		case "600 W North Bend Rd": return ("North Bend Road Stadium", "Cincinnati")
		case "6000 J St": return ("J Street Stadium", "Sacramento")
		case "610 W 4th St": return ("4th Street Stadium", "Winston-Salem")
		case "6200 140th St W": return ("140th Street Stadium", "Apple Valley")
		case "684 Starr Rd": return ("Starr Road Stadium", "Newark")
		case "701 South Mount Vernon Ave": return ("Mount Vernon Avenue Stadium", "San Bernardino")
		case "801 Hosking Ave": return ("Hosking Avenue Stadium", "Bakersfield")
		case "8135 S Westnedge Ave": return ("Westnedge Avenue Stadium", "Portage")
		case "850 Hancock St": return ("Hancock Street Stadium", "Quincy")
		case "851 30th Ave SE": return ("30th Avenue Stadium", "Minot")
		case "8705 Campbellton St": return ("Campbellton Street Stadium", "Douglasville")
		case "929 Monroe Dr NE": return ("Monroe Dr Stadium", "Atlanta")
		case "930 S Elm St": return ("Elm Street Stadium", "Greensboro")
		case "98 Rundlett Hill Rd": return ("Rundlett Hill Stadium", "Bedford")
		case "Lawson Rd": return ("Lawson Road Stadium", "Little Rock")
		case "Oliver Jackson Blvd": return ("Jackson Boulevard Stadium", "Abilene")
		case "One Bills Dr": return ("Bills Dr Stadium", "Buffalo")
		case "Rte 111-West Hollis St": return ("West Hollis Street Stadium", "Nashua")
		case "SW Haverhill Rd": return ("Haverhill Road Stadium", "Haverhill")
		default: break
		}

		var name: String
		var host: String? = nil
		let components = record
			.replacingOccurrences(of: "  ", with: " ")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: " at the ", with: " at ")
			.components(separatedBy: " at ")

		if components.count == 2 {
			name = components[0]
			host = components[1]
		}

		name = components[0]
			.components(separatedBy: "-")[0]
			.replacingOccurrences(of: "HS", with: "High School")
			.replacingOccurrences(of: "High School Stadium", with: "High School")
		
		name = switch name {
		case "Breitenbach Stadium": "Otto Breitenbach Stadium"
		case "Broken Arrow Memorial Stadium": "Tiger Stadium"
		case "Central High School Stadium": "Central High School Football Stadium"
		case "Centerville High School Stadium": "Centerville Stadium"
		case "Champlin Park High School Football Field": "Rebel Stadium"
		case "Clifton School Stadium": "Clifton Stadium"
		case "Dwire Field": "Atrium Stadium"
		case "Lon C Burchfield Stadium": "Lon C. Burchfield Stadium"
		case "Salem Stadium": "Salem Football Stadium"
		case "Vikings Stadium": "Northgate Vikings Stadium"
		default: name
		}

		host = switch name {
		case "Allegacy Federal Credit Union Stadium": "Wake Forest University"
		case "Ankeny Stadium": "Northview Middle School"
		case "Atrium Stadium": "Mason High School"
		case "Blakeslee Stadium": "Minnesota State University, Mankato"
		case "Brunswick Auto Mart Stadium": "Brunswick High School"
		case "Bob Goalby Field": "Belleville West High School"
		case "Canvas Stadium": "Colorado State University"
		case "Cedarburg High School Stadium": "Cedarburg High School"
		case "Centerville Stadium": "Centerville High School"
		case "Central High School Football Stadium": "Central High School"
		case "College Boulevard Activity Center": "Olathe Northwest High School"
		case "DATCU Stadium": "University of North Texas"
		case "Dalzell Field": "Clarke University"
		case "Delaware Stadium": "University of Delaware"
		case "Georgelis Law Firm Stadium": "Hempfield High School"
		case "Golden Wave Stadium": "Tupelo High School"
		case "Hillsboro Stadium": "Portland State University"
		case "Joan C. Edwards Stadium": "Marshall University"
		case "Lon C. Burchfield Stadium": "Sevier County High School"
		case "M. M. Roberts Stadium": "University of Southern Mississippi"
		case "Marion Harding Football Stadium": "Marion Harding High School"
		case "Neil F. Lampson Stadium": "Kennewick High School"
		case "Northgate Vikings Stadium": "Northgate High School"
		case "Otto Breitenbach Stadium": "Middleton High School"
		case "Perkins Stadium": "University of Wisconsin–Whitewater"
		case "Rebel Stadium": "Champlin Park High School"
		case "Rio Rancho Ram Stadium": "Rio Rancho High School"
		case "Salem Football Stadium": "Salem High School"
		case "Scheumann Stadium": "Ball State University"
		case "Sox Harrison Stadium": "Pennsylvania Western University, Edinboro"
		case "Stanford Stadium": "Stanford University"
		case "TDECU Stadium": "University of Houston"
		case "Tiger Stadium": "Broken Arrow High School"
		case "Veterans Memorial Stadium": "Lawrence High School"
		case "Veterans Memorial Field Sports Complex": "University of Wisconsin–La Crosse"
		case "Wildcat Stadium": "Indiana Wesleyan University"
		default: host
		}
		
		let stadiumName: String? = switch name {
		case "Shelton High School": "Finn Stadium"
		case "Cedarburg High School": "Alumni Field"
		case "Dover Area High School": "Eagles Stadium"
		default: name.hasSuffix("High School") ? "\(name) Stadium" : nil
		}

		if let stadiumName {
			host = name
			name = stadiumName
		} else {
			host = switch host {
			case "Texas A&M": "Texas A&M University"
			default: host
			}
		}

		return (name, host)
	}
}

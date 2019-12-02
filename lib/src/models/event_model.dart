import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

class Event {
    PurpleEmbedded embedded;
    //FluffyLinks links;
    Page page;

    Event({
        this.embedded,
        //this.links,
        this.page,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        embedded: PurpleEmbedded.fromJson(json["_embedded"]),
        //links: FluffyLinks.fromJson(json["_links"]),
        page: Page.fromJson(json["page"]),
    );

}

class PurpleEmbedded {
    List<EventElement> events;

    PurpleEmbedded({
        this.events,
    });

    factory PurpleEmbedded.fromJson(Map<String, dynamic> json) => PurpleEmbedded(
        events: json["events"] != null ? List<EventElement>.from(json["events"].map((x) => EventElement.fromJson(x))) : [],
    );
}

class EventElement {
    String name;
    String type;
    String id;
    bool test;
    String url;
    String locale;
    List<Image> images;
    Sales sales;
    Dates dates;
    List<Classification> classifications;
    Promoter promoter;
    List<Promoter> promoters;
    List<PriceRange> priceRanges;
    List<Product> products;
    Seatmap seatmap;
    PurpleLinks links;
    FluffyEmbedded embedded;

    EventElement({
        this.name,
        this.type,
        this.id,
        this.test,
        this.url,
        this.locale,
        this.images,
        this.sales,
        this.dates,
        this.classifications,
        this.promoter,
        this.promoters,
        this.priceRanges,
        this.products,
        this.seatmap,
        this.links,
        this.embedded,
    });

    factory EventElement.fromJson(Map<String, dynamic> json) => EventElement(
        name: json["name"],
        type: json["type"],
        id: json["id"],
        test: json["test"],
        url: json["url"],
        locale: json["locale"],
        images: json["images"] != null ? List<Image>.from(json["images"].map((x) => Image.fromJson(x))) : [],
        sales: Sales.fromJson(json["sales"]),
        dates: Dates.fromJson(json["dates"]),
        classifications: json["classifications"] != null ? List<Classification>.from(json["classifications"].map((x) => Classification.fromJson(x))) : [],
        //promoter: Promoter.fromJson(json["promoter"]),
        //promoters: json["promoters"] != null ? List<Promoter>.from(json["promoters"].map((x) => Promoter.fromJson(x))) : [],
        priceRanges: json["priceRanges"] != null ? List<PriceRange>.from(json["priceRanges"].map((x) => PriceRange.fromJson(x))) : [],
        products: json["products"] != null ? List<Product>.from(json["products"].map((x) => Product.fromJson(x))) : [],
        seatmap: json["seatmap"] != null ? Seatmap.fromJson(json["seatmap"]) : null,
        //links: PurpleLinks.fromJson(json["_links"]),
        //embedded: FluffyEmbedded.fromJson(json["_embedded"]),
    );
}

class Classification {
    bool primary;
    Genre segment;
    Genre genre;
    Genre subGenre;
    Genre type;
    Genre subType;
    bool family;

    Classification({
        this.primary,
        this.segment,
        this.genre,
        this.subGenre,
        this.type,
        this.subType,
        this.family,
    });

    factory Classification.fromJson(Map<String, dynamic> json) => Classification(
        primary: json["primary"],
        segment: json["segment"] != null ? Genre.fromJson(json["segment"]) : null,
        genre: json["genre"] != null ? Genre.fromJson(json["genre"]) : null,
        subGenre:json["subGenre"] != null ? Genre.fromJson(json["subGenre"]) : null,
        type: json["type"] != null ? Genre.fromJson(json["type"]) : null,
        subType: json["subType"] != null ? Genre.fromJson(json["subType"]) : null,
        family: json["family"],
    );
}

class Genre {
    String id;
    String name;

    Genre({
        this.id,
        this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );
}

class Dates {
    Start start;
    String timezone;
    Status status;
    bool spanMultipleDays;

    Dates({
        this.start,
        this.timezone,
        this.status,
        this.spanMultipleDays,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        start: json["start"] != null ? Start.fromJson(json["start"]) : null,
        timezone: json["timezone"],
        status: Status.fromJson(json["status"]),
        spanMultipleDays: json["spanMultipleDays"],
    );
}

class Start {
    DateTime localDate;
    String localTime;
    DateTime dateTime;
    bool dateTbd;
    bool dateTba;
    bool timeTba;
    bool noSpecificTime;

    Start({
        this.localDate,
        this.localTime,
        this.dateTime,
        this.dateTbd,
        this.dateTba,
        this.timeTba,
        this.noSpecificTime,
    });

    factory Start.fromJson(Map<String, dynamic> json) => Start(
        localDate: json["localDate"] != null ? DateTime.parse(json["localDate"]) : null,
        localTime: json["localTime"],
        dateTime: json["dateTime"] != null ? DateTime.parse(json["dateTime"]) : null,
        dateTbd: json["dateTBD"],
        dateTba: json["dateTBA"],
        timeTba: json["timeTBA"],
        noSpecificTime: json["noSpecificTime"],
    );
}

class Status {
    String code;

    Status({
        this.code,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
    );
}

class FluffyEmbedded {
    List<Venue> venues;
    List<Attraction> attractions;

    FluffyEmbedded({
        this.venues,
        this.attractions,
    });

    factory FluffyEmbedded.fromJson(Map<String, dynamic> json) => FluffyEmbedded(
        venues: json["venues"] != null ? List<Venue>.from(json["venues"].map((x) => Venue.fromJson(x))) : [],
        attractions: json["attractions"] != null ? List<Attraction>.from(json["attractions"].map((x) => Attraction.fromJson(x))) : [],
    );
}

class Attraction {
    String name;
    String type;
    String id;
    bool test;
    String url;
    String locale;
    List<Image> images;
    List<Classification> classifications;
    AttractionUpcomingEvents upcomingEvents;
    AttractionLinks links;
    List<String> aliases;

    Attraction({
        this.name,
        this.type,
        this.id,
        this.test,
        this.url,
        this.locale,
        this.images,
        this.classifications,
        this.upcomingEvents,
        this.links,
        this.aliases,
    });

    factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        name: json["name"],
        type: json["type"],
        id: json["id"],
        test: json["test"],
        url: json["url"],
        locale: json["locale"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        classifications: List<Classification>.from(json["classifications"].map((x) => Classification.fromJson(x))),
        upcomingEvents: AttractionUpcomingEvents.fromJson(json["upcomingEvents"]),
        links: AttractionLinks.fromJson(json["_links"]),
        aliases: json["aliases"] == null ? null : List<String>.from(json["aliases"].map((x) => x)),
    );
}

class Image {
    Ratio ratio;
    String url;
    int width;
    int height;
    bool fallback;

    Image({
        this.ratio,
        this.url,
        this.width,
        this.height,
        this.fallback,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        ratio: ratioValues.map[json["ratio"]],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        fallback: json["fallback"],
    );
}

enum Ratio { THE_169, THE_43, THE_32 }

final ratioValues = EnumValues({
    "16_9": Ratio.THE_169,
    "3_2": Ratio.THE_32,
    "4_3": Ratio.THE_43
});

class AttractionLinks {
    First self;

    AttractionLinks({
        this.self,
    });

    factory AttractionLinks.fromJson(Map<String, dynamic> json) => AttractionLinks(
        self: json["self"] != null ? First.fromJson(json["self"]) : null,
    );
}

class First {
    String href;

    First({
        this.href,
    });

    factory First.fromJson(Map<String, dynamic> json) => First(
        href: json["href"] != null ? json["href"] : '',
    );
}

class AttractionUpcomingEvents {
    int total;
    int ticketmaster;

    AttractionUpcomingEvents({
        this.total,
        this.ticketmaster,
    });

    factory AttractionUpcomingEvents.fromJson(Map<String, dynamic> json) => AttractionUpcomingEvents(
        total: json["_total"],
        ticketmaster: json["ticketmaster"],
    );
}

class Venue {
    String name;
    String type;
    String id;
    bool test;
    String url;
    String locale;
    List<String> aliases;
    List<Image> images;
    String postalCode;
    String timezone;
    City city;
    State state;
    Country country;
    Address address;
    Location location;
    List<Genre> markets;
    List<Dma> dmas;
    BoxOfficeInfo boxOfficeInfo;
    String parkingDetail;
    String accessibleSeatingDetail;
    GeneralInfo generalInfo;
    VenueUpcomingEvents upcomingEvents;
    AttractionLinks links;

    Venue({
        this.name,
        this.type,
        this.id,
        this.test,
        this.url,
        this.locale,
        this.aliases,
        this.images,
        this.postalCode,
        this.timezone,
        this.city,
        this.state,
        this.country,
        this.address,
        this.location,
        this.markets,
        this.dmas,
        this.boxOfficeInfo,
        this.parkingDetail,
        this.accessibleSeatingDetail,
        this.generalInfo,
        this.upcomingEvents,
        this.links,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        name: json["name"],
        type: json["type"],
        id: json["id"],
        test: json["test"],
        url: json["url"],
        locale: json["locale"],
        aliases: json["aliases"] != null ? List<String>.from(json["aliases"].map((x) => x)) : [],
        images: json["images"] != null ? List<Image>.from(json["images"].map((x) => Image.fromJson(x))) : [],
        postalCode: json["postalCode"],
        timezone: json["timezone"],
        city: City.fromJson(json["city"]),
        state: State.fromJson(json["state"]),
        country: Country.fromJson(json["country"]),
        address: Address.fromJson(json["address"]),
        location: Location.fromJson(json["location"]),
        markets: json["markets"] != null ? List<Genre>.from(json["markets"].map((x) => Genre.fromJson(x))) : [],
        dmas: json["dmas"] != null ? List<Dma>.from(json["dmas"].map((x) => Dma.fromJson(x))) : [],
        boxOfficeInfo: json["boxOfficeInfo"] != null ? BoxOfficeInfo.fromJson(json["boxOfficeInfo"]) : null,
        parkingDetail: json["parkingDetail"],
        accessibleSeatingDetail: json["accessibleSeatingDetail"],
        generalInfo: json["generalInfo"] != null ? GeneralInfo.fromJson(json["generalInfo"]) : null,
        upcomingEvents: json["upcomingEvents"] != null ? VenueUpcomingEvents.fromJson(json["upcomingEvents"]) : null,
        links: json["_links"] != null ? AttractionLinks.fromJson(json["_links"]) : null,
    );
}

class Address {
    String line1;

    Address({
        this.line1,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
    );
}

class BoxOfficeInfo {
    String phoneNumberDetail;
    String openHoursDetail;
    String acceptedPaymentDetail;
    String willCallDetail;

    BoxOfficeInfo({
        this.phoneNumberDetail,
        this.openHoursDetail,
        this.acceptedPaymentDetail,
        this.willCallDetail,
    });

    factory BoxOfficeInfo.fromJson(Map<String, dynamic> json) => BoxOfficeInfo(
        phoneNumberDetail: json["phoneNumberDetail"],
        openHoursDetail: json["openHoursDetail"],
        acceptedPaymentDetail: json["acceptedPaymentDetail"],
        willCallDetail: json["willCallDetail"],
    );
}

class City {
    String name;

    City({
        this.name,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
    );
}

class Country {
    String name;
    String countryCode;

    Country({
        this.name,
        this.countryCode,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        countryCode: json["countryCode"],
    );
}

class Dma {
    int id;

    Dma({
        this.id,
    });

    factory Dma.fromJson(Map<String, dynamic> json) => Dma(
        id: json["id"],
    );
}

class GeneralInfo {
    String generalRule;
    String childRule;

    GeneralInfo({
        this.generalRule,
        this.childRule,
    });

    factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
        generalRule: json["generalRule"],
        childRule: json["childRule"],
    );
}

class Location {
    String longitude;
    String latitude;

    Location({
        this.longitude,
        this.latitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        longitude: json["longitude"],
        latitude: json["latitude"],
    );
}

class State {
    String name;
    String stateCode;

    State({
        this.name,
        this.stateCode,
    });

    factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"],
        stateCode: json["stateCode"],
    );
}

class VenueUpcomingEvents {
    int total;
    int tmr;
    int ticketmaster;

    VenueUpcomingEvents({
        this.total,
        this.tmr,
        this.ticketmaster,
    });

    factory VenueUpcomingEvents.fromJson(Map<String, dynamic> json) => VenueUpcomingEvents(
        total: json["_total"],
        tmr: json["tmr"],
        ticketmaster: json["ticketmaster"],
    );
}

class PurpleLinks {
    First self;
    List<First> attractions;
    List<First> venues;

    PurpleLinks({
        this.self,
        this.attractions,
        this.venues,
    });

    factory PurpleLinks.fromJson(Map<String, dynamic> json) => PurpleLinks(
        //self: First.fromJson(json["self"]),
        attractions: json["attractions"] != null ? List<First>.from(json["attractions"].map((x) => First.fromJson(x))) : [],
        venues: json["venues"] != null ? List<First>.from(json["venues"].map((x) => First.fromJson(x))) : [],
    );
}

class PriceRange {
    String type;
    String currency;
    double min;
    double max;

    PriceRange({
        this.type,
        this.currency,
        this.min,
        this.max,
    });

    factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        type: json["type"],
        currency: json["currency"],
        min: json["min"],
        max: json["max"],
    );
}

class Product {
    String id;
    String url;
    String type;
    String name;

    Product({
        this.id,
        this.url,
        this.type,
        this.name,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        url: json["url"],
        type: json["type"],
        name: json["name"],
    );
}

class Promoter {
    String id;
    String name;
    String description;

    Promoter({
        this.id,
        this.name,
        this.description,
    });

    factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );
}

class Sales {
    Public public;
    List<Presale> presales;

    Sales({
        this.public,
        this.presales,
    });

    factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        public: Public.fromJson(json["public"]),
        presales: json["presales"] != null ? List<Presale>.from(json["presales"].map((x) => Presale.fromJson(x))) : [],
    );
}

class Presale {
    DateTime startDateTime;
    DateTime endDateTime;
    String name;

    Presale({
        this.startDateTime,
        this.endDateTime,
        this.name,
    });

    factory Presale.fromJson(Map<String, dynamic> json) => Presale(
        startDateTime: DateTime.parse(json["startDateTime"]),
        endDateTime: DateTime.parse(json["endDateTime"]),
        name: json["name"],
    );
}

class Public {
    DateTime startDateTime;
    bool startTbd;
    DateTime endDateTime;

    Public({
        this.startDateTime,
        this.startTbd,
        this.endDateTime,
    });

    factory Public.fromJson(Map<String, dynamic> json) => Public(
        startDateTime: json["startDateTime"] != null ? DateTime.parse(json["startDateTime"]) : null,
        startTbd: json["startTBD"],
        endDateTime: json["endDateTime"] != null ? DateTime.parse(json["endDateTime"]) : null,
    );
}
 
class Seatmap {
    String staticUrl;

    Seatmap({
        this.staticUrl,
    });

    factory Seatmap.fromJson(Map<String, dynamic> json) => Seatmap(
        staticUrl: json["staticUrl"] != null ? json["staticUrl"] : '',
    );
}

// class FluffyLinks {
//     First first;
//     First self;
//     First next;
//     First last;

//     FluffyLinks({
//         this.first,
//         this.self,
//         this.next,
//         this.last,
//     });

//     factory FluffyLinks.fromJson(Map<String, dynamic> json) => FluffyLinks(
//         first: First.fromJson(json["first"]),
//         self: First.fromJson(json["self"]),
//         next: First.fromJson(json["next"]),
//         last: First.fromJson(json["last"]),
//     );
// }

class Page {
    int size;
    int totalElements;
    int totalPages;
    int number;

    Page({
        this.size,
        this.totalElements,
        this.totalPages,
        this.number,
    });

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        size: json["size"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        number: json["number"],
    );
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

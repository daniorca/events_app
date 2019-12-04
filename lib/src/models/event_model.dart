import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

class Event {
    PurpleEmbedded embedded;
    Page page;

    Event({
        this.embedded,
        this.page,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        embedded: PurpleEmbedded.fromJson(json["_embedded"]),
        page: Page.fromJson(json["page"]),
    );

}

class PurpleEmbedded {
    List<EventElement> events;

    PurpleEmbedded({
        this.events,
    });

    factory PurpleEmbedded.fromJson(Map<String, dynamic> json) => PurpleEmbedded(
        events: json != null && json["events"] != null ? List<EventElement>.from(json["events"].map((x) => EventElement.fromJson(x))) : [],
    );
}

class EventElement {
    String name;
    String type;
    String id;
    String url;
    List<Image> images;
    Dates dates;
    List<Classification> classifications;
    List<PriceRange> priceRanges;
    Seatmap seatmap;
    FluffyEmbedded embedded;
    String info;

    EventElement({
        this.name,
        this.type,
        this.id,
        this.url,
        this.images,
        this.dates,
        this.classifications,
        this.priceRanges,
        this.seatmap,
        this.embedded,
        this.info
    });

    factory EventElement.fromJson(Map<String, dynamic> json) => EventElement(
        name: json["name"],
        type: json["type"],
        id: json["id"],
        url: json["url"],
        info: json["info"],
        images: json["images"] != null ? List<Image>.from(json["images"].map((x) => Image.fromJson(x))) : [],
        dates: Dates.fromJson(json["dates"]),
        classifications: json["classifications"] != null ? List<Classification>.from(json["classifications"].map((x) => Classification.fromJson(x))) : [],
        priceRanges: json["priceRanges"] != null ? List<PriceRange>.from(json["priceRanges"].map((x) => PriceRange.fromJson(x))) : [],
        seatmap: json["seatmap"] != null ? Seatmap.fromJson(json["seatmap"]) : null,
        embedded: FluffyEmbedded.fromJson(json["_embedded"]),
    );
}

class Classification {
    bool primary;
    Genre segment;
    Genre genre;
    Genre subGenre;

    Classification({
        this.primary,
        this.segment,
        this.genre,
        this.subGenre,
    });

    factory Classification.fromJson(Map<String, dynamic> json) => Classification(
        primary: json["primary"],
        segment: json["segment"] != null ? Genre.fromJson(json["segment"]) : null,
        genre: json["genre"] != null ? Genre.fromJson(json["genre"]) : null,
        subGenre:json["subGenre"] != null ? Genre.fromJson(json["subGenre"]) : null,
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
        name: json["name"] != null ? json["name"] : '',
    );
}

class Dates {
    Start start;
    String timezone;

    Dates({
        this.start,
        this.timezone,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        start: json["start"] != null ? Start.fromJson(json["start"]) : null,
        timezone: json["timezone"],
    );
}

class Start {
    DateTime localDate;
    String localTime;
    DateTime dateTime;

    Start({
        this.localDate,
        this.localTime,
        this.dateTime,
    });

    factory Start.fromJson(Map<String, dynamic> json) => Start(
        localDate: json["localDate"] != null ? DateTime.parse(json["localDate"]) : null,
        localTime: json["localTime"],
        dateTime: json["dateTime"] != null ? DateTime.parse(json["dateTime"]) : null,
    );
}

class FluffyEmbedded {
    List<Venue> venues;

    FluffyEmbedded({
        this.venues,
    });

    factory FluffyEmbedded.fromJson(Map<String, dynamic> json) => FluffyEmbedded(
        venues: json["venues"] != null ? List<Venue>.from(json["venues"].map((x) => Venue.fromJson(x))) : [],
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

class First {
    String href;

    First({
        this.href,
    });

    factory First.fromJson(Map<String, dynamic> json) => First(
        href: json["href"] != null ? json["href"] : '',
    );
}

class Venue {
    String name;
    String id;
    String url;
    List<Image> images;
    City city;
    State state;
    Country country;
    Address address;

    Venue({
        this.name,
        this.id,
        this.url,
        this.images,
        this.city,
        this.state,
        this.country,
        this.address,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        name: json["name"],
        id: json["id"],
        url: json["url"],
        images: json["images"] != null ? List<Image>.from(json["images"].map((x) => Image.fromJson(x))) : [],
        city: json["city"] != null ? City.fromJson(json["city"]) : null,
        state: json["state"] != null ? State.fromJson(json["state"]) : null,
        country: json["country"] != null ? Country.fromJson(json["country"]) : null,
        address: json["address"] != null ? Address.fromJson(json["address"]) : null,
    );
}

class Address {
    String line1;

    Address({
        this.line1,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"] != null ? json["line1"] : '',
    );
}

class City {
    String name;

    City({
        this.name,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"] != null ? json["name"] : '',
    );
}

class Country {
    String name;

    Country({
        this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] != null ? json["name"] : '',
    );
}

class State {
    String name;

    State({
        this.name,
    });

    factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"] != null ? json["name"] : '',
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
 
class Seatmap {
    String staticUrl;

    Seatmap({
        this.staticUrl,
    });

    factory Seatmap.fromJson(Map<String, dynamic> json) => Seatmap(
        staticUrl: json["staticUrl"] != null ? json["staticUrl"] : '',
    );
}

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

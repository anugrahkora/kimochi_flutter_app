class University {
    final List<String>? domains;
    final String? country;
    final dynamic stateProvince;
    final String? name;
    final List<String>? webPages;
    final String? alphaTwoCode;

    University({
        this.domains,
        this.country,
        this.stateProvince,
        this.name,
        this.webPages,
        this.alphaTwoCode,
    });

    University copyWith({
        List<String>? domains,
        String? country,
        dynamic stateProvince,
        String? name,
        List<String>? webPages,
        String? alphaTwoCode,
    }) => 
        University(
            domains: domains ?? this.domains,
            country: country ?? this.country,
            stateProvince: stateProvince ?? this.stateProvince,
            name: name ?? this.name,
            webPages: webPages ?? this.webPages,
            alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
        );

    factory University.fromJson(Map<String, dynamic> json) => University(
        domains: json["domains"] == null ? [] : List<String>.from(json["domains"]!.map((x) => x)),
        country: json["country"],
        stateProvince: json["state-province"],
        name: json["name"],
        webPages: json["web_pages"] == null ? [] : List<String>.from(json["web_pages"]!.map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
    );

    Map<String, dynamic> toJson() => {
        "domains": domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "country": country,
        "state-province": stateProvince,
        "name": name,
        "web_pages": webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
    };
}

class DataModel {
  int? id;
  String? name;
  String? location;
  String? mobileNumber;
  String? hotelPic;
  bool? hotelType;
  String? createdAt;
  int? views;
  String? googleMapsLocation;
  List<Pictures>? pictures;
  List<Packages>? packages;
  List<Features>? features;

  DataModel(
      {this.id,
      this.name,
      this.location,
      this.mobileNumber,
      this.hotelPic,
      this.hotelType,
      this.createdAt,
      this.views,
      this.googleMapsLocation,
      this.pictures,
      this.packages,
      this.features});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    mobileNumber = json['mobile_number'];
    hotelPic = json['hotel_pic'];
    hotelType = json['hotel_type'];
    createdAt = json['created_at'];
    views = json['views'];
    googleMapsLocation = json['google_maps_location'];
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(new Pictures.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['mobile_number'] = this.mobileNumber;
    data['hotel_pic'] = this.hotelPic;
    data['hotel_type'] = this.hotelType;
    data['created_at'] = this.createdAt;
    data['views'] = this.views;
    data['google_maps_location'] = this.googleMapsLocation;
    if (this.pictures != null) {
      data['pictures'] = this.pictures!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pictures {
  int? id;
  String? picture;
  int? hotelId;

  Pictures({this.id, this.picture, this.hotelId});

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['hotel_id'] = this.hotelId;
    return data;
  }
}

class Packages {
  String? packageName;
  String? chargesPerHeadWithoutFood;
  String? chargesPerHeadWithFood;
  String? foodServed;
  bool? freeWifi;
  bool? stageDecoration;
  bool? soundSystem;
  bool? groundLighting;
  bool? bridalRoom;
  bool? freeParking;
  bool? chiller;
  bool? heater;
  List<String>? packagePicture;
  List<PackagePictures>? packagePictures;

  Packages(
      {this.packageName,
      this.chargesPerHeadWithoutFood,
      this.chargesPerHeadWithFood,
      this.foodServed,
      this.freeWifi,
      this.stageDecoration,
      this.soundSystem,
      this.groundLighting,
      this.bridalRoom,
      this.freeParking,
      this.chiller,
      this.heater,
      this.packagePicture,
      this.packagePictures});

  Packages.fromJson(Map<String, dynamic> json) {
    packageName = json['package_name'];
    chargesPerHeadWithoutFood = json['charges_per_head_without_food'];
    chargesPerHeadWithFood = json['charges_per_head_with_food'];
    foodServed = json['food_served'];
    freeWifi = json['free_wifi'];
    stageDecoration = json['stage_decoration'];
    soundSystem = json['sound_system'];
    groundLighting = json['ground_lighting'];
    bridalRoom = json['bridal_room'];
    freeParking = json['free_parking'];
    chiller = json['chiller'];
    heater = json['heater'];
    if (json['package_picture'] != null) {
      packagePicture = <String>[];
      json['package_picture'].forEach((v) {
        packagePicture!.add(v);
      });
    }
    if (json['package_pictures'] != null) {
      packagePictures = <PackagePictures>[];
      json['package_pictures'].forEach((v) {
        packagePictures!.add(new PackagePictures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_name'] = this.packageName;
    data['charges_per_head_without_food'] = this.chargesPerHeadWithoutFood;
    data['charges_per_head_with_food'] = this.chargesPerHeadWithFood;
    data['food_served'] = this.foodServed;
    data['free_wifi'] = this.freeWifi;
    data['stage_decoration'] = this.stageDecoration;
    data['sound_system'] = this.soundSystem;
    data['ground_lighting'] = this.groundLighting;
    data['bridal_room'] = this.bridalRoom;
    data['free_parking'] = this.freeParking;
    data['chiller'] = this.chiller;
    data['heater'] = this.heater;
    if (this.packagePicture != null) {
      data['package_picture'] = this.packagePicture;
    }
    if (this.packagePictures != null) {
      data['package_pictures'] =
          this.packagePictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackagePictures {
  int? id;
  String? picture;
  int? packageId;

  PackagePictures({this.id, this.picture, this.packageId});

  PackagePictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
    packageId = json['package_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['package_id'] = this.packageId;
    return data;
  }
}

class Features {
  int? id;
  bool? parking;
  bool? childPlayarea;
  bool? groundLighting;
  bool? chiller;
  bool? soundSystem;
  bool? bridalSystem;
  int? hotelId;

  Features(
      {this.id,
      this.parking,
      this.childPlayarea,
      this.groundLighting,
      this.chiller,
      this.soundSystem,
      this.bridalSystem,
      this.hotelId});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parking = json['parking'];
    childPlayarea = json['child_playarea'];
    groundLighting = json['ground_lighting'];
    chiller = json['chiller'];
    soundSystem = json['sound_system'];
    bridalSystem = json['bridal_system'];
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parking'] = this.parking;
    data['child_playarea'] = this.childPlayarea;
    data['ground_lighting'] = this.groundLighting;
    data['chiller'] = this.chiller;
    data['sound_system'] = this.soundSystem;
    data['bridal_system'] = this.bridalSystem;
    data['hotel_id'] = this.hotelId;
    return data;
  }
}

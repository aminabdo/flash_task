import 'package:clean_architecture_tdd_course/features/next_lanch/domain/entitiy/Launch.dart';
import 'package:equatable/equatable.dart';

class LaunchModel extends Launch {
  final FairingsModel fairings;
  final LinksModel links;
  final dynamic staticFireDateUtc;
  final dynamic staticFireDateUnix;
  final bool net;
  final dynamic window;
  final String rocket;
  final dynamic success;
  final List<dynamic> failures;
  final dynamic details;
  final List<dynamic> crew;
  final List<dynamic> ships;
  final List<dynamic> capsules;
  final List<String> payloads;
  final String launchpad;
  final int flightNumber;
  final String name;
  final String dateUtc;
  final int dateUnix;
  final String dateLocal;
  final String datePrecision;
  final bool upcoming;
  final List<CoresModel> cores;
  final bool autoUpdate;
  final bool tbd;
  final String launchLibraryId;
  final String id;

  LaunchModel(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.failures,
      this.details,
      this.crew,
      this.ships,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.autoUpdate,
      this.tbd,
      this.launchLibraryId,
      this.id});

  factory LaunchModel.fromMap(Map<String, dynamic> map) {
    LaunchModel nextLaunchReposnseModel = LaunchModel(
      fairings : map['fairings']!=null ? FairingsModel.fromMap(map['fairings']) : null,
      links : map['links']!=null ? LinksModel.fromMap(map['links']) : null,
      staticFireDateUtc : map['static_fire_date_utc'],
      staticFireDateUnix : map['static_fire_date_unix'],
      net : map['net'],
      window : map['window'],
      rocket : map['rocket'],
      success : map['success'],
      failures : map['failures'],
      details : map['details'],
      crew : map['crew'],
      ships : map['ships'],
      capsules : map['capsules'],
      payloads : map['payloads']!=null ?  ([]..addAll(
          (map['payloads'] as List).map((o) => o.toString())
      )) : null,
      launchpad : map['launchpad'],
      flightNumber : map['flight_number'],
      name : map['name'],
      dateUtc : map['date_utc'],
      dateUnix : map['date_unix'],
      dateLocal : map['date_local'],
      datePrecision : map['date_precision'],
      upcoming : map['upcoming'],
      cores : map['cores']!=null ? ([]..addAll(
          (map['cores'] as List).map((o) => CoresModel.fromMap(o))
      )) : null,
      autoUpdate : map['auto_update'],
      tbd : map['tbd'],
      launchLibraryId : map['launch_library_id'],
      id : map['id'],
    );
    return nextLaunchReposnseModel;
  }

  Map toJson() => {
    "fairings": fairings.toJson(),
    "links": links.toJson(),
    "static_fire_date_utc": staticFireDateUtc.toJson(),
    "static_fire_date_unix": staticFireDateUnix.toJson(),
    "net": net,
    "window": window.toJson(),
    "rocket": rocket,
    "success": success.toJson(),
    "failures": failures,
    "details": details.toJson(),
    "crew": crew,
    "ships": ships,
    "capsules": capsules,
    "payloads": payloads,
    "launchpad": launchpad,
    "flight_number": flightNumber,
    "name": name,
    "date_utc": dateUtc,
    "date_unix": dateUnix,
    "date_local": dateLocal,
    "date_precision": datePrecision,
    "upcoming": upcoming,
    "cores": cores.map((o)=>o.toJson()).toList(growable: false),
    "auto_update": autoUpdate,
    "tbd": tbd,
    "launch_library_id": launchLibraryId,
    "id": id,
  }..removeWhere((k,v)=>v==null);

}

class CoresModel {
  final dynamic core;
  final dynamic flight;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool landingAttempt;
  final dynamic landingSuccess;
  final String landingType;
  final dynamic landpad;

  CoresModel(this.core, this.flight, this.gridfins, this.legs, this.reused, this.landingAttempt, this.landingSuccess, this.landingType, this.landpad);

  static CoresModel fromMap(Map<String, dynamic> map) {
    CoresModel coresModel = CoresModel(
      map['core'],
      map['flight'],
      map['gridfins'],
      map['legs'],
      map['reused'],
      map['landing_attempt'],
      map['landing_success'],
      map['landing_type'],
      map['landpad'],
    );
    return coresModel;
  }

  Map toJson() => {
    "core": core.toJson(),
    "flight": flight.toJson(),
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "landing_attempt": landingAttempt,
    "landing_success": landingSuccess.toJson(),
    "landing_type": landingType,
    "landpad": landpad.toJson(),
  }..removeWhere((k,v)=>v==null);
}

class LinksModel {
  final PatchModel patch;
  final RedditModel reddit;
  final FlickrModel flickr;
  final dynamic presskit;
  final dynamic webcast;
  final dynamic youtubeId;
  final dynamic article;
  final String wikipedia;

  LinksModel(this.patch, this.reddit, this.flickr, this.presskit, this.webcast, this.youtubeId, this.article, this.wikipedia);

  static LinksModel fromMap(Map<String, dynamic> map) {
    LinksModel linksModel = LinksModel(
      map['patch']!=null ? PatchModel.fromMap(map['patch']) : null,
      map['reddit']!=null ? RedditModel.fromMap(map['reddit']) : null,
      map['flickr']!=null ? FlickrModel.fromMap(map['flickr']) : null,
      map['presskit'],
      map['webcast'],
      map['youtube_id'],
      map['article'],
      map['wikipedia'],
    );
    return linksModel;
  }

  Map toJson() => {
    "patch": patch.toJson(),
    "reddit": reddit.toJson(),
    "flickr": flickr.toJson(),
    "presskit": presskit.toJson(),
    "webcast": webcast.toJson(),
    "youtube_id": youtubeId.toJson(),
    "article": article.toJson(),
    "wikipedia": wikipedia,
  }..removeWhere((k,v)=>v==null);
}

class FlickrModel {
  final List<dynamic> small;
  final List<dynamic> original;

  FlickrModel(this.small, this.original);

  static FlickrModel fromMap(Map<String, dynamic> map) {
    FlickrModel flickrModel = FlickrModel(
      map['small'],
      map['original'],
    );
    return flickrModel;
  }

  Map toJson() => {
    "small": small,
    "original": original,
  }..removeWhere((k,v)=>v==null);
}

class RedditModel {
  final String campaign;
  final dynamic launch;
  final dynamic media;
  final String recovery;

  RedditModel(this.campaign, this.launch, this.media, this.recovery);

  static RedditModel fromMap(Map<String, dynamic> map) {
    RedditModel redditModel = RedditModel(
      map['campaign'],
      map['launch'],
      map['media'],
      map['recovery'],
    );
    return redditModel;
  }

  Map toJson() => {
    "campaign": campaign,
    "launch": launch.toJson(),
    "media": media.toJson(),
    "recovery": recovery,
  }..removeWhere((k,v)=>v==null);
}

class PatchModel {
  final String small;
  final String large;

  PatchModel(this.small, this.large);

  static PatchModel fromMap(Map<String, dynamic> map) {
    PatchModel patchModel = PatchModel(
      map['small'],
      map['large'],
    );
    return patchModel;
  }

  Map toJson() => {
    "small": small,
    "large": large,
  }..removeWhere((k,v)=>v==null);
}

class FairingsModel {
  final dynamic reused;
  final dynamic recoveryAttempt;
  final dynamic recovered;
  final List<dynamic> ships;

  FairingsModel(this.reused, this.recoveryAttempt, this.recovered, this.ships);

  static FairingsModel fromMap(Map<String, dynamic> map) {
    FairingsModel fairingsModel = FairingsModel(
      map['reused'],
      map['recovery_attempt'],
      map['recovered'],
      map['ships'],
    );
    return fairingsModel;
  }

  Map toJson() => {
    "reused": reused.toJson(),
    "recovery_attempt": recoveryAttempt.toJson(),
    "recovered": recovered.toJson(),
    "ships": ships,
  }..removeWhere((k,v)=>v==null);
}

class VideoModel {
    int? code;
    String? msg;
    double? processedTime;
    Data? data;

    VideoModel({this.code, this.msg, this.processedTime, this.data});

    VideoModel.fromJson(Map<String, dynamic> json) {
        if(json["code"] is num) {
            code = (json["code"] as num).toInt();
        }
        if(json["msg"] is String) {
            msg = json["msg"];
        }
        if(json["processed_time"] is num) {
            processedTime = (json["processed_time"] as num).toDouble();
        }
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data.fromJson(json["data"]);
        }
    }

    static List<VideoModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => VideoModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["msg"] = msg;
        _data["processed_time"] = processedTime;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }

    VideoModel copyWith({
        int? code,
        String? msg,
        double? processedTime,
        Data? data,
    }) => VideoModel(
        code: code ?? this.code,
        msg: msg ?? this.msg,
        processedTime: processedTime ?? this.processedTime,
        data: data ?? this.data,
    );
}

class Data {
    List<Videos>? videos;
    int? cursor;
    bool? hasMore;

    Data({this.videos, this.cursor, this.hasMore});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["videos"] is List) {
            videos = json["videos"] == null ? null : (json["videos"] as List).map((e) => Videos.fromJson(e)).toList();
        }
        if(json["cursor"] is num) {
            cursor = (json["cursor"] as num).toInt();
        }
        if(json["hasMore"] is bool) {
            hasMore = json["hasMore"];
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(videos != null) {
            _data["videos"] = videos?.map((e) => e.toJson()).toList();
        }
        _data["cursor"] = cursor;
        _data["hasMore"] = hasMore;
        return _data;
    }

    Data copyWith({
        List<Videos>? videos,
        int? cursor,
        bool? hasMore,
    }) => Data(
        videos: videos ?? this.videos,
        cursor: cursor ?? this.cursor,
        hasMore: hasMore ?? this.hasMore,
    );
}

class Videos {
    String? awemeId;
    String? videoId;
    String? region;
    String? title;
    String? cover;
    String? aiDynamicCover;
    String? originCover;
    int? duration;
    String? play;
    String? wmplay;
    String? music;
    MusicInfo? musicInfo;
    int? playCount;
    int? diggCount;
    int? commentCount;
    int? shareCount;
    int? downloadCount;
    int? createTime;
    dynamic anchors;
    String? anchorsExtras;
    bool? isAd;
    CommerceInfo? commerceInfo;
    String? commercialVideoInfo;
    int? itemCommentSettings;
    Author? author;
    int? isTop;

    Videos({this.awemeId, this.videoId, this.region, this.title, this.cover, this.aiDynamicCover, this.originCover, this.duration, this.play, this.wmplay, this.music, this.musicInfo, this.playCount, this.diggCount, this.commentCount, this.shareCount, this.downloadCount, this.createTime, this.anchors, this.anchorsExtras, this.isAd, this.commerceInfo, this.commercialVideoInfo, this.itemCommentSettings, this.author, this.isTop});

    Videos.fromJson(Map<String, dynamic> json) {
        if(json["aweme_id"] is String) {
            awemeId = json["aweme_id"];
        }
        if(json["video_id"] is String) {
            videoId = json["video_id"];
        }
        if(json["region"] is String) {
            region = json["region"];
        }
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["cover"] is String) {
            cover = json["cover"];
        }
        if(json["ai_dynamic_cover"] is String) {
            aiDynamicCover = json["ai_dynamic_cover"];
        }
        if(json["origin_cover"] is String) {
            originCover = json["origin_cover"];
        }
        if(json["duration"] is num) {
            duration = (json["duration"] as num).toInt();
        }
        if(json["play"] is String) {
            play = json["play"];
        }
        if(json["wmplay"] is String) {
            wmplay = json["wmplay"];
        }
        if(json["music"] is String) {
            music = json["music"];
        }
        if(json["music_info"] is Map) {
            musicInfo = json["music_info"] == null ? null : MusicInfo.fromJson(json["music_info"]);
        }
        if(json["play_count"] is num) {
            playCount = (json["play_count"] as num).toInt();
        }
        if(json["digg_count"] is num) {
            diggCount = (json["digg_count"] as num).toInt();
        }
        if(json["comment_count"] is num) {
            commentCount = (json["comment_count"] as num).toInt();
        }
        if(json["share_count"] is num) {
            shareCount = (json["share_count"] as num).toInt();
        }
        if(json["download_count"] is num) {
            downloadCount = (json["download_count"] as num).toInt();
        }
        if(json["create_time"] is num) {
            createTime = (json["create_time"] as num).toInt();
        }
        anchors = json["anchors"];
        if(json["anchors_extras"] is String) {
            anchorsExtras = json["anchors_extras"];
        }
        if(json["is_ad"] is bool) {
            isAd = json["is_ad"];
        }
        if(json["commerce_info"] is Map) {
            commerceInfo = json["commerce_info"] == null ? null : CommerceInfo.fromJson(json["commerce_info"]);
        }
        if(json["commercial_video_info"] is String) {
            commercialVideoInfo = json["commercial_video_info"];
        }
        if(json["item_comment_settings"] is num) {
            itemCommentSettings = (json["item_comment_settings"] as num).toInt();
        }
        if(json["author"] is Map) {
            author = json["author"] == null ? null : Author.fromJson(json["author"]);
        }
        if(json["is_top"] is num) {
            isTop = (json["is_top"] as num).toInt();
        }
    }

    static List<Videos> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Videos.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["aweme_id"] = awemeId;
        _data["video_id"] = videoId;
        _data["region"] = region;
        _data["title"] = title;
        _data["cover"] = cover;
        _data["ai_dynamic_cover"] = aiDynamicCover;
        _data["origin_cover"] = originCover;
        _data["duration"] = duration;
        _data["play"] = play;
        _data["wmplay"] = wmplay;
        _data["music"] = music;
        if(musicInfo != null) {
            _data["music_info"] = musicInfo?.toJson();
        }
        _data["play_count"] = playCount;
        _data["digg_count"] = diggCount;
        _data["comment_count"] = commentCount;
        _data["share_count"] = shareCount;
        _data["download_count"] = downloadCount;
        _data["create_time"] = createTime;
        _data["anchors"] = anchors;
        _data["anchors_extras"] = anchorsExtras;
        _data["is_ad"] = isAd;
        if(commerceInfo != null) {
            _data["commerce_info"] = commerceInfo?.toJson();
        }
        _data["commercial_video_info"] = commercialVideoInfo;
        _data["item_comment_settings"] = itemCommentSettings;
        if(author != null) {
            _data["author"] = author?.toJson();
        }
        _data["is_top"] = isTop;
        return _data;
    }

    Videos copyWith({
        String? awemeId,
        String? videoId,
        String? region,
        String? title,
        String? cover,
        String? aiDynamicCover,
        String? originCover,
        int? duration,
        String? play,
        String? wmplay,
        String? music,
        MusicInfo? musicInfo,
        int? playCount,
        int? diggCount,
        int? commentCount,
        int? shareCount,
        int? downloadCount,
        int? createTime,
        dynamic anchors,
        String? anchorsExtras,
        bool? isAd,
        CommerceInfo? commerceInfo,
        String? commercialVideoInfo,
        int? itemCommentSettings,
        Author? author,
        int? isTop,
    }) => Videos(
        awemeId: awemeId ?? this.awemeId,
        videoId: videoId ?? this.videoId,
        region: region ?? this.region,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        aiDynamicCover: aiDynamicCover ?? this.aiDynamicCover,
        originCover: originCover ?? this.originCover,
        duration: duration ?? this.duration,
        play: play ?? this.play,
        wmplay: wmplay ?? this.wmplay,
        music: music ?? this.music,
        musicInfo: musicInfo ?? this.musicInfo,
        playCount: playCount ?? this.playCount,
        diggCount: diggCount ?? this.diggCount,
        commentCount: commentCount ?? this.commentCount,
        shareCount: shareCount ?? this.shareCount,
        downloadCount: downloadCount ?? this.downloadCount,
        createTime: createTime ?? this.createTime,
        anchors: anchors ?? this.anchors,
        anchorsExtras: anchorsExtras ?? this.anchorsExtras,
        isAd: isAd ?? this.isAd,
        commerceInfo: commerceInfo ?? this.commerceInfo,
        commercialVideoInfo: commercialVideoInfo ?? this.commercialVideoInfo,
        itemCommentSettings: itemCommentSettings ?? this.itemCommentSettings,
        author: author ?? this.author,
        isTop: isTop ?? this.isTop,
    );
}

class Author {
    String? id;
    String? uniqueId;
    String? nickname;
    String? avatar;

    Author({this.id, this.uniqueId, this.nickname, this.avatar});

    Author.fromJson(Map<String, dynamic> json) {
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["unique_id"] is String) {
            uniqueId = json["unique_id"];
        }
        if(json["nickname"] is String) {
            nickname = json["nickname"];
        }
        if(json["avatar"] is String) {
            avatar = json["avatar"];
        }
    }

    static List<Author> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Author.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["unique_id"] = uniqueId;
        _data["nickname"] = nickname;
        _data["avatar"] = avatar;
        return _data;
    }

    Author copyWith({
        String? id,
        String? uniqueId,
        String? nickname,
        String? avatar,
    }) => Author(
        id: id ?? this.id,
        uniqueId: uniqueId ?? this.uniqueId,
        nickname: nickname ?? this.nickname,
        avatar: avatar ?? this.avatar,
    );
}

class CommerceInfo {
    bool? advPromotable;
    bool? auctionAdInvited;
    int? brandedContentType;
    bool? withCommentFilterWords;

    CommerceInfo({this.advPromotable, this.auctionAdInvited, this.brandedContentType, this.withCommentFilterWords});

    CommerceInfo.fromJson(Map<String, dynamic> json) {
        if(json["adv_promotable"] is bool) {
            advPromotable = json["adv_promotable"];
        }
        if(json["auction_ad_invited"] is bool) {
            auctionAdInvited = json["auction_ad_invited"];
        }
        if(json["branded_content_type"] is num) {
            brandedContentType = (json["branded_content_type"] as num).toInt();
        }
        if(json["with_comment_filter_words"] is bool) {
            withCommentFilterWords = json["with_comment_filter_words"];
        }
    }

    static List<CommerceInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CommerceInfo.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["adv_promotable"] = advPromotable;
        _data["auction_ad_invited"] = auctionAdInvited;
        _data["branded_content_type"] = brandedContentType;
        _data["with_comment_filter_words"] = withCommentFilterWords;
        return _data;
    }

    CommerceInfo copyWith({
        bool? advPromotable,
        bool? auctionAdInvited,
        int? brandedContentType,
        bool? withCommentFilterWords,
    }) => CommerceInfo(
        advPromotable: advPromotable ?? this.advPromotable,
        auctionAdInvited: auctionAdInvited ?? this.auctionAdInvited,
        brandedContentType: brandedContentType ?? this.brandedContentType,
        withCommentFilterWords: withCommentFilterWords ?? this.withCommentFilterWords,
    );
}

class MusicInfo {
    String? id;
    String? title;
    String? play;
    String? cover;
    String? author;
    bool? original;
    int? duration;
    String? album;

    MusicInfo({this.id, this.title, this.play, this.cover, this.author, this.original, this.duration, this.album});

    MusicInfo.fromJson(Map<String, dynamic> json) {
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["play"] is String) {
            play = json["play"];
        }
        if(json["cover"] is String) {
            cover = json["cover"];
        }
        if(json["author"] is String) {
            author = json["author"];
        }
        if(json["original"] is bool) {
            original = json["original"];
        }
        if(json["duration"] is num) {
            duration = (json["duration"] as num).toInt();
        }
        if(json["album"] is String) {
            album = json["album"];
        }
    }

    static List<MusicInfo> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => MusicInfo.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["play"] = play;
        _data["cover"] = cover;
        _data["author"] = author;
        _data["original"] = original;
        _data["duration"] = duration;
        _data["album"] = album;
        return _data;
    }

    MusicInfo copyWith({
        String? id,
        String? title,
        String? play,
        String? cover,
        String? author,
        bool? original,
        int? duration,
        String? album,
    }) => MusicInfo(
        id: id ?? this.id,
        title: title ?? this.title,
        play: play ?? this.play,
        cover: cover ?? this.cover,
        author: author ?? this.author,
        original: original ?? this.original,
        duration: duration ?? this.duration,
        album: album ?? this.album,
    );
}
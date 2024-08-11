// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieModelImpl _$$MovieModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieModelImpl(
      total: json['total'] as String? ?? '',
      page: (json['page'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      tvShow: (json['tv_shows'] as List<dynamic>?)
              ?.map((e) => TvShows.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MovieModelImplToJson(_$MovieModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvShow,
    };

_$TvShowsImpl _$$TvShowsImplFromJson(Map<String, dynamic> json) =>
    _$TvShowsImpl(
      name: json['name'] as String? ?? '',
      permalink: json['permalink'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      network: json['network'] as String? ?? '',
      imageThumbnailPath: json['image_thumbnail_path'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$TvShowsImplToJson(_$TvShowsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'permalink': instance.permalink,
      'endDate': instance.endDate,
      'network': instance.network,
      'image_thumbnail_path': instance.imageThumbnailPath,
      'status': instance.status,
    };

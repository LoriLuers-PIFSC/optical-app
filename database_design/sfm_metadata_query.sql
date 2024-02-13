select
sv.date_,
rd.missionid,
sfm.photographer,
sv.type,
rd.region,
loi.islandcode,
sfm.camera_no as camera,
sfm.site,
sfm.survey_size,
sfm.latitude_n,
sfm.longitude_e,
--sv.latitude,
--sv.longitude,
sfm.survey_type,
sfm.marker_0m_numbers as A_MARKER,
sfm.marker_0m_depth_ft as A_DEPTH_FT,
sfm.marker_10m_numbers as B_MARKER,
sfm.marker_10m_depth_ft as B_DEPTH_FT,
sfm.marker_15m_numbers as C_MARKER,
sfm.marker_15m_depth_ft as C_DEPTH_FT,
sfm.marker_20m_numbers as D_MARKER,
sfm.marker_20m_depth_ft as D_DEPTH_FT,
sfm.filepath as PICLEA_FILEPATH,
sfm.sorted_images,
sfm.total_images,
sfm.total_size_gb,
sfm.notes,
sfm.qc,
sfm.color_corrected,
sfm.exposure_corrected,
sfm.mosaic_rugosity_lvl,
sfm.repeat_segment_yn

from
site_visit sv,
round rd,
sfm_metadata sfm,
list_of_sites los,
list_of_islands loi

where (sv.site = sfm.site or sv.occ_siteid = sfm.site)
and sv.photomosaic_yn = -1
and rd.active = -1
and sv.roundid = rd.roundid
and sv.site = los.site
and los.island = loi.island

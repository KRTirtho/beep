use super::player::MediaSourceType;

pub fn determine_media_source(source: &String) -> MediaSourceType {
    if source.starts_with("https://") || source.starts_with("http://") {
        return MediaSourceType::Network;
    }
    MediaSourceType::Local
}

use std::io;
use thiserror::Error;

#[derive(Error, Debug)]
pub enum Error {
    #[error("Invalid Path/URI to Audio file `{0}`")]
    InvalidSourceURI(String),
    #[error("Audio file not found")]
    MediaSourceNotFound,
    // #[error("Failed to fetch audio")]
    // AudioFetchingError(#[from] ureq::Error),
    #[error("Failed to decode audio")]
    AudioDecodingError,
    #[error("Audio output failed")]
    AudioOutputError,
    #[error("Unknown IO Exception")]
    IoError(#[from] io::Error),
}

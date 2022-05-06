use super::MediaSourceType;
use crate::error::Error;
use anyhow::Result;
use rodio::Decoder;
use std::{fs::File, io::BufReader, path::Path};

pub struct PlaybackItem {
    pub source: String,
    pub source_type: MediaSourceType,
}

impl PlaybackItem {
    pub fn new(source: String, source_type: MediaSourceType) -> Self {
        Self {
            source,
            source_type,
        }
    }

    fn load_file(&self) -> Result<Decoder<BufReader<File>>> {
        let path = Path::new(self.source.as_str());

        if !path.is_file() {
            return Err(Error::InvalidSourceURI(self.source.clone()).into());
        } else if !path.exists() {
            return Err(Error::MediaSourceNotFound.into());
        }
        match File::open(self.source.as_str()) {
            Ok(file) => {
                let decoder = Decoder::new(BufReader::new(file)).unwrap();
                Ok(decoder)
            }
            Err(err) => Err(Error::IoError(err).into()),
        }
    }

    fn load_url(&self) {}

    pub fn load(&self) -> Result<Decoder<BufReader<File>>> {
        // match self.source_type {
        //     MediaSourceType::Network => self.load_url(),
        //     MediaSourceType::Local => self.load_file(),
        // }
        Ok(self.load_file()?)
    }
}

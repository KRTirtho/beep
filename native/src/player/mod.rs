pub mod item;
pub mod queue;
use self::{item::PlaybackItem, queue::Queue};
use crate::error::Error;
use crate::utils::determine_media_source;
use anyhow::Result;
use flutter_rust_bridge::frb;
use rodio::{Decoder, OutputStreamHandle};
pub use rodio::{OutputStream, Sink, Source};
use std::{fs::File, io::BufReader, time::Duration};

#[frb(mirror(Sink))]
pub struct _Sink {
    detached: bool,
}

#[derive(PartialEq)]
pub enum MediaSourceType {
    Network,
    Local,
}

pub struct Player {
    pub is_playing: bool,
    queue: Queue,
    sink: Sink,
    _stream: OutputStream,
    stream_handle: OutputStreamHandle,
    /// total duration in milliseconds
    pub duration: u64,
}

impl Player {
    pub fn new() -> Self {
        let (_stream, stream_handle) = OutputStream::try_default().unwrap();
        let sink = Sink::try_new(&stream_handle).unwrap();
        println!("Initialized New Player");
        Self {
            is_playing: false,
            queue: Queue::new(),
            sink,
            _stream,
            stream_handle,
            duration: 0,
        }
    }

    pub fn play(&self) {
        self.sink.play();
    }

    pub fn pause(&self) {
        self.sink.pause();
    }

    pub fn shuffle(&mut self) {
        self.queue.set_behaviour(queue::QueueBehavior::Random);
    }

    pub fn set_volume(&self, volume: f32) {
        self.sink.set_volume(volume);
    }

    pub fn set_speed(&self, speed: f32) {
        self.sink.set_speed(speed);
    }

    pub fn get_volume(&self) -> f32 {
        self.sink.volume()
    }

    pub fn get_speed(&self) -> f32 {
        self.sink.speed()
    }

    fn start_playing(&mut self) -> Result<()> {
        match self.queue.get_current() {
            Some(item) => match item.load() {
                Ok(decoder) => {
                    self.duration = decoder
                        .total_duration()
                        .unwrap_or(Duration::new(0, 0))
                        .as_millis() as u64;
                    self.sink.append(decoder);
                    println!("Appended decoded audio source in sink");
                    self.sink.sleep_until_end();
                    println!("Finished playing audio file");
                    Ok(())
                }
                Err(_) => Err(Error::AudioDecodingError.into()),
            },
            None => Err(Error::MediaSourceNotFound.into()),
        }
    }

    pub fn load(&mut self, source: String) -> Result<()> {
        println!("Loading audio from {}", source);
        let source_type = determine_media_source(&source);

        self.queue.append(PlaybackItem::new(source, source_type));
        self.start_playing()?;
        Ok(())
    }

    // pub fn load_playlist() {}

    // pub fn seek(&self, ms: i64) {}

    // pub fn skip(&self, n: i32) {}

    // pub fn append_playlist() {}

    // pub fn clear_playlist() {}

    // pub fn out_playlist() {}
}

unsafe impl Send for Player {}

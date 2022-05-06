use std::{fs::File, io::BufReader, path::Path, sync::{Mutex, Arc}, time::Duration};

use lazy_static::lazy_static;
use rodio::{self, source::SineWave, Decoder, OutputStream, Sink, Source};

use crate::player::Player;
use anyhow::Result;

// This is the entry point of your Rust library.
// When adding new code to your project, note that only items used
// here will be transformed to their Dart equivalents.

// A plain enum without any fields. This is similar to Dart- or C-style enums.
// flutter_rust_bridge is capable of generating code for enums with fields
// (@freezed classes in Dart and tagged unions in C).
pub enum Platform {
    Unknown,
    Android,
    Ios,
    Windows,
    Unix,
    MacIntel,
    MacApple,
    Wasm,
}

// A function definition in Rust. Similar to Dart, the return type must always be named
// and is never inferred.
pub fn platform() -> Platform {
    // This is a macro, a special expression that expands into code. In Rust, all macros
    // end with an exclamation mark and can be invoked with all kinds of brackets (parentheses,
    // brackets and curly braces). However, certain conventions exist, for example the
    // vector macro is almost always invoked as vec![..].
    //
    // The cfg!() macro returns a boolean value based on the current compiler configuration.
    // When attached to expressions (#[cfg(..)] form), they show or hide the expression at compile time.
    // Here, however, they evaluate to runtime values, which may or may not be optimized out
    // by the compiler. A variety of configurations are demonstrated here which cover most of
    // the modern oeprating systems. Try running the Flutter application on different machines
    // and see if it matches your expected OS.
    //
    // Furthermore, in Rust, the last expression in a function is the return value and does
    // not have the trailing semicolon. This entire if-else chain forms a single expression.
    if cfg!(windows) {
        Platform::Windows
    } else if cfg!(target_os = "android") {
        Platform::Android
    } else if cfg!(target_os = "ios") {
        Platform::Ios
    } else if cfg!(target_arch = "aarch64-apple-darwin") {
        Platform::MacApple
    } else if cfg!(target_os = "macos") {
        Platform::MacIntel
    } else if cfg!(target_family = "wasm") {
        Platform::Wasm
    } else if cfg!(unix) {
        Platform::Unix
    } else {
        Platform::Unknown
    }
}

// The convention for Rust identifiers is the snake_case,
// and they are automatically converted to camelCase on the Dart side.
pub fn rust_release_mode() -> bool {
    cfg!(not(debug_assertions))
}

pub fn play_beep(freq: f32, duration_ms: u64, amplification: f32) {
    let (_stream, stream_handle) = OutputStream::try_default().unwrap();
    let sink = Sink::try_new(&stream_handle).unwrap();

    let source = SineWave::new(freq)
        .take_duration(Duration::from_millis(duration_ms))
        .amplify(amplification);
    sink.append(source);

    // The sound plays in a separate thread. This call will block the current thread until the sink
    // has finished playing all its queued sounds.
    sink.sleep_until_end();
}

pub fn play_song(s_path: String) {
    let path = Path::new(s_path.as_str());
    if !path.exists() {
        panic!(
            "The audio file doesn't exists in the following path {}",
            path.to_str().unwrap_or("")
        )
    }
    // Get a output stream handle to the default physical sound device
    let (_stream, stream_handle) = OutputStream::try_default().unwrap();
    // Load a sound from a file, using a path relative to Cargo.toml
    let file = BufReader::new(File::open(path).unwrap());
    // Decode that sound file into a source
    let source = Decoder::new(file).unwrap();

    let sink = Sink::try_new(&stream_handle).unwrap();

    sink.append(source);
    // The sound plays in a separate audio thread,
    // so we need to keep the main thread alive while it's playing.

    sink.sleep_until_end();
}

lazy_static! {
    static ref PLAYER: Arc<Mutex<Option<Player>>> = Arc::new(Mutex::new(None));
}

pub fn init_player() -> Result<()> {
    *PLAYER.lock().unwrap() = Some(Player::new());
    Ok(())
}

pub fn play() {
    PLAYER.lock().unwrap().as_ref().unwrap().play();
}

pub fn pause() {
    PLAYER.lock().unwrap().as_ref().unwrap().pause();
}
pub fn shuffle() {
    PLAYER.lock().unwrap().as_mut().unwrap().shuffle();
}
pub fn set_volume(volume: f32) {
    PLAYER.lock().unwrap().as_ref().unwrap().set_volume(volume);
}
pub fn set_speed(speed: f32) {
    PLAYER.lock().unwrap().as_ref().unwrap().set_speed(speed);
}
pub fn get_volume() -> f32 {
    PLAYER.lock().unwrap().as_ref().unwrap().get_volume()
}
pub fn get_speed() {
    PLAYER.lock().unwrap().as_ref().unwrap().get_speed();
}
pub fn load(source: String) {
    if let Err(err) = PLAYER.lock().unwrap().as_mut().unwrap().load(source) {
        eprintln!("[Loading Failed] Reason: {}", err.to_string());
    }
}
// pub fn load_playlist() {
//     PLAYER.lock().unwrap().as_ref().unwrap().load_playlist();
// }
// pub fn seek() {
//     PLAYER.lock().unwrap().as_ref().unwrap().seek();
// }
// pub fn skip() {
//     PLAYER.lock().unwrap().as_ref().unwrap().skip();
// }
// pub fn append_playlist() {
//     PLAYER.lock().unwrap().as_ref().unwrap().append_playlist();
// }
// pub fn clear_playlist() {
//     PLAYER.lock().unwrap().as_ref().unwrap().clear_playlist();
// }
// pub fn out_playlist() {
//     PLAYER.lock().unwrap().as_ref().unwrap().out_playlist();
// }

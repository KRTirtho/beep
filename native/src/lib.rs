mod api;
mod bridge_generated;
mod error;
mod player;
mod utils;

#[cfg(test)]
mod tests {
    use crate::api::{init_player, load};

    #[test]
    fn audio_plays() {
        init_player();
        load(String::from("audio/malibu.mp3"));
    }
}

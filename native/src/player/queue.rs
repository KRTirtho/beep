use itertools::Itertools;
use rand::prelude::SliceRandom;

use super::item::PlaybackItem;

#[derive(Debug)]
pub enum QueueBehavior {
    Sequential,
    Random,
    LoopTrack,
    LoopAll,
}

impl Default for QueueBehavior {
    fn default() -> Self {
        Self::Sequential
    }
}

pub struct Queue {
    pub items: Vec<PlaybackItem>,
    pub position: u64,
    pub positions: Vec<u64>,
    pub behavior: QueueBehavior,
}

impl Queue {
    pub fn new() -> Self {
        Self {
            items: Vec::new(),
            position: 0,
            positions: Vec::new(),
            behavior: QueueBehavior::default(),
        }
    }

    pub fn clear(&mut self) {
        self.items.clear();
        self.positions.clear();
        self.position = 0;
    }

    pub fn fill(&mut self, items: Vec<PlaybackItem>, position: u64) {
        self.items = items;
        self.position = position;
        self.compute_positions();
    }

    // add playback_item at the end of the queue
    pub fn append(&mut self, item: PlaybackItem) {
        self.fill(vec![item], self.items.len() as u64)
    }

    pub fn set_behaviour(&mut self, behavior: QueueBehavior) {
        self.behavior = behavior;
        self.compute_positions();
    }

    fn compute_positions(&mut self) {
        // Start with an ordered 1:1 mapping.
        self.positions = (0..self.items.len()).map(|e| e as u64).collect_vec();

        if let QueueBehavior::Random = self.behavior {
            // Swap the current position with the first item, so we will start from the
            // beginning, with the full queue ahead of us.  Then shuffle the rest of the
            // items and set the position to 0.
            if self.positions.len() > 1 {
                self.positions.swap(0, self.position as usize);
                self.positions[1..].shuffle(&mut rand::thread_rng());
            }
            self.position = 0;
        }
    }

    pub fn skip_to_previous(&mut self) {
        self.position = self.previous_position();
    }

    pub fn skip_to_next(&mut self) {
        self.position = self.next_position();
    }

    pub fn skip_to_following(&mut self) {
        self.position = self.following_position();
    }

    pub fn get_current(&self) -> Option<&PlaybackItem> {
        let position = self.positions.get(self.position as usize).copied()?;
        self.items.get(position as usize)
    }

    pub fn get_following(&self) -> Option<&PlaybackItem> {
        let position = self
            .positions
            .get(self.following_position() as usize)
            .copied()?;
        self.items.get(position as usize)
    }

    fn previous_position(&self) -> u64 {
        match self.behavior {
            QueueBehavior::Sequential
            | QueueBehavior::Random
            | QueueBehavior::LoopTrack
            | QueueBehavior::LoopAll => self.position.saturating_sub(1),
        }
    }

    fn next_position(&self) -> u64 {
        match self.behavior {
            QueueBehavior::Sequential | QueueBehavior::Random | QueueBehavior::LoopTrack => {
                self.position + 1
            }
            QueueBehavior::LoopAll => (self.position + 1) % (self.items.len() as u64),
        }
    }

    fn following_position(&self) -> u64 {
        match self.behavior {
            QueueBehavior::Sequential | QueueBehavior::Random => self.position + 1,
            QueueBehavior::LoopTrack => self.position,
            QueueBehavior::LoopAll => (self.position + 1) % self.items.len() as u64,
        }
    }
}

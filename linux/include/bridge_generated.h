#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct WireSyncReturnStruct {
  uint8_t *ptr;
  int32_t len;
  bool success;
} WireSyncReturnStruct;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

void wire_platform(int64_t port_);

void wire_rust_release_mode(int64_t port_);

void wire_play_beep(int64_t port_, float freq, uint64_t duration_ms, float amplification);

void wire_play_song(int64_t port_, struct wire_uint_8_list *s_path);

void wire_init_player(int64_t port_);

void wire_play(int64_t port_);

void wire_pause(int64_t port_);

void wire_shuffle(int64_t port_);

void wire_set_volume(int64_t port_, float volume);

void wire_set_speed(int64_t port_, float speed);

void wire_get_volume(int64_t port_);

void wire_get_speed(int64_t port_);

void wire_load(int64_t port_, struct wire_uint_8_list *source);

struct wire_uint_8_list *new_uint_8_list(int32_t len);

void free_WireSyncReturnStruct(struct WireSyncReturnStruct val);

void store_dart_post_cobject(DartPostCObjectFnType ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_platform);
    dummy_var ^= ((int64_t) (void*) wire_rust_release_mode);
    dummy_var ^= ((int64_t) (void*) wire_play_beep);
    dummy_var ^= ((int64_t) (void*) wire_play_song);
    dummy_var ^= ((int64_t) (void*) wire_init_player);
    dummy_var ^= ((int64_t) (void*) wire_play);
    dummy_var ^= ((int64_t) (void*) wire_pause);
    dummy_var ^= ((int64_t) (void*) wire_shuffle);
    dummy_var ^= ((int64_t) (void*) wire_set_volume);
    dummy_var ^= ((int64_t) (void*) wire_set_speed);
    dummy_var ^= ((int64_t) (void*) wire_get_volume);
    dummy_var ^= ((int64_t) (void*) wire_get_speed);
    dummy_var ^= ((int64_t) (void*) wire_load);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturnStruct);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}
//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <beep/beep_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) beep_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "BeepPlugin");
  beep_plugin_register_with_registrar(beep_registrar);
}

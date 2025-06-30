//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <random_toolkit/random_toolkit_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) random_toolkit_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RandomToolkitPlugin");
  random_toolkit_plugin_register_with_registrar(random_toolkit_registrar);
}

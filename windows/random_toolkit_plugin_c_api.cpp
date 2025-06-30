#include "include/random_toolkit/random_toolkit_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "random_toolkit_plugin.h"

void RandomToolkitPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  random_toolkit::RandomToolkitPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

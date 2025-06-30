#ifndef FLUTTER_PLUGIN_RANDOM_TOOLKIT_PLUGIN_H_
#define FLUTTER_PLUGIN_RANDOM_TOOLKIT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace random_toolkit {

class RandomToolkitPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  RandomToolkitPlugin();

  virtual ~RandomToolkitPlugin();

  // Disallow copy and assign.
  RandomToolkitPlugin(const RandomToolkitPlugin&) = delete;
  RandomToolkitPlugin& operator=(const RandomToolkitPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace random_toolkit

#endif  // FLUTTER_PLUGIN_RANDOM_TOOLKIT_PLUGIN_H_

//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <mmkv_linux/mmkv_linux_plugin.h>
#include <objectbox_flutter_libs/objectbox_flutter_libs_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) mmkv_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MmkvLinuxPlugin");
  mmkv_linux_plugin_register_with_registrar(mmkv_linux_registrar);
  g_autoptr(FlPluginRegistrar) objectbox_flutter_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ObjectboxFlutterLibsPlugin");
  objectbox_flutter_libs_plugin_register_with_registrar(objectbox_flutter_libs_registrar);
}

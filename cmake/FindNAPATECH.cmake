# - Try to find the Napatech headers and libraries
#
# Usage of this module as follows:
#
#     find_package(NAPATECH)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  NAPATECH_ROOT_DIR  Set this variable to the root installation of
#                     Napatech if the module has problems finding
#                     the proper installation path.
#
# Variables defined by this module:
#
#  NAPATCH_FOUND              System has Napatech libs/headers
#  NAPATECH_LIBRARY           The Napatech libraries
#  NAPATECH_INCLUDE           The location of Napatech headers

find_path(NAPATECH_ROOT_DIR
  NAMES include/nt.h
)

find_library(NAPATECH_LIBRARY
  NAMES ntapi
  HINTS ${NAPATECH_ROOT_DIR}/lib
)

find_path(NAPATECH_INCLUDE
  NAMES nt.h
  HINTS ${NAPATECH_ROOT_DIR}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(NAPATECH DEFAULT_MSG
  NAPATECH_LIBRARY
  NAPATECH_INCLUDE
)

mark_as_advanced(
  NAPATECH_ROOT_DIR
  NAPATECH_LIBRARY
  NAPATECH_INCLUDE
)

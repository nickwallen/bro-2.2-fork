# Tries to find Kafka C Client headers and libraries.
#
# Usage of this module as follows:
#
#  find_package(KafkaC)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  KAFKA_ROOT_DIR  Set this variable to the root installation of
#                  Kafka Library if the module has problems finding
#                  the proper installation path.
#
# Variables defined by this module:
#
#  KAFKA_C_FOUND              System has Kafka libs/headers
#  KAFKA_C_LIBRARIES          The Kafka libraries
#  KAFKA_C_INCLUDE_DIRS       The location of Kafka headers

find_path(KAFKA_C_INCLUDE_DIR 
    NAMES
        rdkafka.h
    PATHS 
        ${KAFKA_ROOT_DIR}/include
    PATH_SUFFIXES 
        librdkafka
)

if (KAFKA_C_LINK_STATIC) 
    set (KAFKA_C_LOOK_FOR_LIB_NAMES librdkafka.a rdkafka)
else ()
    set (KAFKA_C_LOOK_FOR_LIB_NAMES rdkafka)
endif ()

find_library(KAFKA_C_LIBRARY
    NAMES 
        ${KAFKA_C_LOOK_FOR_LIB_NAMES}
    PATHS 
        ${KAFKA_ROOT_DIR}/lib 
)
			 
include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set KAFKA_C_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(KAFKA_C
    DEFAULT_MSG
    KAFKA_C_LIBRARY 
    KAFKA_C_INCLUDE_DIR
)

mark_as_advanced(KAFKA_C_INCLUDE_DIR KAFKA_C_LIBRARY)

if (KAFKA_C_FOUND)
    set(KAFKA_C_INCLUDE_DIRS ${KAFKA_C_INCLUDE_DIR})
    set(KAFKA_C_LIBRARIES ${KAFKA_C_LIBRARY})
	
    get_filename_component (KAFKA_C_LIBRARY_DIR ${KAFKA_C_LIBRARY} PATH)
    get_filename_component (KAFKA_C_LIBRARY_NAME ${KAFKA_C_LIBRARY} NAME_WE)
    
    mark_as_advanced (KAFKA_C_LIBRARY_DIR KAFKA_C_LIBRARY_NAME)
endif ()

cmake_minimum_required(VERSION 3.23.0)
project(encoder VERSION 1.0.0 LANGUAGES CXX C)
set(CMAKE_CXX_STANDARD 17)

############################################
# Optional variables
############################################
option(AVR_8 "Build for AVR 8-bit architecture" OFF)
option(X86_64 "Build for x86_64 architecture" ON)


add_library(encoder
  Encoder.cpp
)

target_include_directories(encoder PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}
)

if (AVR_8)
  target_link_libraries(encoder PRIVATE ArduinoCore)
      target_compile_definitions(encoder PUBLIC
    ARDUINO=100
    __AVR_ATmega328P__
    ARDUINO_UNOR4_WIFI
    "port_to_output_PGM=(uint16_t*)0"
    "port_to_input_PGM=(uint16_t*)0"
    "port_to_mode_PGM=(uint16_t*)0"
    "digital_pin_to_port_PGM=(uint8_t*)0"
    "digital_pin_to_bit_mask_PGM=(uint8_t*)0"
    "digital_pin_to_timer_PGM=(uint8_t*)0"
  )
elseif(X86_64)
  include(cmake/arduinofake.cmake)
  target_link_libraries(encoder PUBLIC ArduinoFake)
  # fake definitions to make the code compile
  target_compile_definitions(encoder PUBLIC
    ARDUINO=100
    __AVR_ATmega328P__
    ARDUINO_UNOR4_WIFI
    "port_to_output_PGM=(uint16_t*)0"
    "port_to_input_PGM=(uint16_t*)0"
    "port_to_mode_PGM=(uint16_t*)0"
    "digital_pin_to_port_PGM=(uint8_t*)0"
    "digital_pin_to_bit_mask_PGM=(uint8_t*)0"
    "digital_pin_to_timer_PGM=(uint8_t*)0"
  )

endif()

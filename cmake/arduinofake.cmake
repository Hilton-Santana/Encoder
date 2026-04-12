include(FetchContent)

FetchContent_Declare(
  ArduinoFake
  GIT_REPOSITORY https://github.com/Hilton-Santana/ArduinoFake.git
  GIT_TAG        master
)
FetchContent_MakeAvailable(ArduinoFake)  # or Populate + add_subdirectory
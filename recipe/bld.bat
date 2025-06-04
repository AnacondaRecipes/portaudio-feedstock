cmake %CMAKE_ARGS% -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DBUILD_SHARED_LIBS=ON ^
      -DPA_LIBNAME_ADD_SUFFIX:BOOL=OFF ^
      -DPA_BUILD_STATIC:BOOL=OFF ^
      .
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

echo "Starting installation step..."
cmake --build . --config Release --target install
if errorlevel 1 (
  echo "cmake --build install failed, trying cmake --install..."
  cmake --install . --config Release
  if errorlevel 1 exit 1
)


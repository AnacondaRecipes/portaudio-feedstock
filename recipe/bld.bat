cmake -G"%CMAKE_GENERATOR%" ^
      %CMAKE_ARGS% ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DTARGET_POSTFIX= ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DBUILD_SHARED_LIBS=ON ^
      -DPA_LIBNAME_ADD_SUFFIX:BOOL=OFF ^
      -DPA_BUILD_STATIC:BOOL=OFF ^
      .
if errorlevel 1 exit 1

cmake --build . --target ALL_BUILD --config Release
if errorlevel 1 exit 1

copy /y Release\*.dll %LIBRARY_BIN%
copy /y Release\*.lib %LIBRARY_LIB%
copy /y include\*.h %LIBRARY_INC%


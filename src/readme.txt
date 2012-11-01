

Build for Windows
=================


1.) Install HXCPP and Visual Studio C++ Express (if you don't have them already)


2.) Download wxWidgets 2.9.3 and extract it into "wxwidgets" next to the waxe directory (or you can set WXROOT for a different path)


3.) Browse to where you extracted wxWidgets and edit "build/msw/config.vc"
	
	BUILD = release
	RUNTIME_LIBS = static
	
	
4.) Open the Visual Studio Command Prompt (available from the Start Menu)
	
	cd build/msw
	nmake -f makefile.vc


5.) From the directory where this "readme" is located, use a command prompt to compile the Windows NDLL
	
	haxelib run hxcpp Build.xml
	


	
Build for Mac
=============


1.) Download wxWidgets 2.9.3 and extract it into "wxwidgets" next to the waxe directory (or you can set WXROOT for a different path)


2.) Change to the directory where you extracted wxWidgets, using a terminal, then compile the library
	
	mkdir mac
	cd mac
	../configure --with-osx-cocoa --disable-shared --disable-svg with_libtiff=no with_regex=no with_expat=no --enable-stc --disable-debug_flag  --with-opengl CFLAGS="-m32 -fvisibility=hidden" CXXFLAGS="-m32 -fvisibility=hidden" OBJCXXFLAGS="-m32 -fvisibility=hidden" OBJCFLAGS="-m32 -fvisibility=hidden"
	make
	
	
4.) From the directory where this "readme" is located, use the terminal to compile the Mac NDLL
	
	haxelib run hxcpp Build.xml


	
	
Build for Linux
===============


NOTE: Everything compiles successfully, but there are some linker errors at the end. Maybe we need different build or configure flags?


1.) Install dependencies for GTK+ and cross-compiling (so you can compile 32-bit from 64-bit Linux)
	
	sudo apt-get install build-essential libgtk2.0-dev ia32-libs gcc-multilib g++-multilib


2.) Download wxWidgets 2.9.3 and extract it into "wxwidgets" next to the waxe directory (or you can set WXROOT for a different path)


3.) Change to the directory where you extracted wxWidgets, using a terminal, then compile the library
	
	(32-bit)
	
	mkdir linux
	cd linux
	../configure --disable-shared --with-opengl CC="cc -m32" CXX="g++ -m32" --build=i486-pc-linux-gnu --with-gtk with_libtiff=no with_expat=no with_regex=no --without-gtkprint
	make
	
	(64-bit)
	
	mkdir linux64
	cd linux64
	../configure -q --disable-shared --with-opengl --disable-debug_flag CC="cc -fpic -fPIC" CXX="g++ -fpic -fPIC" --with-gtk with_libtiff=no with_expat=no with_regex=no --without-gtkprint
	make
	
	
4.) From the directory where this "readme" is located, use the terminal to compile the Linux NDLL
	
	(32-bit)
	
	haxelib run hxcpp Build.xml
	
	(64-bit)
	
	haxelib run hxcpp Build.xml -DHXCPP_M64


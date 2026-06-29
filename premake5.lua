project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	
	targetdir ("%{wks.location}/Binaries/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")
	
	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_demo",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"imgui_tables.cpp"
	}
	
	--filter "system:windows"
		--systemversion "latest"

	filter { "configurations:DebugEditor or configurations:DebugRuntime" }
		runtime "Debug"
		symbols "on"
    filter{}

	filter { "configurations:ReleaseEditor or configurations:ReleaseRuntime" }
		runtime "Release"
		optimize "speed"
    filter{}

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"
    filter{}

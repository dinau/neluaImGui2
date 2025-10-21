# All examples will be built at a time.
#
EXAMPLE_DIRS := \
							glfw_opengl3 \
							glfw_opengl3_jp \
							iconFontViewer \
							imColorTextEditDemo \
							imFileDialogDemo \
							imGuiToggleDemo \
							imGuizmoDemo \
							imKnobsDemo \
							imNodesDemo \
							imPlot3DDemo \
							imPlotDemo \
							imSpinnerDemo \
							sdl2_opengl3


ifeq ($(OS),Windows_NT)
	#EXAMPLE_DIRS +=  examples/sdl3_opengl3
endif

all:
	@nelua --version
	@$(foreach exdir,$(EXAMPLE_DIRS), $(call def_make,$(exdir),$@))

.PHONY: clean

clean:
	@$(foreach exdir,$(EXAMPLE_DIRS), $(call def_make,$(exdir),clean))


#
define def_make
	@echo --------------------------------------------
	@echo --- Enter: examples/$(1) $(2)
	@echo --------------------------------------------
	@$(MAKE) -C  examples/$(1) $(2)

endef

MAKEFLAGS += --no-print-directory

#-------------------------
# Copy external libraries
#-------------------------
EXT_LIB_DIR = c:/000imguin_dev/imguin_git/libs
EXT_DEAR_BINDINGS_DIR = c:/000imguin_dev/00dear_bindings_data/dear_bindings
TARGET_DIR = libs

copylibs: imgui dcimgui implot imnodes imguizmo ImGuiFileDialog imgui_toggle implot3d imspinner imCTE imgui-knobs
	@$(MAKE) -C libs/libs_hash

imCTE:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/ImGuiColorTextEdit/vendor/regex
	@cp -f $(EXT_LIB_DIR)/c$@/{*.cpp,*.h,README.md}                            $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/ImGuiColorTextEdit/{LICENSE,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/ImGuiColorTextEdit/
	@cp -f $(EXT_LIB_DIR)/c$@/ImGuiColorTextEdit/vendor/regex/*.*              $(TARGET_DIR)/c$@/ImGuiColorTextEdit/vendor/regex/
	@cp -rf $(EXT_LIB_DIR)/c$@/ImGuiColorTextEdit/vendor/regex/include         $(TARGET_DIR)/c$@/ImGuiColorTextEdit/vendor/regex/include

imgui:
	@echo copying [ $(EXT_LIB_DIR)/$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/$@
	@-mkdir -p $(TARGET_DIR)/$@/backends
	@cp -f $(EXT_LIB_DIR)/c$@/$@/{LICENSE.txt,*.cpp,*.h}              $(TARGET_DIR)/$@/
	@cp -f $(EXT_LIB_DIR)/c$@/$@/backends/{*.cpp,*.h}      	          $(TARGET_DIR)/$@/backends/

dcimgui:
	@echo copying [ $(EXT_LIB_DIR)/$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/$@
	@-mkdir -p $(TARGET_DIR)/$@/backends
	@cp -f $(EXT_DEAR_BINDINGS_DIR)/LICENSE.txt                       $(TARGET_DIR)/$@/
	@cp -f $(EXT_DEAR_BINDINGS_DIR)/generated/{*.cpp,*.h}             $(TARGET_DIR)/$@/
	@cp -f $(EXT_DEAR_BINDINGS_DIR)/generated/backends/{*.cpp,*.h}    $(TARGET_DIR)/$@/backends/

imgui_toggle:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/$@
	@cp -f $(EXT_LIB_DIR)/c$@/{LICENSE,*.cpp,*.h,README.md}         $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/libs/$@/{LICENSE,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/$@/

ImGuiFileDialog:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/C$@/libs/ImGuiFileDialog/dirent
	@-mkdir -p $(TARGET_DIR)/C$@/libs/ImGuiFileDialog/stb
	@cp -f $(EXT_LIB_DIR)/CImGuiFileDialog/{LICENSE,README.md,*.h} 	                           $(TARGET_DIR)/cimguifiledialog/
	@cp -f $(EXT_LIB_DIR)/CImGuiFileDialog/libs/ImGuiFileDialog/{LICENSE,*.cpp,*.h,README.md}  $(TARGET_DIR)/CImGuiFileDialog/libs/ImGuiFileDialog/
	@cp -f $(EXT_LIB_DIR)/CImGuiFileDialog/libs/ImGuiFileDialog/dirent/{LICENSE,*.h,README.md} $(TARGET_DIR)/CImGuiFileDialog/libs/ImGuiFileDialog/dirent/
	@cp -f $(EXT_LIB_DIR)/CImGuiFileDialog/libs/ImGuiFileDialog/stb/{LICENSE,*.h,README.md}    $(TARGET_DIR)/CImGuiFileDialog/libs/ImGuiFileDialog/stb/

imguizmo:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/ImGuizmo
	@cp -f $(EXT_LIB_DIR)/c$@/{LICENSE,*.cpp,*.h,README.md}          $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/ImGuizmo/{LICENSE,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/ImGuizmo/

imnodes:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/$@
	@-mkdir -p $(TARGET_DIR)/c$@/generator
	@cp -f $(EXT_LIB_DIR)/c$@/{README.md,*.cpp,*.h}               $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/generator/{*.cpp,*.h}               $(TARGET_DIR)/c$@/generator/
	@cp -f $(EXT_LIB_DIR)/c$@/$@/{LICENSE.md,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/$@/

implot:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/$@
	@cp -f $(EXT_LIB_DIR)/c$@/{LICENSE,*.cpp,*.h,README.md}    $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/$@/{LICENSE,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/$@/

implot3d:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/$@
	@cp -f $(EXT_LIB_DIR)/c$@/{*.cpp,*.h,README.md}            $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/$@/{LICENSE,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/$@/

imspinner:
	@echo copying [ $(EXT_LIB_DIR)/$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/$@
	@-cp -f $(EXT_LIB_DIR)/$@/{*.cpp,*.h,LICENSE.txt,*.md} $(TARGET_DIR)/c$@/$@/

imgui-knobs:
	@echo copying [ $(EXT_LIB_DIR)/c$@] to $(TARGET_DIR)/
	@-mkdir -p $(TARGET_DIR)/c$@/libs/$@
	@cp -f $(EXT_LIB_DIR)/c$@/{LICENSE,*.cpp,*.h,README.md}         $(TARGET_DIR)/c$@/
	@cp -f $(EXT_LIB_DIR)/c$@/libs/$@/{LICENSE,*.cpp,*.h,README.md} $(TARGET_DIR)/c$@/libs/$@/

#-----------------------------------
# Generate libs/nelua/imgui/*.nelua
#-----------------------------------
CFLAGS += -Ilibs/cimgui
OPT += --cflags="$(CFLAGS)"
ORG_H = libs/CImGuiFileDialog/libs/ImGuiFileDialog/ImGuiFileDialog.h
TMP_H = tmp.h
SAVE_H = ImGuiFileDialog.h.org
NELUA_IMGUI_DIR = libs/nelua/imgui

# To update libs
#    1. make copylibs
#    2. make gen
gen: imspinner_patch
	@cp -f $(ORG_H) $(SAVE_H)
	@(echo "#include \"dcimgui.h\"" > $(TMP_H); cat $(ORG_H) >> $(TMP_H); mv -f $(TMP_H) $(ORG_H) )
	@-nelua $(OPT) genLibsBind.nelua
	@mv -f $(SAVE_H) $(ORG_H)
	mv -f cimspinner.h libs/cimspinner/imspinner/cimspinner.h

imspinner_patch:
	@cp -f libs/cimspinner/imspinner/cimspinner.h .
	@sed -i '1i#include "dcimgui.h"'  libs/cimspinner/imspinner/cimspinner.h

genimplot:
	@echo Generated [$(NELUA_IMGUI_DIR)/imPlotFuncs.nelua]
	@-(cd $(NELUA_IMGUI_DIR); ruby genImPlotFuncs.rb)

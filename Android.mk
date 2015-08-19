# For Android L MR1 and lower, need to include libstlport
# For M, this is not needed
MAJOR_VERSION := $(shell echo $(PLATFORM_VERSION) | cut -f1 -d.)
MINOR_VERSION := $(shell echo $(PLATFORM_VERSION) | cut -f2 -d.)

ifeq ($(shell test $(MAJOR_VERSION) -le 4 && echo 1), 1)
INCLUDE_STLPORT:=true
else ifeq ($(shell test $(MAJOR_VERSION) -eq 5 -a $(MINOR_VERSION) -le 1 && echo 1), 1)
INCLUDE_STLPORT:=true
else
INCLUDE_STLPORT:=false
endif

# Recursive call sub-folder Android.mk
#
ifeq ($(HOST_OS),linux)
include $(call all-subdir-makefiles)
endif

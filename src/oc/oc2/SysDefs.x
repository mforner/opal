# Definitions for: oc2
#
# $Header: /home/florenz/opal/home_uebb_CVS/CVS/ocs/src/oc/oc2/SysDefs.x,v 1.1.1.1 1998-06-16 15:59:47 wg Exp $


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fundamental system definitions (please fill out)


# Name of the system 

NODENAME = oc2


# The names of the direct subdirectories of this node 
# also to be built. NOTE that these are not the OCS subsystems 
# but rather reflect the hierarchy of the project tree. 

SUBNODES  = optim trans gen driver


# Sources of the system included into a release

SOURCES = SysDefs 


# Manuals attached to this system included into a release

MANUALS = 


# All components of this system. Add here auxiliary
# files which shall not be included into a release.

COMPONENTS = $(SOURCES) $(MANUALS) Makefile.boot

# Include this statement to deactivate the derived object cache. 
#.BPOOL:

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fundamental system rules (please fill out)


# The default target

_default: all


# The action on this node associated with 'all'

_all:
	

# The action on this node associated with 'clean'

_clean:


# The action associated with 'install' 

_install: _installmanuals


# A definitions and rules file which shall be build and afterwards recursivly 
# included with each run of shape. If LOCALDEFS is defined, you must 
# also give a rule how to create it.

LOCALDEFS =

#include $(LOCALDEFS)
#$(LOCALDEFS):


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Release management definitions (fill out if required)

# Path to this node relative to the root of the release tree

RELEASENODEPATH = src/oc/oc2

# Derived objects which shall be included into the release

RELEASEOBJECTS =



# Path to the boot area for this node relative to the release tree

RELEASEBOOTPATH = src/oc/boot/oc2

# Sources which shall be included into the boot area of a release

BOOTSOURCES = Makefile.boot

# Derived objects which shall be included into the boot area of a release

BOOTOBJECTS =


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Release management rules (fill out if required)


# The action to derive the release objects

_releaseobjects:

# The action to derive the boot objects

_bootobjects:


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Include generic rules (do not change)

include $(OMLIBPATH)/GlobalRules

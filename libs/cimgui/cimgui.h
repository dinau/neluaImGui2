#pragma once

#ifdef NELUA_GEN
    #include "dcimgui.h"
    #include "dcimgui_internal.h"
#endif

#if defined _WIN32 || defined __CYGWIN__
    #ifdef CIMGUI_NO_EXPORT
        #define API
    #else
        #define API __declspec(dllexport)
    #endif
#else
    #ifdef __GNUC__
        #define API  __attribute__((__visibility__("default")))
    #else
        #define API
    #endif
#endif

#if defined __cplusplus
    #define EXTERN extern "C"
#else
    #include <stdarg.h>
    #include <stdbool.h>
    #define EXTERN extern
#endif

#ifndef CIMGUI_API
    #define CIMGUI_API EXTERN API
#endif
#define CONST const

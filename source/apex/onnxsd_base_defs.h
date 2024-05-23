﻿/*
 * Copyright (c) 2018-2050 BasicDefs&Refs - Arikan.Li
 * Created by Arikan.Li on 2024/05/09.
*/
#ifndef ONNX_SD_DEFS_H_
#define ONNX_SD_DEFS_H_

#include <cinttypes>
#include <climits>
#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstdint>

#include <string>
#include <algorithm>
#include <functional>
#include <map>
#include <cmath>
#include <mutex>
#include <vector>
#include <random>
#include <atomic>
#include <sstream>
#include <fstream>
#include <iostream>
#include <memory>
#include <regex>
#include <tuple>
#include <unordered_map>

#ifdef USE_CUDA
#include "cuda_provider_factory.h"
#endif
#ifdef USE_DML
#include "dml_provider_factory.h"
#endif
#ifdef USE_TENSORRT
#include tensorrt_provider_factory.h"
#endif
#ifdef USE_COREML
#include "coreml_provider_factory.h"
#endif

#include "onnxruntime_cxx_api.h"

#endif
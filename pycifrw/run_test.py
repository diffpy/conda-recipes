#!/usr/bin/env python

import warnings

warnings.filterwarnings("error", message='invalid escape sequence',
                        category=DeprecationWarning)

import CifFile.StarFile
import CifFile.StarScan

# ICFEPUQ-MatLab

An Uncertainty Quantification (UQ) library built in Matlab to work with Imperial College Finite Element Program (ICFEP) and Abaqus. 

Copyright 2023 [Truong Le](mailto:truong.le@imperial.ac.uk), [Ningxin Yang](mailto:n.yang23@imperial.ac.uk) 


## User Guide

### Initial Setup

### Prerequisites

Python `py` codeblock:

``` py title="example.py"
pip install numpy
```

Matlab `matlab` codeblock:

``` matlab title="example.m" linenums="1" hl_lines="2 3"
%raw output data before post processsing
Raw_Y_Sum_1 = {};
Raw_Y_Sum_2 = {};

% define the file .mat file stored
subfolder = 'FE_Result';

% get how many runs successfully saved in file 'FE_Result'
dirList = dir([pwd() '\FE_Result']);
N_FE_RUN = length(dirList) - 2;

clearvars; clear all; clc
str = pwd();
sha256hasher = System.Security.Cryptography.SHA256Managed;
sha256 = uint8(sha256hasher.ComputeHash(uint8(str)));
seed = sum(sha256);
rng(uint16(seed),'twister')
addpath('E:\tl\UQLab_Rel2.0.0\core') % UQLAB location
addpath('E:\tl\MATLABCODEMAIN\Main\ICFEPUQLINK')
addpath('E:\tl\DATA\LoadedConductor')
uqlab
global sampleNumber
sampleNumber = 0;
```

### Inputs


    input/
        DRAFT_A_MIS.xlsm
        DRAFT_B_MIS.xlsm
        flags.csv
        notes.csv
    output/
        tex/
            Makefile
            drawlines
        csv/
    src/ 
        readers.py
        mug.py
        writers.py
        parameters.py
        environments.py
        main.py
        metadata.csv


### Outputs

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Quick start guide

## Quick start guide

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

# File directory

~~~~
Program: ICFEPUQ-m  (matlab version)
~~~~

~~~~
mkdocs.yml                  # docs
docs/
    index.md                # docs
    userguide.md            # docs
    filedirectory.md        # docs
    about.md                # docs
input/
    input.csv               # probablistic model inputs
    metadata.csv            # metadata (relative paths and directory)
output/
    fig/
        *.jpg               # outputs as jpgs (600dpi)
        *.pdf               # outputs as pdf
    FE_results/
        {run_i}.m           # each run is saved as a separate .m file
    mat/
        all_results.mat     # collation of FE_results/{run_i}.m files
        {modelname}.mat     # UQLab .m file (uq_ProcessedX & uqprocessedY) 
        *.mat               # saved mat files
src/ 
    Main.mlx                # main()
    Wrapper.m               # initializes UQlink and uq_createModel(ModelOpts)
    DataInput.m             # initializes probablistic input via uq_createInput(InputOpts)
    ReadOutput.m            # output parser required by wrapper.m
    src_util.m              # empty src_util.m
util/
    util.m                  # empty utilities
~~~~

<!-- 

TODO

~~~~
     +------------------+
     | DRAFT_MIS_A.xlsm |
     | DRAFT_MIS_B.xlsm |
     +------------------+
               |                       parameters.py
               | readers.py  <-------- environment.py
               v
        +--------------+        
        |  mug.py:Mug  | 
        +--------------+
               |
               | writers.py
               v
      +------------------+
      | output/tex/      |
      | output/csv/      |
      +------------------+
~~~~  -->

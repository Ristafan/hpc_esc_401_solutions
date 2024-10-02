# Exercise Session 02 #
In this session, you will compile and run your first programs on Eiger. This directory contains two versions of the code that were parallelized using MPI or OpenMP.

## Remarks
Sadly I wasn't able to complete everything because I have to work (part-time) and I took a weekend off to go to Copenhagen. Also cscs seemed to have some problems so I wasn't able to run all my jobs. I hope I'll have more time for the next exercise.

## Exercise 2
When running 
```bash
module lsit
```
<details>
  
<summary>This command shows the currently loaded modules in my enviornment.</summary>

- `PrgEnv-cray/8.5.0``has been replaced with `PrgEnv-gnu/8.5.0`
-  `cce/17.0.0` (Cray Compiler Environment) has been replaced with `gcc-native/12.3` (GNU Compiler Collection)
-  `cray-mpich/8.1.28` and `cpe/23.12` were added

```bash
Currently Loaded Modules:
  1) craype-x86-rome      4) xpmem/2.8.2-1.0_3.9__g84a27a5.shasta   7) cray/23.12       10) cray-dsmml/0.2.2     13) PrgEnv-gnu/8.5.0
  2) libfabric/1.15.2.0   5) perftools-base/23.12.0                 8) gcc-native/12.3  11) cray-mpich/8.1.28
  3) craype-network-ofi   6) cpe/23.12
```

</details>

When running
```bash
module avail
```

<details>

<summary>This command lists all available modules that could be loaded into the enviornment.</summary>

```bash
----------------------------------- /opt/cray/pe/lmod/modulefiles/mpi/gnu/12.0/ofi/1.0/cray-mpich/8.0 ------------------------------------
   cray-hdf5-parallel/1.12.2.9    cray-mpixlate/1.0.3    cray-parallel-netcdf/1.12.3.9

----------------------------------------- /opt/cray/pe/lmod/modulefiles/comnet/gnu/12.0/ofi/1.0 ------------------------------------------
   cray-mpich-abi/8.1.28    cray-mpich/8.1.28 (L)

---------------------------------------------- /opt/cray/pe/lmod/modulefiles/mix_compilers -----------------------------------------------
   aocc-mixed/4.1.0    gcc-native-mixed/12.3           intel-mixed/2023.2.0
   cce-mixed/17.0.0    intel-classic-mixed/2023.2.0    intel-oneapi-mixed/2023.2.0

-------------------------------------------- /opt/cray/pe/lmod/modulefiles/compiler/gnu/12.0 ---------------------------------------------
   cray-hdf5/1.12.2.9    cray-libsci/23.12.5 (L)

-------------------------------------------------- /capstor/apps/cscs/eiger/modulefiles --------------------------------------------------
   CMake/3.20.1                 NCL/6.6.2        cpeIntel/23.12             jupyter-utils/0.1           reframe-cscs-tests/24.08 (D)
   CMake/3.21.2                 OOOPS/1.0        ddt/22.1.3-linux-x86_64    patchelf/0.18.0             reframe/4.5.1
   CMake/3.22.1                 cpeAMD/23.12     git-lfs/3.4.1              reframe-cscs-tests/24.03    reframe/4.6.0            (D)
   CMake/3.26.5          (D)    cpeCray/23.12    hub/2.14.2                 reframe-cscs-tests/24.05    singularity/3.6.4-eiger
   EasyBuild-custom/cscs        cpeGNU/23.12     hwloc/2.4.1                reframe-cscs-tests/24.07    w3m/0.5.3+git20210102-6

-------------------------------------------- /opt/cray/pe/lmod/modulefiles/perftools/23.12.0 ---------------------------------------------
   perftools-lite-events    perftools-lite-hbm      perftools-lite       perftools
   perftools-lite-gpu       perftools-lite-loops    perftools-preload

----------------------------------------------- /opt/cray/pe/lmod/modulefiles/net/ofi/1.0 ------------------------------------------------
   cray-openshmemx/11.7.0

--------------------------------------------- /opt/cray/pe/lmod/modulefiles/cpu/x86-rome/1.0 ---------------------------------------------
   cray-fftw/3.3.10.6

--------------------------------------------------- /opt/cray/pe/lmod/modulefiles/core ---------------------------------------------------
   PrgEnv-aocc/8.5.0         cpe/23.12               (L)    cray-pmi/6.1.13               intel-oneapi/2023.2.0  (D)
   PrgEnv-cray/8.5.0         cray-R/4.3.1                   cray-python/3.11.5            intel/2023.2.0         (D)
   PrgEnv-gnu/8.5.0   (L)    cray-ccdb/5.0.2                cray-stat/4.12.2              iobuf/2.0.10
   PrgEnv-intel/8.5.0        cray-cti/2.18.2                craype/2.7.30          (L)    papi/7.0.1.2
   aocc/4.1.0         (D)    cray-dsmml/0.2.2        (L)    craypkg-gen/1.3.31            perftools-base/23.12.0 (L)
   atp/3.15.2                cray-dyninst/12.3.1            gcc-native/12.3        (L)    sanitizers4hpc/1.1.2
   cce/17.0.0                cray-libsci_acc/23.12.0        gdb4hpc/4.16.0                valgrind4hpc/2.13.2
   cpe-cuda/23.12            cray-mrnet/5.1.2               intel-classic/2023.2.0 (D)

------------------------------------------ /opt/cray/pe/lmod/modulefiles/craype-targets/default ------------------------------------------
   craype-accel-amd-gfx908    craype-accel-nvidia90    craype-hugepages2G      craype-hugepages8M         craype-x86-milan
   craype-accel-amd-gfx90a    craype-arm-grace         craype-hugepages2M      craype-network-none        craype-x86-rome    (L)
   craype-accel-amd-gfx940    craype-hugepages128M     craype-hugepages32M     craype-network-ofi  (L)    craype-x86-spr-hbm
   craype-accel-host          craype-hugepages16M      craype-hugepages4M      craype-network-ucx         craype-x86-spr
   craype-accel-nvidia70      craype-hugepages1G       craype-hugepages512M    craype-x86-genoa           craype-x86-trento
   craype-accel-nvidia80      craype-hugepages256M     craype-hugepages64M     craype-x86-milan-x

--------------------------------------------------------- /opt/cray/modulefiles ----------------------------------------------------------
   dvs/2.15_4.7.72-1.0_12.10__g7e33612d    libfabric/1.15.2.0 (L)    xpmem/2.8.2-1.0_3.9__g84a27a5.shasta (L)

------------------------------------------------------------ /opt/modulefiles ------------------------------------------------------------
   aocc/4.1.0    darshan/3.2.1    intel-classic/2023.2.0    intel-oneapi/2023.2.0    intel/2023.2.0

----------------------------------------------------------- /etc/cscs-modules ------------------------------------------------------------
   cray/23.12 (L)

  Where:
   L:  Module is loaded
   D:  Default Module

If the avail list is too long consider trying:

"module --default avail" or "ml -d av" to just list the default modules.
"module overview" or "ml ov" to display the number of modules for each name.

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
```

</details>

And finally, when running 
```bash
module spider
```

<details>

<summary>This command shows a overview of all modules.</summary>
  
```bash
--------------------------------------------------------------------------------------------------------------------------------------
The following is a list of the modules and extensions currently available:
--------------------------------------------------------------------------------------------------------------------------------------
  Boost: Boost/1.78.0-python3, Boost/1.78.0
    Boost provides free peer-reviewed portable C++ source libraries.

  CDI: CDI/2.2.4-parallel
    CDI is a C and Fortran Interface to access Climate and NWP model Data. Supported data formats are GRIB, netCDF, SERVICE, EXTRA
    and IEG.

  CDO: CDO/1.9.10
    CDO is a collection of command line Operators to manipulate and analyse Climate and NWP model Data.

  CMake: CMake/3.20.1, CMake/3.21.2, CMake/3.22.1, CMake/3.26.5
    CMake, the cross-platform, open-source build system. CMake is a family of tools designed to build, test and package software.

  CP2K: CP2K/9.1
    CP2K is a freely available (GPL) program, written in Fortran 95, to perform atomistic and molecular simulations of solid state,
    liquid, molecular and biological systems. It provides a general framework for different methods such as e.g. density functional
    theory (DFT) using a mixed Gaussian and plane waves approach (GPW), and classical pair and many-body potentials.

  Catalyst: Catalyst/2.0.0-rc4
    Catalyst is an API specification developed for simulations (and other scientific data producers) to analyze and visualize data in
    situ.

  Charm++: Charm++/6.10.2
    Charm++ is a machine independent parallel programming system. Programs written using this system will run unchanged on MIMD
    machines with or without a shared memory.

  CubeLib: CubeLib/4.5
    Cube Library is a general purpose library for reading and writing of a multi-dimensional performance space consisting of the
    dimensions (i) performance metric, (ii) call path, and (iii) system resource.

  ELPA: ELPA/2021.11.001, ELPA/2023.11.001, ELPA/2024.03.001
    Eigenvalue SoLvers for Petaflop-Applications.

  EasyBuild: EasyBuild/4.7.0, EasyBuild/4.8.2, EasyBuild/4.9.0
    EasyBuild is a software build and installation framework written in Python that allows you to install software in a structured,
    repeatable and robust way.

  EasyBuild-custom: EasyBuild-custom/cscs
    Production EasyBuild @ CSCS

  FFmpeg: FFmpeg/5.0
    A complete, cross-platform solution to record, convert and stream audio and video.

  GREASY: GREASY/19.03-cscs
    Greasy is a tool designed to make easier the deployment of embarrassingly parallel simulations in any environment. It is able to
    run in parallel a list of different tasks.

  GROMACS: GROMACS/2021.5
    GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with
    hundreds to millions of particles.

  GSL: GSL/2.7
    The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. The library provides a wide range of
    mathematical routines such as random number generators, special functions and least-squares fitting.

  Julia: Julia/1.10.3
    Julia is a high-level general-purpose dynamic programming language that was originally designed to address the needs of
    high-performance numerical analysis and computational science, without the typical need of separate compilation to be fast, also
    usable for client and server web use, low-level systems programming or as a specification language (wikipedia.org). Julia
    provides ease and expressiveness for high-level numerical computing, in the same way as languages such as R, MATLAB, and Python,
    but also supports general programming. To achieve this, Julia builds upon the lineage of mathematical programming languages, but
    also borrows much from popular dynamic languages, including Lisp, Perl, Python, Lua, and Ruby (julialang.org).

  LAMMPS: LAMMPS/20Sep21
    LAMMPS (Large-scale Atomic/Molecular Massively Parallel Simulator) is a classical molecular dynamics simulation code designed to
    run efficiently on parallel computers.

  Libint-CP2K: Libint-CP2K/2.6.0
    Provides tarballs of CP2K-configured libint releases for different maximum angular momenta. Libint library is used to evaluate
    the traditional (electron repulsion) and certain novel two-body matrix elements (integrals) over Cartesian Gaussian functions
    used in modern atomic and molecular theory.

  Mesa: Mesa/22.3.3
    Mesa is an open-source implementation of the OpenGL specification - a system for rendering interactive 3D graphics.

  Meson: Meson/0.62.0
    Meson is a cross-platform build system designed to be both as fast and as user friendly as possible.

  NAMD: NAMD/2.14
    NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems.

  NCL: NCL/6.6.2
    NCL is an interpreted language designed specifically for scientific analysis and visualisation

  NCO: NCO/5.0.1
    The NCO toolkit manipulates and analyzes data stored in netCDF-accessible formats, including DAP, HDF4, and HDF5.

  Ninja: Ninja/1.10.2
    Ninja is a small build system with a focus on speed.

  OOOPS: OOOPS/1.0
    OOOPS, short for Optimal Overloaded IO Protection System, is an innovative IO workload managing system that optimally throttles
    the IO workload from the users' side. Thank Si Liu for coming up the name of this tool!

  PLUMED: PLUMED/2.7.3
    PLUMED is an open source library for free energy calculations in molecular systems which works together with some of the most
    popular molecular dynamics engines. Free energy calculations can be performed as a function of many order parameters with a
    particular focus on biological problems, using state of the art methods such as metadynamics, umbrella sampling and
    Jarzynski-equation based steered MD. The software, written in C++, can be easily interfaced with both fortran and C/C++ codes.

  PROJ: PROJ/8.1.1
    PROJ is a generic coordinate transformation software that transforms geospatial coordinates from one coordinate reference system
    (CRS) to another.

  ParaView: ParaView/5.12.0-OSMesa
    ParaView is a scientific parallel visualizer.

  PrgEnv-aocc: PrgEnv-aocc/8.5.0

  PrgEnv-cray: PrgEnv-cray/8.5.0

  PrgEnv-gnu: PrgEnv-gnu/8.5.0

  PrgEnv-intel: PrgEnv-intel/8.5.0

  QuantumESPRESSO: QuantumESPRESSO/7.2
    Quantum ESPRESSO is an integrated suite of computer codes for electronic-structure calculations and materials modeling at the
    nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials (both norm-conserving and ultrasoft).

  SIRIUS: SIRIUS/7.3.1
    Domain specific library for electronic structure calculations.

  SPLA: SPLA/1.5.2
    Specialized Parallel Linear Algebra

  SpFFT: SpFFT/1.0.5
    Sparse 3D FFT library with MPI, OpenMP, CUDA and ROCm support

  VASP: VASP/6.3.0
    The Vienna Ab initio Simulation Package (VASP) is a computer program for atomic scale materials modelling, e.g. electronic
    structure calculations and quantum-mechanical molecular dynamics, from first principles.

  Visit: Visit/3.4.1
    VisIt is an Open Source, interactive, scalable, visualization, animation and analysis tool.

  Wannier90: Wannier90/3.1.0
    A tool for obtaining maximally-localised Wannier functions

  adios: adios/2.9.2
    The Adaptable IO System (ADIOS) provides a simple, flexible way for scientists to describe the data in their code that may need
    to be written, read, or processed outside of the running simulation

  aocc: aocc/4.1.0

  aocc-mixed: aocc-mixed/4.1.0

  atp: atp/3.15.2

  blosc2: blosc2/2.9.2
    Blosc is a high performance compressor optimized for binary data.

  cce: cce/17.0.0

  cce-mixed: cce-mixed/17.0.0

  cpe: cpe/23.12

  cpe-cuda: cpe-cuda/23.12

  cpeAMD: cpeAMD/23.12
    Toolchain using Cray compiler wrapper with aocc module (CPE release: 23.12).

  cpeCray: cpeCray/23.12
    Toolchain using Cray compiler wrapper with cce module (CPE release: 23.12).

  cpeGNU: cpeGNU/23.12
    Toolchain using Cray compiler wrapper with gcc module (CPE release: 23.12).

  cpeIntel: cpeIntel/23.12
    Toolchain using Cray compiler wrapper with intel module (CPE release: 23.12).

  cray: cray/23.12

  cray-R: cray-R/4.3.1

  cray-ccdb: cray-ccdb/5.0.2

  cray-cti: cray-cti/2.18.2

  cray-dsmml: cray-dsmml/0.2.2

  cray-dyninst: cray-dyninst/12.3.1

  cray-fftw: cray-fftw/3.3.10.6

  cray-hdf5: cray-hdf5/1.12.2.9

  cray-hdf5-parallel: cray-hdf5-parallel/1.12.2.9

  cray-libsci: cray-libsci/23.12.5

  cray-libsci_acc: cray-libsci_acc/23.12.0

  cray-mpich: cray-mpich/8.1.28

  cray-mpich-abi: cray-mpich-abi/8.1.28

  cray-mpich-abi-pre-intel-5.0: cray-mpich-abi-pre-intel-5.0/8.1.28

  cray-mpich-ucx: cray-mpich-ucx/8.1.28

  cray-mpich-ucx-abi: cray-mpich-ucx-abi/8.1.28

  cray-mpixlate: cray-mpixlate/1.0.3

  cray-mrnet: cray-mrnet/5.1.2

  cray-netcdf: cray-netcdf/4.9.0.9

  cray-netcdf-hdf5parallel: cray-netcdf-hdf5parallel/4.9.0.9

  cray-openshmemx: cray-openshmemx/11.7.0

  cray-parallel-netcdf: cray-parallel-netcdf/1.12.3.9

  cray-pmi: cray-pmi/6.1.13

  cray-python: cray-python/3.11.5

  cray-stat: cray-stat/4.12.2

  cray-ucx: cray-ucx/1.14.0, cray-ucx/2.7.0-1

  craype: craype/2.7.30

  craype-accel-amd-gfx908: craype-accel-amd-gfx908

  craype-accel-amd-gfx90a: craype-accel-amd-gfx90a

  craype-accel-amd-gfx940: craype-accel-amd-gfx940

  craype-accel-host: craype-accel-host

  craype-accel-nvidia70: craype-accel-nvidia70

  craype-accel-nvidia80: craype-accel-nvidia80

  craype-accel-nvidia90: craype-accel-nvidia90

  craype-arm-grace: craype-arm-grace

  craype-hugepages128M: craype-hugepages128M

  craype-hugepages16M: craype-hugepages16M

  craype-hugepages1G: craype-hugepages1G

  craype-hugepages256M: craype-hugepages256M

  craype-hugepages2G: craype-hugepages2G

  craype-hugepages2M: craype-hugepages2M

  craype-hugepages32M: craype-hugepages32M

  craype-hugepages4M: craype-hugepages4M

  craype-hugepages512M: craype-hugepages512M

  craype-hugepages64M: craype-hugepages64M

  craype-hugepages8M: craype-hugepages8M

  craype-network-none: craype-network-none

  craype-network-ofi: craype-network-ofi

  craype-network-ucx: craype-network-ucx

  craype-x86-genoa: craype-x86-genoa

  craype-x86-milan: craype-x86-milan

  craype-x86-milan-x: craype-x86-milan-x

  craype-x86-rome: craype-x86-rome

  craype-x86-spr: craype-x86-spr

  craype-x86-spr-hbm: craype-x86-spr-hbm

  craype-x86-trento: craype-x86-trento

  craypkg-gen: craypkg-gen/1.3.31

  darshan: darshan/3.2.1

  ddt: ddt/22.1.3-linux-x86_64
    Arm DDT is a cross-platform debugger for C, C++, Fortran threaded and parallel codes, compatible with most flavors of Linux on
    Intel x86_64 (Xeon), IBM Power, NVIDIA CUDA, and Armv8-A hardware. #
    -------------------------------------------------------------------------- CSCS Users Documentation: http://user.cscs.ch Youtube
    channel: https://www.youtube.com/playlist?list=PL1tk5lGm7zvR1CPR9KYZZEyRlCYQYY-Xp Non-MPI codes may need to add a dummy
    MPI_Init()/MPI_Finalize() call To avoid conflict, module unload Visit Cube darshan Licensing : http://velan:4241/status.html

  dvs: dvs/2.15_4.7.72-1.0_12.10__g7e33612d

  ecCodes: ecCodes/2.23.0, ecCodes/2.32.1-parallel
    ecCodes is a package developed by ECMWF which provides an application programming interface and a set of tools for decoding and
    encoding messages in different formats

  gcc-native: gcc-native/12.3

  gcc-native-mixed: gcc-native-mixed/12.3

  gdb4hpc: gdb4hpc/4.16.0

  git-lfs: git-lfs/3.4.1
    Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside
    Git, while storing the file contents on a remote server like GitHub.com or GitHub Enterprise.

  graphviz: graphviz/11.0.0
    Graphviz is an open source graph visualization software.

  hub: hub/2.14.2
    hub is a command-line wrapper for git that makes you better at GitHub.

  hwloc: hwloc/2.4.1
    The Portable Hardware Locality (hwloc) software package provides a portable abstraction (across OS, versions, architectures, ...)
    of the hierarchical topology of modern architectures, including NUMA memory nodes, sockets, shared caches, cores and simultaneous
    multithreading. It also gathers various system attributes such as cache and memory information as well as the locality of I/O
    devices such as network interfaces, InfiniBand HCAs or GPUs. It primarily aims at helping applications with gathering information
    about modern computing hardware so as to exploit it accordingly and efficiently.

  intel: intel/2023.2.0

  intel-classic: intel-classic/2023.2.0

  intel-classic-mixed: intel-classic-mixed/2023.2.0

  intel-mixed: intel-mixed/2023.2.0

  intel-oneapi: intel-oneapi/2023.2.0

  intel-oneapi-mixed: intel-oneapi-mixed/2023.2.0

  iobuf: iobuf/2.0.10

  jupyter-utils: jupyter-utils/0.1
    Utilities for working with Jupyter at CSCS

  jupyterlab: jupyterlab/3.6.7, jupyterlab/4.2.3
    An extensible environment for interactive and reproducible computing, based on the Jupyter Notebook and Architecture.

  libaec: libaec/1.0.6
    libaec - Adaptive Entropy Coding library Libaec provides fast lossless compression of 1 up to 32 bit wide signed or unsigned
    integers (samples). The library achieves best results for low entropy data as often encountered in space imaging instrument data
    or numerical model output from weather or climate simulations. While floating point representations are not directly supported,
    they can also be efficiently coded by grouping exponents and mantissa. ***************** SZIP compatibility
    *********************** Libaec includes a free drop-in replacement for the SZIP library
    (http://www.hdfgroup.org/doc_resource/SZIP). Just replace SZIP's shared library libsz.so* with libaec.so* and libsz.so* from
    libaec. Code which is dynamically linked with SZIP such as HDF5 should continue to work with libaec. No re-compilation required.
    HDF5 files which contain SZIP encoded data can be decoded by HDF5 using libaec and vice versa.

  libfabric: libfabric/1.15.2.0

  libvori: libvori/210412
    libvori stands for 'Library for Voronoi Integration': currently libvori is working with the CP2K program package

  libxc: libxc/5.1.7, libxc/5.2.3
    Libxc is a library of exchange-correlation functionals for density-functional theory. The aim is to provide a portable, well
    tested and reliable set of exchange and correlation functionals.

  libxsmm: libxsmm/1.17
    Library targeting Intel Architecture for specialized dense and sparse matrix operations, and deep learning primitives.

  ogg: ogg/1.3.1
    Support library for Theora, a free and open video compression format from the Xiph.org Foundation.

  ospray: ospray/2.12.0
    An Open, Scalable, Parallel, Ray Tracing Based Rendering Engine for High-Fidelity Visualization

  papi: papi/7.0.1.2

  patchelf: patchelf/0.18.0
    PatchELF is a simple utility for modifying existing ELF executables and libraries.

  perftools: perftools

  perftools-base: perftools-base/23.12.0

  perftools-lite: perftools-lite

  perftools-lite-events: perftools-lite-events

  perftools-lite-gpu: perftools-lite-gpu

  perftools-lite-hbm: perftools-lite-hbm

  perftools-lite-loops: perftools-lite-loops

  perftools-preload: perftools-preload

  reframe: reframe/4.5.1, reframe/4.6.0
    A regression framework for writing portable tests for HPC systems.

  reframe-cscs-tests: reframe-cscs-tests/24.03, reframe-cscs-tests/24.05, reframe-cscs-tests/24.07, reframe-cscs-tests/24.08
    ReFrame test suite of CSCS.

  sanitizers4hpc: sanitizers4hpc/1.1.2

  singularity: singularity/3.6.4-eiger
    Singularity is a portable application stack packaging and runtime utility.

  spglib: spglib/1.16.3
    Spglib is a library for finding and handling crystal symmetries written in C.

  sz: sz/2.1.12.2
    Error-bounded Lossy Compressor for HPC Data

  theora: theora/1.2.0alpha1
    Theora, a free and open video compression format from the Xiph.org Foundation.

  valgrind4hpc: valgrind4hpc/2.13.2

  vorbis: vorbis/1.3.3
    Support library for Theora, a free and open video compression format from the Xiph.org Foundation.

  w3m: w3m/0.5.3+git20210102-6
    Debian's w3m: WWW browsable pager

  x264: x264/20191217
    x264 is a free software library and application for encoding video streams into the H.264/MPEG-4 AVC compression format, and is
    released under the terms of the GNU GPL.

  x265: x265/3.2.1
    x265 is a free software library and application for encoding video streams into the H.265/MPEG-H HEVC compression format, and is
    released under the terms of the GNU GPL.

  xpmem: xpmem/2.8.2-1.0_3.9__g84a27a5.shasta

  zfp: zfp/0.5.5
    Optionally error-bounded lossy compressor for HPC data with high throughput read and write random access to individual array
    elements

--------------------------------------------------------------------------------------------------------------------------------------

To learn more about a package execute:

   $ module spider Foo

where "Foo" is the name of a module.

To find detailed information about a particular package you
must specify the version if there is more than one version:

   $ module spider Foo/11.1

--------------------------------------------------------------------------------------------------------------------------------------
```
</details>

## Exercise 3
I didn't quite understand what you meant by "use `hostname` as the program" but I added the following line:
```bash
#SBATCH --account="uzh8"
```
and I checked if the job was running with the following result:
```bash
[eiger][mfaehnri@eiger-ln001 exercise_session_02]$ sbatch $SCRATCH/hostname.sh
Submitted batch job 3370985
[eiger][mfaehnri@eiger-ln001 exercise_session_02]$ squeue -u mfaehnri
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           3370977     debug   my_job mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
           3370984     debug   my_job mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
           3370985     debug   my_job mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
```
For redirection to the log and error file I inserted the following two lines into the .sh file:
```bash
#SBATCH --output="mpi_output.log"
#SBATCH --error="mpi_error.log"
```
I encountered some problems, or rather the people at cscs had to fix some problems becuase it seems the nodes were all reserved for maintenance (maybe I also got something wrong).
```bash
[eiger][mfaehnri@eiger-ln001 mfaehnri]$ sbatch mpi_cpi_job.sh
Submitted batch job 3370987
[eiger][mfaehnri@eiger-ln001 mfaehnri]$ sbatch omp_cpi_job.sh
Submitted batch job 3370988
[eiger][mfaehnri@eiger-ln001 mfaehnri]$ squeue -u mfaehnri
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           3370977     debug   my_job mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
           3370984     debug   my_job mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
           3370985     debug   my_job mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
           3370987     debug mpi_cpi_ mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
           3370988     debug omp_cpi_ mfaehnri PD       0:00      1 (ReqNodeNotAvail, Reserved for maintenance)
```

To run the following:
`JOBID USER PRIORITY ACCOUNT NAME NODES ST REASON START_TIME TIME_LEFT PRIORITY`
I would have to run:
```bash
squeue --format="%.18i %.10u %.8P %.10a %.15j %.6D %.2t %.15R %.20S %.10L %.10Q"
```
```
With: 
%.18i: Job ID
%.10u: User
%.8P: Priority
%.10a: Account
%.15j: Job name
%.6D: Number of nodes
%.2t: State
%.15R: Reason
%.20S: Start time
%.10L: Time left
%.10Q: Priority
```

## Exercise 4
At this point it was a little hard to make any observations since I can't run the jobs due to the ongoing maintenance..
But this is what I would have done:
run with 1 thread:
```bash
export OMP_NUM_THREADS=1
```
run with 10 threads:
```bash
export OMP_NUM_THREADS=10
```

I can only guess what the differences would be by expecting results from the theory.. Probably the observations would be that
- Increasing threads to 10 would result in faster execution
- Changing optimization flag would probably cause slower execution

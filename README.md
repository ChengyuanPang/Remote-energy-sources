# Remote-energy-sources-for-mixing-in-the-Indonesian-Seas

The raw data are saved in Matlab data format. Plsese download all files into a folder and run the script.m under MATLAB. The code and data to reproduce key results are shown below. Full model outputs are available upon request to the corresponding author.
## Contents
<!-- toc -->
- [Raw Data](#raw-data)
- [Code](#code)
<!-- tocstop -->
## Raw Data

### `T.mat`:
 
`T.mat` is the raw data to plot Fig. 1 in this paper. Within the data file, variables named as `XC`, `YC`, `T` and `D` represent longitude, latitude, surface temperature and ocean depth, respectively. 

### `radiative_flux.mat` & `advective_flux.mat`:

`radiative_flux.mat` and `advective_flux.mat` provide the raw data to reproduce Fig. 2a and Fig. 2b. Variable `IFU`, `IFV` and `IFT` in `radiative_flux.mat` represent zonal, meridional and total radiative flux in this region. In `advective_flux.mat`, `DHX`, `DSY` and `AF` represent zonal, meridional and total advective flux in this region. 

### `radiative_divergence.mat`: 

Using this data file can reproduce the Fig. 3 in the paper. `radiative_divergence.mat` provides the divergence of radiative energy flux named as `DEF`. 

### `depth.mat`:

The file provide the vertical profile data of eddy energy flux in the main straits. `Draw_Lx`,`Draw_Fx`,`Draw_Ox` and `Draw_Tx` represent the energy profile in Lombok Strait, Sape Strait, Ombai Strait and Timor Passage. `Draw_Sx`,`Draw_Mx`,`Draw_Bx` and `Draw_Hx` represent the energy profile in Sulawesi Sea, Makassar Strait, Maluku Sea and Halmahera Sea. Variable `Draw_y` represents the ocean depth.

### `orange_blue_map.mat`, `blue_red_sturated.mat` & `Red.mat`:

The three data files are colormaps used to produce the figures in this paper. All relevant variables are included in the files. 


## Code

### `scripts.m`：

`scripts.m` includes 5 parts which, in turn, provide the code to produce the 5 figures in the paper.

### `blockmean.m` & `runmean.m`：

`blockmean.m` and  `runmean.m` are functions used in the `scripts.m`.



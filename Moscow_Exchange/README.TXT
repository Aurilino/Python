Moscow Exchange indices analysis

==============================================================================

REQUIREMENTS
------------

Python 3.7 and hidher
Jupyter notebook


Packeges:
os - for working directory
pandas - for data analisis
numpy - for work with numbers
matplotlib.pyplot - for plots
pandas_datareader - for ead data from internet
random - for random number
scipy.optimize - for opimize portfolios
scipy.interpolate - for the construction of the efficient frontier

DESCRIPTION
------------

In this notebook, I built an effective portfolio boundary and CML line 
based on the shares included in the MOEXBC, MICEX and MOEXBMI indices presented on the Moscow Exchange.

Because of the large number of assets, too many combinations are required to create all possible portfolios. 
To facilitate the process, I wrote a portfolio generator. It selects random numbers from the normal 
distribution with the average value of the corresponding weight in the Moscow Exchange index

Any comments and suggestions are welcome auriliano@live.com.

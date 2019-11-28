# author   : Johann-Mattis List
# email    : mattis.list@uni-marburg.de
# created  : 2013-11-15 08:51
# modified : 2013-11-17 22:12
"""
Basic script to apply the MLN approach to language data.
"""

__author__="Johann-Mattis List"
__date__="2013-11-17"


# make sure lingpy2.2 runs on the system
try:
    from lingpy import *
    from lingpy.compare.phylogeny import PhyBo
    from lingpy.convert.plot import plot_heatmap
    from lingpy.settings import rcParams
    import matplotlib as mpl
except:
    print("[i] You need LingPy and MatPlotLib to run this script.")

from sys import argv

try:
    arg1 = argv[1]
    if arg1.endswith('.tre'):
        arg1 = arg1[:-4]
except:
    print("Usage ChineseDialectHistory.py TREE_FILE")
    print("- you need LingPy (2.2) to calculate the MLN and the MSN")
    print("- you need matplotlib, networkx to plot MLN and MSN")
    print("- you need XeTex and zhspacing to plot the data properly")


# set up the latex preamble
rcParams['latex_preamble'] = [
                    r"\usepackage{zhspacing}",
                    r"\zhspacing",
                    r"\usepackage{xcolor}"
                    ]

# load the object
phy = PhyBo('romance_lexstat.qlc', degree=180, change=lambda x:3*x**1.2, tree=arg1+'.tre')

# analyze
phy.analyze(
        plot_dists=True,
        homoplasy=0.05,
        gpl = 0
        )

# calculate patchily distributed cognates
phy.get_PDC(phy.best_model)

# calculate MLN
try:
    phy.get_MLN(phy.best_model)
    print("[i] Calculated the MLN.")
except:
    print("[!] Failed to calculate the MLN.")
try:
    phy.plot_MLN(
            phy.best_model,
            figsize='optimal',
            ylimt=0.5,
            textsize=10,
            usetex=True,
            left=0.1,
            top=0.9,
            nodestyle='vsd',
            vsd_scale=0.075,
            colormap = mpl.cm.binary,
            vedgecolor='black',
            vedgelinewidth=2.0,
            vedgeinnerline=0.75,
            threshold=3,
            alphat = True,
            filename=arg1+'_mln',
            fileformat='png',
            cbar_shrink = 0.6,
            _prefix = r"-- \ ",
            _suffix = r"\  --",
            labels = phy.conf['taxon_short_labels']
            )
except:
    print("[!] Failed to plot the MLN.")

try:
    phy.get_MSN(phy.best_model)
except:
    print("[!] Failed to calculate the MSN.")
try:
    phy.plot_MSN(
            phy.best_model,
            colormap = mpl.cm.binary,
            figsize=(11.5,7),
            xlimr=0,
            filename=arg1+'_msn',
            fileformat='png',
            usetex=True,
            cbar_shrink = 0.75,
            markersize=15
            )
except:
    print("[!] Failed to plot the MSN.")

phy.output('qlc', filename=arg1+'_patchy', ignore=['json'])
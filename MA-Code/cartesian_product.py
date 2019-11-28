import csv
from lingpy import *
import itertools
import os
import pickle as pk
from lingpy.settings import rcParams
from itertools import groupby
#from asjp import ipa2asjp, asjp2ipa, tokenise
import fileinput
import itertools
import pandas as pd
import numpy as np
from scipy.spatial.distance import pdist
from itertools import product

#creates list of list where one column is one list
dataset = []
with open('cartesian.csv') as csvfile:
    rows = csv.reader(csvfile)
    data = list(zip(*rows))
    dataset = [list(a) for a in data]
dataset

seqA = []
seqB = []
final_scores = []
for i in range(len(dataset)):
    for j in range(len(dataset)):
        for a, b in itertools.product(dataset[i],dataset[j],repeat=1):
            #print(dataset[j])
            seqA.append(a)
            seqB.append(b)

final_scores = []
for i in range(len(seqA)):
    sim = edit_dist(seqA[i][4:],seqB[i][4:])
    final_scores.append(sim)
        #print(i, seqA[i], seqB[i],final_scores[i])

    print(i,seqA[i],seqB[i],final_scores[i]) 

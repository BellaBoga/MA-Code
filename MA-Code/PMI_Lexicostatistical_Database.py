import csv
from lingpy import *
import itertools
import os
import pickle as pk
from lingpy.settings import rcParams
from itertools import groupby
from asjp import ipa2asjp, asjp2ipa, tokenise
import fileinput
import pickle
import re 
import numpy as np
import pandas as pd

#with open('romance_transcribed_new.csv', 'r') as csvfile:
    data_set1 = pd.read_csv('romance_transcribed_new.csv', 'r',delimiter=',',na_filter=True)
    #data_set = list(csv.reader(csvfile, delimiter=',', quotechar='|'))
    #data = data_set(np.nan)
    
data_set = data_set1.values.T.tolist()
seqA_tmp = []
seqB_tmp = []
for i in range(len(data_set)):
    for a,b in itertools.combinations(data_set[i], 2):
        seqA_tmp.append(a)
        seqB_tmp.append(b)
print('compare', a, 'and', b)

scorer = {}
listoflist = []
with open("pmiScores.csv", "r") as infile:
    for line in infile:
        listoflist.append(line.rstrip("\n").split(','))
        

for i in range(1,len(listoflist)):
    for j in range(1, len(listoflist[0])):
        scorer[(listoflist[0][i], listoflist[j][0])] = float(listoflist[i][j])
        #Scorer is done
        
final_scores = []
for i in range(len(seqA)):
    if seqA[i] == "" or seqB[i] == "":
        #final_scores.append(float('nan'))
        seqA[i].append('nan') 
        seqB[i].apennd('nan')
    else:
        almA, almB, sim = nw_align(seqA[i][4:], seqB[i][4:], scorer=scorer)
        final_scores.append(sim)
        print(i, seqA[i], seqB[i],final_scores[i],file=open("output_test_romance_new.csv", "a"))
        if seqA[i] == "ʼ" or seqB[i] =="ʼ":
            final_scores.append(float('nan')) 
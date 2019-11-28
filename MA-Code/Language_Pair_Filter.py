import pandas as pd
import csv
import re
import time


df = pd.read_csv('/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/final_lev_off_diag_iranian.csv',header=0)




langs2 = ["qbb", "lat", "ruq","ruo","rup","ron","dlm","fur","ll1","ll2","ro1","ro2","ro3","ro4","pm1","pm2", "pm3",
    "pm4","pm5","lm1","lm2","eg1","eg2","eg3",'eg4','li1','li2','li3','ve1','ve2','ve3','ito',
    'ita','itg','itf','nea','src','sro','sc1','sc2','sc3','sc4','ca1','ca2','ca3','ca4','ca5',
    'ca6','spa','ast','por','glg','pr1','pr2','fro','fra','pcd','win']


langs1 = ["qbb", "lat", "ruq","ruo","rup","ron","dlm","fur","ll1","ll2","ro1","ro2","ro3","ro4","pm1","pm2", "pm3",
    "pm4","pm5","lm1","lm2","eg1","eg2","eg3",'eg4','li1','li2','li3','ve1','ve2','ve3','ito',
    'ita','itg','itf','nea','src','sro','sc1','sc2','sc3','sc4','ca1','ca2','ca3','ca4','ca5',
    'ca6','spa','ast','por','glg','pr1','pr2','fro','fra','pcd','win']

#Iranian Iso codes
langs3 = ["av1", "av2", "pb1","pb2" ,"bql","bgp","bgn","ps1", "pb3", "pb4", "wb1", "pt1" ,"wb2" ,"pb5" ,"pb6" , "os1",
"pb7", "prs", "gzi", "glk", "hac", "pb8", "os2", "wb3", "pb9" ,"p10", "jdt", "pt2", "ps2", "kiu" ,"zum" ,"ckb", "kmr", "ps3", "lrl" 
,"lsa", "luz", "p11", "p12", "p13", "kfm", "p14", "ps4", "p15", "mnj" ,"ntz", 
"p16", "p17", "p18", "oru", "prc", "p19", "pt3" ,"pes", "p20" ,
"pt4", "pt5", "srz" , "p21", "sgh", "siy", "sqo", "bcc" ,"sdh" ,"fay" ,"p22", "tgk" ,"tly" ,"p23" ,"p24",
"vaf", "ps5" ,"wne" ,"yai" ,"wb5", "yah" ,"ydg", "p25", "diq"]

#Iranian Iso codes
langs4 = ["av1", "av2", "pb1","pb2" ,"bql","bgp","bgn","ps1", "pb3", "pb4", "wb1", "pt1" ,"wb2" ,"pb5" ,"pb6" , "os1",
"pb7", "prs", "gzi", "glk", "hac", "pb8", "os2", "wb3", "pb9" ,"p10", "jdt", "pt2", "ps2", "kiu" ,"zum" ,"ckb", "kmr", "ps3", "lrl" 
,"lsa", "luz", "p11", "p12", "p13", "kfm", "p14", "ps4", "p15", "mnj" ,"ntz", 
"p16", "p17", "p18", "oru", "prc", "p19", "pt3" ,"pes", "p20" ,
"pt4", "pt5", "srz" , "p21", "sgh", "siy", "sqo", "bcc" ,"sdh" ,"fay" ,"p22", "tgk" ,"tly" ,"p23" ,"p24",
"vaf", "ps5" ,"wne" ,"yai" ,"wb5", "yah" ,"ydg", "p25", "diq"]

#Germanic Iso codes
langs5 = ["afr","als","bar","gsw","nl2","cim","dan","nld","frs","eng","fao","vls","fry","nor","got","gos","geh",
"isl","jmt","lim","sli","ltz","frr","nds","nob","non","nor","ang","ofs","goh","olf","noo","osx","pdt",
"ksh","sdz","nos","sxu","sco","sco","deu","stl","swg","swe","twd","vls","wym","ydd","yih","zea"]

langs6 = ["afr","als","bar","gsw","nl2","cim","dan","nld","frs","eng","fao","vls","fry","nor","got","gos","geh",
"isl","jmt","lim","sli","ltz","frr","nds","nob","non","nor","ang","ofs","goh","olf","noo","osx","pdt",
"ksh","sdz","nos","sxu","sco","sco","deu","stl","swg","swe","twd","vls","wym","ydd","yih","zea"]

start = time.time()
for i in range(len(langs3)):
    for j in range(len(langs4)):
            new_dataframe=df[df["L1"].str.match(langs3[i]) & df["L2"].str.match(langs4[j])|df["L2"].str.match(langs3[i]) & df["L1"].str.match(langs4[j])]
            mean_value = new_dataframe[["New_Score"]].mean()
            #new_dataframe.to_csv("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/Filtered_Data_Romance/Mean_Values_Off_Diagonal/Test/"+langs1[i]+"_"+langs1[j]+".csv")n",
            mean_value.to_csv("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/Iranian/Mean_Values_Off_Diag_Lev/"+langs3[i]+"_"+langs4[j]+".csv")
            print(langs3[i],langs4[j])
end = time.time()
print(end - start)









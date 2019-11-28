import csv
import sys

# empty_list =[]
#
#
#
# csvfiles = csv.reader(open('/home/bella/Dropbox/etymfiles/ku-etym.tsv'), dialect=csv.excel)
# tsvfiles = csv.writer(open('/home/bella/Dropbox/etymfiles/ku-etym.tsv', 'wb'), dialect=csv.excel_tab)
#
#
# #fileContent = csv.reader(open('/home/bella/Dropbox/etymfiles/hy-etym.csv'), dialect=csv.excel)
# #fileContent = re.sub(", ","\t ", fileContent)
# #tsv_file.write(fileContent)
# #tsv_file.close()
# #tsv_file = open("/home/bella/Dropbox/etymfiles/hy-etym.tsv", "w")
#
# with open('/home/bella/Dropbox/etymfiles/ku-etym.tsv', newline='') as csvfile:
#   csv_reader = csv.reader(csvfile, quotechar='|',dialect=csv.excel)
#   for row in csv_reader:
#        print(', '.join(row))
#
# with open('/home/bella/Dropbox/etymfiles/hy-etym.csv', 'w', newline='') as csvfile:
#     tsvwriter = csv.writer(csvfile, dialect=csv.excel_tab)

a ='/home/bella/Dropbox/etymfiles/ku-etym.tsv'

csv.writer('/home/bella/Dropbox/etymfiles/ku-etym.tsv'('ku.tsv', 'w+'), delimiter='\t').writerows(csv.reader(open('/home/bella/Dropbox/etymfiles/ku-etym.tsv')))
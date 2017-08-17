import csv

WHPresent = [0,1,1]
RustPresent = [0,1,1]
imageID = ['ABKHKH', 'uweirweriu', 'jskfh']

ofile  = open('InceptionResults.csv', "w")
goCsv = csv.writer(ofile, delimiter=',', lineterminator='\n')
for x in range(0, len(WHPresent)):
    goCsv.writerow([imageID[x], WHPresent[x], RustPresent[x]])
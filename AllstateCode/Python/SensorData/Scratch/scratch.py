import pandas as pd

folderPath = "C:\\Users\\abouv\\Desktop\\Sensor Data\\Leaks\\"
myData = pd.read_csv("C:\\Users\\abouv\\Desktop\\Sensor Data\\combined.csv", header=None, dtype=str)
houseNames = myData.loc[:, 0].unique()
myData = myData[myData.loc[:,5] == "leak"]
#numberOfLeaks = myData.loc[:,0].groupby(['Leak']).value_count()
#typeNames = myData.loc[:,5].unique()
k = 0
for house in houseNames:
    k = k+1
    myDataF = myData[myData.loc[:, 0] == house]
    sensorNames = myDataF.loc[:, 1].unique()
    for sensor in sensorNames:
        myDataFF = myDataF[myDataF.loc[:, 1] == sensor]
        saveString = folderPath + "Home" + k.__str__() + "_" + sensor + ".csv"
        myDataFF.to_csv(saveString, header=0, index=0)






# myDataFiltered = myData[myData.loc[:, 3] == "0x70b3d53daf000de4"]
# myDataFiltered.loc[:, 9] = SensorData().convertToEpoch(myDataFiltered.loc[:,9])
#
# myDataFiltered.sort_index(9)









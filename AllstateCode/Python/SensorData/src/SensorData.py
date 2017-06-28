import time
from dateutil import parser
from calendar import timegm
import pandas as pd

class SensorData:
    fileName = ""

    def convertToEpoch(self, inputTime):
        for ct in inputTime:
            ct_formatted = parser.parse(ct)
            timegm(ct_formatted.timetuple())

    def convertToDays(self, inputEpoch):
        return(inputEpoch - inputEpoch(1)) / (3600 * 24)



timeTestData = {"2017-02-07 17:01:06 EST", "2017-02-07 17:01:06 EST", "2017-02-07 17:01:06 EST" ,"2017-02-07 17:01:06 EST"}

testEpoch = SensorData().convertToEpoch(timeTestData)

testEpoch(2)
#hopeEpoch = SensorData().convertToEpoch("2017-02-07 17:01:06 EST")

#hopeDays = SensorData().convertToDays(hopeEpoch)

#hopeEpoch = SensorData().convertToEpoch("2017-02-07 17:01:06")

#parser.parse("2017-02-07 17:01:06 EST")
# myData = pd.read_csv("C:\\Users\\abouv\\Desktop\\Sensor Data\\DW_D_data.csv", header=None, dtype=str)
# myDataFiltered = myData[myData.loc[:, 3] == "0x70b3d53daf000de4"]
# myDataFiltered.loc[:, 9] = SensorData().convertToEpoch(myDataFiltered.loc[:, 9].data())
#
# myDataFiltered.loc[0, 9]
#
# myDataFiltered.sort_index(9)

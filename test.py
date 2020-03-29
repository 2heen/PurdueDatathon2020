from pyhdf.SD import SD, SDC

file_name = 'MOD11A1.A2018329.h08v05.006.2018330085457.hdf'
file = SD(file_name, SDC.READ)

print(file.info())
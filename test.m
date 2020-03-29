file_name = 'MOD11A1.A2018329.h08v05.006.2018330085457.hdf';
sds_name = 'Optical_Depth_Land_And_Ocean' ;
 
% Open a buffer for hdf file
sd_id = hdfsdeos.sd( 'start', file_name, 'rdonly') 
 
% Get the number of datasets and global attributes
[num_datasets, num_global_attr, status] = hdfsd('fileinfo',sd_id) 
 
% Get the sds identifier from the dataset named sds_name
sds_index  = hdfsdeos('nametoindex', sd_id, sds_name) 
sds_id = hdfsdeos('select', sd_id, sds_index)
 
% Get the name, number of dimensions, size of each dimension, data type and number of 
%attributes of a dataset
[sds_name, sds_num_dim, sds_dim, sds_data_type, sds_num_attr] = hdfsdeos('getinfo', sds_id) 
 
% Read the dataset identified by sds_id
sds_start_vector = zeros(1,  sds_num_dim) %the position to begin reading
sds_stride = [] %the interval between value to read
sds_end_vector = sds_dim %the end of dimension to read
[sds_data, status] = hdfsdeos('readdata', sds_id, sds_start, sds_stride,  sds_edges) ;
 
% Read the dataset named sds_name
data = hdfread (file_name, sds_name) ;
 
i = 200 ; %row index
j = 125 ; %col index
disp([data(i, j)]) ;
% Or, 
disp([sds_data(j, i)]) ;
 
% Close access to the dataset
status = hdfsdeos('endaccess',sds_id);
 
% Close access to the hdf file
status = hdfsdeos('end',sd_id);
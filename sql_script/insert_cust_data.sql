copy into "customer_table"(id, first_name, last_name)
from 's3://salesdata3/Customer_data_cleaned.csv'
file_format = (
  type = 'CSV'
  field_delimiter = ','
  skip_header = 1
  );

copy into customer
from @snow_stage
files = ( 'Customer_data_cleaned.csv')
file_format = ( format_name='CSV_FILE_FORMAT' )
ON_ERROR = 'skip_file';
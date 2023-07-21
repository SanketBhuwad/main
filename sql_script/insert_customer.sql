copy into customer
from @snow_stage
files = ( 'Customer_data_cleaned.csv')
file_format = ( format_name='CSV_FILE_FORMAT' )
ON_ERROR = 'skip_file';
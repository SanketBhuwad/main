copy into orders
from @snow_stage
files = ( 'Orders_Data_cleaned.csv')
file_format = ( format_name='CSV_FILE_FORMAT' )
ON_ERROR = 'skip_file';
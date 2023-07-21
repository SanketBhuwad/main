copy into product
from @snow_stage
files = ( 'Product_Data_Cleaned.csv')
file_format = ( format_name='PRODUCT_FILE_FORMAT' )
ON_ERROR = 'skip_file';
# sql-challenge - Employee Database: A Mystery in Two Parts

## Overview

Through data engineering, design tables to hold employee data that is found in six CSV files, create a SQL database in PostgreSQL to house those tables, and then import the data for data analysis.

As a bonus, then try to determine if the data is fake using a histogram and bar chart.

### Files

There are two folders in the main sql-challenge folder that hold files used in this challenge:

#### data folder

* [data](data/) - this folder contains the 6 CSV files of employee data used as the date source files 
    * [Departments](data/departments.csv) - the various departments of which an employee could be a member
    * [Department Employee](data/dept_emp.csv) - combines departments with employee numbers
    * [Department Managers](data/dept_manager.csv) - combines departments and their managers
    * [Employees](data/employees.csv) - the employees' data
    * [Salaries](data/salaries.csv) - salary data for the employees
    * [Titles](data/titles.csv) - the various titles an employee can have


#### EmployeeSQL Folder

All the files for this analysis can be found in the **WeatherPy** folder. The dataset result files are in the **output_data** subfolder and the scatter plot images are in the **images** folder.

* **Jupyter Notebook** (WeatherPy/WeatherPy.jpynb) - The Jupyter Notebook file that contains the scripts and results
* [City Data](WeatherPy/output_data/City_Data.csv) - this output file contains the approximately 500 cities that were used in the first part of this challenge 
* [Scatter Plot Images](WeatherPy/images/) - this folder contains the various scatter plots generated in the first part of this challenge

#### VacationPy

The files for this analysis can be found in the **VacationPy** folder (except for the City Data source file which is in the WeatherPy folder's output_data subfolder). 

* **Jupyter Notebook** (VacationPy/VacationPy.jpynb) - The Jupyter Notebook file that contains the scripts and results
* [City Data](WeatherPy/output_data/City_Data.csv) - this data source file contains the approximately 500 cities that were used in the first part of this challeng and is the output file from that 

## Notes

API keys are needed for the OpenWeatherMap and Google Places APIs. Both keys need to be in a file called **api_keys.py** and located in the **WeatherPy** and the ***VacationPy** folders. Keys should use the following variable names:
* OpenWeatherMap API: api_key
* Google Places API: g_key

I didn't have any cities with humidities greater than 100% but I coded that section in just in case that should happen with a future pull.

I created the function for plotting linear regressions but didn't actually use it. I created it after I had already completed everything else. Since my analysis was based on the data I had originally pulled, I didn't want to re-run everything to use the function and end up with different cities.

The heatmap and the heatmap with the marker layer for hotels show repeating world maps when they first run. You have to zoom in to see just one world map. The heatmap with the markers layer also doesn't fill the whole cell so scrolling is involved. I have not yet figured out why this is occurring and how to fix it. 

I ended up having cities that didn't pull a hotel name so I removed those rows from the dataframe before adding the marker layer.
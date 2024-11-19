# Challenge-1-late
## This repository includes my script for challenge 1 along with a markdown. Due to the circumstances surrounding challenge 1, this is based off challenge 1 that is located on the Coding Club website since at the time of completeing this I did not have access to the github page. I also only did part 1 and 2 of challenge 1 since I believed that the class had most likely not gotten to what was being done in parts 3 and 4.

### Challenge 1 of Coding Club's <a href="https://ourcodingclub.github.io/course/" target="_blank"> *Data Science for Ecologists and Environmental Scientists* </a> course

This repository contains the datasets you will need to complete <a href="https://ourcodingclub.github.io/course/stats-scratch-challenge/index.html?" target="_blank">Challenge 1</a>. This challenge is associated with the <a href="https://ourcodingclub.github.io/course/stats-scratch/index.html" target="_blank">Stats from Scratch</a> stream of the course. You can download this zipped folder to your computer (green button in top right corner), or fork this repository if you have a GitHub account. 

The <a href="https://ourcodingclub.github.io/course/stats-scratch-challenge/index.html?" target="_blank">challenge page</a> contains all the information and instructions to get you started and guide you through the challenge.

#### The datasets for the challenges are:
+ __The Scottish Squirrel Database.__ Scottish Wildlife Trust (2018). You will find this in the data folder under the name *squirrels.csv*. Occurrence dataset https://doi.org/10.15468/fqg0h3 under license CC-BY-4.0. The version stored in this repository was accessed through the <a href="https://nbnatlas.org/" target="_blank">NBN Atlas website</a> on May 9th 2019. 

+ __Forest cover in OS grid (10 km).__ You will find this in the data folder under the name *forestcoverOS.csv*. Dataset created by the Coding Club on May 21st 2019 from:
  + *_National Forest Inventory Woodland Scotland 2017._* Forestry Commission (2018). Available on Forestry Commission <a href="http://data-forestry.opendata.arcgis.com/datasets/3cb1abc185a247a48b9d53e4c4a8be87_0/" target="_blank">Open Data portal</a> under Open Governement licence: Crown copyright and database right 2018 Ordnance Survey [100021242]
  + *_OSGB Grids in shapefile format._* Charles Roper (2015). Available on <a href="https://github.com/charlesroper/OSGB_Grids" target="_blank">GitHub</a> under a CC-0 (public domain) license.
  

### Good luck with the challenge!

### Data overview
You will use the following datasets, available from the Challenge Github repository on Github. To be able to answer the quiz questions properly, it is important that you use these datasets and not potentially updated versions available through the original providers.
The Scottish Squirrel Database
squirrels.csv: A dataset of grey and red squirrel observations compiled by the Scottish Wildlife Trust and hosted on the NBN Atlas. The most relevant variables in the dataset for this challenge are:

Year: the year of the sighting
Count: the number of squirrels sighted on the occasion (if blank, assume it is 1)
OSGR: the Ordnance Survey grid reference for 10 x 10 km squares; will be useful to link the forest cover data
Forest cover
forestcoverOS.csv: This dataset contains the forest cover (in % and total area) in each OS grid cell. This dataset was created by us*, using:

The National Forest Inventory for Scotland 2017, from the Forestry Commission
OS grid cells at a 10 x 10 km resolution, from this Git repository
Fancy a more advanced challenge? Why don’t you try re-creating this dataset yourself? (Best suited to someone with notions of spatial analysis: all you have to do is intersect the files and extract the area.)

### Specific tasks
Here is a detailed list of the tasks you should achieve within this challenge. Remember that a challenge is meant to be, well, challenging, and therefore we are setting you goals but the choice of workflow and functions to achieve them is up to you! We also list the questions that will be asked in the quiz at the end to confirm your successful completion - we suggest you take note of your answers as you go.

### 1. Data manipulation
Clean the squirrel dataset for the last decade, so it’s ready to analyse. Specifically, you should:
Keep only observations for the years 2008 to 2017 (using the Start.date.year column and renaming it to year)
Remove the observations that are not at the species level (i.e. we don’t know whether they are grey or red squirrels)
Create a species column that will have Red and Grey as factor levels
We will assume that the observations that have NA as count are observations of one squirrel; replace them with the value 1.

Be prepared to answer the question: To the nearest thousand, how large is your cleaned dataset?

### 2. Temporal trends
Determine if there is a temporal trend in the number of observations for red and grey squirrels (2008-2017). Specifically, you should:
Summarise the number of observations per species and per year. (That means a total number of red vs grey squirrels for each year.) A more complex analysis would also account for spatial autocorrelation and other factors, but as a preliminary analysis you are only asked to consider the total numbers at the national scale.
Plot the data and run one linear model to test the question Have squirrel populations increased or decreased over time, and is the trend the same for red and grey squirrels?

Be prepared to answer the questions:
1. Which species showed the strongest change over time?
2. What were your predictor variable(s) and their data type in the model?
3. What is the adjusted R-squared of the regression?
4. Considering the nature of our response variable, what modelling approach would be the most appropriate? (Don’t worry if you only ran a linear regression! It’s a justifiable approach for a preliminary analysis, and for such large numbers the results will be similar.)

Think about the following: what could be the reasons for this trend? Is it ecologically meaningful? Are there any biases in the data to be aware of?

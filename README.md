# COVID-19 ETL PROJECT

<p><h1><img src="images/pug_running__400px.gif" width=200 align="middle"/><strong>  The Pretentious Pugs Group</strong><br><h3><emp> MEMBERS:  Ellis Mok  |  Katherine Matovic  |  Ricky Kong  |  Silva MK </emp></h3></h1></p>
<hr>

<img src="images/covid_banner.jpg"/>

## SUBJECT OF DATA EXPLORATION
## COVID-19 vaccinations, test cases, hospitalizations, mortality and unemployment  in California Counties
<hr>

## MAIN OBJECTIVES
<ul>
    <li> To collect COVID-19 data from two different sources that are maintained periodically, preferably managed by government or API sources that collect government data </li>
    <li>To perform cleaning, merging, filtering, normalization and aggregations of all the data being used</li>
    <li>To upload the files in a database in preparation for more thorough analysis</li>
    <li>To formulate ideas on what types of questions or analyses can be drawn from the datasets</li>
</ul>
<hr>

## DATA SOURCES
<ul>
<li>California Health and Human Services Open Data Portal - For COVID-19 data </li>
    <ul>
    <li>website: <a href="https://data.chhs.ca.gov/" >https://data.chhs.ca.gov/</a></li>
    <li>covid19vaccinesbycounty.csv</li>
    <li>covid19hospitalbycounty.csv</li>
    <li>covid19cases_test.csv</li>
    </ul>
<li>Socrata Open Data API (SODA) -  For Employment/Unemployment data </li>
    <ul>
    <li>website: <a href="https://data.edd.ca.gov/Labor-Force-and-Unemployment-Rates/Local-Area-Unemployment-Statistics-LAUS-/e6gw-gvii" >https://data.edd.ca.gov/Labor-Force-and-Unemployment-Rates/Local-Area-Unemployment-Statistics-LAUS-/e6gw-gvii</a></li>
    <li> employment_dataset.csv
    </ul>
</ul> 
<hr>

## DATA DESCRIPTIONS
<ol> 
<li> COVID-19 Vaccine Data - covid19vaccinesbycounty.csv</li>
    <ul>
    <li>There were <strong>5,212 total records</strong> collected from <strong>December 15, 2020 through March 16, 2021</strong>. The total number of doses administered per county in CA has been recorded daily.
</li>
    </ul>
<li> COVID-19 Hospitalization Data - covid19hospitalbycounty.csv</li>
    <ul>
    <li>There were <strong>19,709 total records</strong> collected from <strong>March 29, 2020 through March 15, 2021</strong>. The following data were collected for each county on a daily basis:
        <ul>
        <li>the number of hospitalized confirmed & suspected COVID-19 patients</li>
        <li>the number of ICU confirmed & suspected COVID-19 patients</li>
        <li>the number of ICU available beds</li>
        <li>the number of hospitalized COVID-19 patients  (missing data from March 29, 2020 through April 20, 2020)</li>
        <li>the number of all hospital beds per county (missing data from March 29, 2020 through April 20, 2020)</li>
        </ul>
</li>
    </ul>
<li>COVID-19 Test Cases Data - covid19cases_test.csv</li>
    <ul>
        <li>There were <strong>26,962 total records</strong> collected from <strong>January 1, 2020 through  March 16, 2021</strong>. The number of test cases are recorded for each county on a daily basis with the most recent dates added at the top of the table. The following data were collected for each county per day:
        </li>
        <ul>
            <li>area or county name </li>
            <li>area type</li>
            <li>the number of population by county</li>
            <li>total number of new & cumulative </li>
                <ul>
                <li>laboratory-confirmed COVID-19 cases</li>
                <li>confirmed COVID-19-related deaths</li>
                <li>PCR tests performed by laboratories</li>
                <li>PCR tests with positive results</li>
                <li>reported cases to the CA Department of Public Health</li>
                <li>reported deaths to the CA Department of Public Health</li>
                <li>reported PCR tests</li>
                </ul>
        </ul>        
    <li>There were some negative numbers in the column “reported_deaths”. Based on the CHHS Open Data Portal field documentation, these were corrections from the previous day’s report (i.e. if the cause of death was determined to be non-COVID related)</li>
    </ul>
    
<li>Employment/Unemployment Data - employment_dataset.csv</li>
    <ul>
    <li>There were <strong>26,000 data</strong> extracted from Socrata API from <strong>April 2004 through January 2021</strong>.</li>
    </ul>
</ol>
<hr>

## ASSUMPTIONS & LIMITATIONS
<ul>
<li></li>
<li></li>
</ul>

<hr>

## LIBRARIES
<ul>
    <li>Pandas</li>
    <li>API Requests</li>
    <li></li>
</ul>
<hr>

## ETL Methodologies

## A. DATA EXTRACTION
<ol>
    <li>Downloaded three CSV datasets related to vaccines, hospitalizations and test cases by county level from the California Health and Human Services Open Data Portal
    </li>
    <li>Collected EDD employment/unemployment data using API extraction via Socrata Open Data API</li>
    
</ol>

## B. DATA TRANSFORMATION
<ol>
    <li><strong>Data Cleaning & Filtering</strong></li>
        <ul>
            <li>Dataset1: covid19vaccinesbycounty.csv </li>
            <li>Dataset2: covid19hospitalbycounty.csv</li>
                <ul>
                    <li>Based on the CHHS Open Data Portal field documentation, the number of all hospital beds (field_name) also include post-surgical, labor, delivery and observation beds, which were not related to COVID-19 patients. Therefore, this column was <strong>deleted</strong>.</li>
                    <li>There were missing data on the number of hospitalized COVID-19 patients from March 29,2020 through April 20,2020. The column “hospitalized_covid_patients” is equal to the sum of the columns "hospitalized_confirmed" and "hospitalized_suspected". The records with missing data were populated with the calculated sum.</li>
                </ul>
            <li>Dataset3: covid19cases_test.csv</li>
                <ul>
                    <li>The column “area” are generally county names but there are records of California, Out of State and Unknown. Since we are focusing on counties, these records have been <strong>deleted</strong>.</li>
                    <li>The column “area_type” indicates either “County” or “State”. In reference to the first bullet above, California has been deleted so there will be no records with "State" and only "County" were left in this columns. There’s no need to keep a column that just contains one information. Therefore, this column has been <strong>deleted</strong>.</li>
                    <li></li>
                </ul>
            <li>Dataset4: employment_dataset.csv</li>
                <ul>
                    <li>There were records of “State”, “Sub-County Place”, “MSA”, “Metropolitan Area” and “Metro Division” in column area_type. These records have been <strong>deleted</strong> because our focus is on counties.</li>
                    <li>Dates were formatted in UTC time. Therefore, the dates have been changed to reflect an mm/dd/yyyy format. </li>
                </ul>
        </ul>
    <li><strong>Data Normalization</strong></li>
</ol>

## C. DATA LOADING

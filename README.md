# Optical Metadata Application

## Statement
This application will streamline data entry and access to optical metadata by standardizing data in the Oracle database. This meets the urgent need to streamline Structure-from-Motion (SfM) imagery metadata entry, and the future need as a foundation for other optical data entry, quality control, and access.

## Purpose
<ul>
<li></l>Currently SfM metadata is entered manually in a cross-institutional shared Google document https://docs.google.com/spreadsheets/d/1DiQCyb1syk6YZIPB6yuGge5_gzQXkXSE1J0IwDaegMU/ .</li>
<li> Integrating optical metadata into the database will allow to employ validations, database procedures </li>
<li> Developing an application interface for data entry will reduce errors and time spent during manual data entry, as well as allow to summarize and present data in unique ways. </li>
<li> SfM was previously a non-NCRMP datastream and now that is an established NCRMP datastream, integrating it in the Oracle database is essential for us to enhance its data integrity.</li>
<li> This will also allow for integration with the SfM annotation app, and allow for quicker data entry, production, and accessing of SfM metadata.</li>
<li> The foundation for this application could also include modules that involve starting the optical validation QC process for photoquads while on the cruise, reducing the amount of time spent in optical validation post-cruise.</li>
</ul>

## Development Stages
1. Identify priority needs: SfM metadata entry to be standaradized and streamlined by becoming databased with an application interface
2. Consult with SfM members on their needs in data entry
3. Plan database design: what tables and structure will be needed to power application functions and improve data access
4. Develop database design: create the structure for the table
5. Prepare and process data sample from SfM process tracking spreadsheet for ingestion
6. Update database design if needed to allow for ingestion
8. Ingest sample data
7. Develop application interface for metadata entry
8. Develop and establish processes within the data entry: PL/SQL data validations &  database procedures to QC
10. Prepare and process other NCRMP data from SfM process trakcing spreadsheet
11. SfM team tests and reviews application & data presentation
12. Make updates to application
13. Deploy application!

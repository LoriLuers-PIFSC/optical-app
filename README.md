# Optical Application Project

## Statement
This application will standardize and streamline data entry and access to optical data. Specifically, to standardize Structure-from-Motion (SfM) imagery metadata entry and develop a foundation that is based in the database for optical imagery metadata and functions.

## Purpose
Currently SfM metadata is entered in a widely shared Google document https://docs.google.com/spreadsheets/d/1DiQCyb1syk6YZIPB6yuGge5_gzQXkXSE1J0IwDaegMU/ that involves manual entry.
<br>Developing this app module will allow for validations of data, drop down for fields, and improve quality of data simultaneously with reducing time spent during data entry.
<br>SfM was previously a non-NCRMP datastream, now that is an established NCRMP datastream, integrating it in the Oracle database is essential for us to enhance its data integrity.
<br>This will also allow for integration with the SfM annotation app, and allow for quicker data entry, production, and accessing of SfM metadata.
<br>The foundation for this application would also include modules that involve starting the optical validation QC process for photoquads while on the cruise, reducing the amount of time spent in optical validation post-cruise.

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

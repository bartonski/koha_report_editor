# Koha Report Editor

A command line editor for Koha reports

## Usage

    koha_report_editor.pl -n <REPORT NUMBER>

This will edit the saved sql for report id REPORT NUMBER

The edit functionality is planned to be rolled into a separate command line option.

- TODO add error checking
- TODO add options
- TODO add Pod
- TODO add calls to Pod::Usage
- TODO if we could load and save SQL via Koha Rest API, we could call the script remotely.
- TODO create main() function which will make calls to
- TODO - Parse argument list
- TODO - Create report
- TODO - Read report
- TODO - Update report
- TODO - Delete report
- TODO - List current reports

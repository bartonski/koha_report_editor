#! /usr/bin/perl

use Modern::Perl;
use C4::Context;
use C4::Reports::Guided;
use File::Temp qw(tempfile);
use Getopt::Long;
use Pod::Usage;

# TODO add options
my $opt_report_id;

GetOptions(
            'id|n' => \$opt_report_id
        );

# TODO add Pod
# TODO add calls to Pod::Usage
my $report = get_saved_report( $opt_report_id ); 

my $temp_dir = '/tmp';
my ($temp_fh, $temp_name) = tempfile(DIR => $temp_dir);
print $temp_fh $report->{savedsql};
close $temp_fh;
my $EDITOR=( defined $ENV{EDITOR} ) ? $ENV{EDITOR} : '/usr/bin/vim';
system $EDITOR, $temp_name;

open( $temp_fh, '<', $temp_name );
my @sql = <$temp_fh>; # slurp
close( $temp_fh ); 
unlink( $temp_fh );

# TODO if we could load and save SQL via Koha Rest API, we could call the script remotely.
update_sql( $opt_report_id, {
        sql => join( '', @sql ),
        name => $report->{report_name},
        group => $report->{report_group},
        subgroup => $report->{report_subgroup},
        notes => $report->{notes},
        public => $report->{public},
        cache_expiry => $report->{cache_expiry},
    } ); 

# TODO create main() function which will make calls to
# TODO - Parse argument list
# TODO - Create report
# TODO - Read report
# TODO - Update report
# TODO - Delete report
# TODO - List current reports

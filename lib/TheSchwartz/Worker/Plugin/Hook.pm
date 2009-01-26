package TheSchwartz::Worker::Plugin::Hook;

use strict;
use warnings;

use base qw/
    TheSchwartz::Worker
/;

sub pre_work{
    my ($self , $job ) = @_;

}

sub post_work{
    my ($self , $job ) = @_;

}

sub work_safely{
    my ($self , $job ) = @_;

    $self->pre_work($job);

    $self->SUPER::work_safely($job);

    $self->post_work($job);
}



1;

__END__

=head1 NAME

 TheSchwartz::Worker::Plugin::Hook - work hook for TheSchwartz

=head1 SYNOPSIS

    package MyWorker;
    use base qw/ TheSchwartz::Worker::Plugin::Hook /;

    sub pre_work {
        my $class = shift;

        ### before work aciton
    }

    sub work {
        my $class = shift;
        my TheSchwartz::Job $job = shift;

        print "Workin' hard or hardly workin'? Hyuk!!\n";

        $job->completed();
    }

    sub post_work {
        my $class = shift;

        ### after work aciton
    }


    package main;
    
    my $client = TheSchwartz->new( databases => $DATABASE_INFO );
    $client->can_do('MyWorker');
    $client->work();

=head1 AUTHOR

Masaru Hoshino

=head1 SEE ALSO

L<TheSchwartz::Worker>
L<TheSchwartz::Test>


use strict;
use warnings;
use TheSchwartz::Test;

use Test::More tests => 8;
use Test::Output;

run_tests(4, sub {
    my $client = test_client(
        dbs      => ['ts1'],
        dbprefix => 'worker_hook_test',
    );

    my $handle = $client->insert("Worker::Test", { numbers => [1, 2] });
    isa_ok $handle, 'TheSchwartz::JobHandle', "inserted job";
    is($handle->is_pending, 1, "job is still pending");
    is($handle->exit_status, undef, "job hasn't exitted yet");

    $client->can_do('Worker::Test');
    stdout_is( sub {$client->work_once}, 'pre_worked'.'worked'.'post_worked');

    teardown_dbs();
});

package Worker::Test;
use base qw/TheSchwartz::Worker::Plugin::Hook/;

sub pre_work {
    my ($class, $job) = @_;
    print STDOUT 'pre_worked';
}

sub work {
    my ($class, $job) = @_;
    print STDOUT 'worked';
}

sub post_work {
    my ($class, $job) = @_;
    print STDOUT 'post_worked';
}


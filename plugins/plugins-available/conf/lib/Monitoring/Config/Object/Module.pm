package Monitoring::Config::Object::Module;

use strict;
use warnings;
use parent 'Monitoring::Config::Object::Parent';

=head1 NAME

Monitoring::Config::Object::Module - Module Object Configuration

=head1 DESCRIPTION

Defaults for module objects

=cut

##########################################################

$Monitoring::Config::Object::Module::Defaults = {
    'name'                            => { type => 'STRING', cat => 'Extended' },
    'use'                             => { type => 'LIST', link => 'host', cat => 'Basic' },
    'register'                        => { type => 'BOOL', cat => 'Extended' },

    'module_name'                    => { type => 'STRING', cat => 'Basic' },
    'path'                           => { type => 'STRING', cat => 'Basic' },
    'args'                           => { type => 'STRING', cat => 'Basic' },
    'module_type'                    => { type => 'CHOOSE', values => ['neb'], keys => [ 'neb' ], cat => 'Basic' },
};

##########################################################

=head1 METHODS

=head2 BUILD

return new object

=cut
sub BUILD {
    my $class    = shift || __PACKAGE__;
    my $coretype = shift;

    return unless($coretype eq 'any' or $coretype eq 'icinga');

    my $self = {
        'type'        => 'module',
        'primary_key' => 'module_name',
        'default'     => $Monitoring::Config::Object::Module::Defaults,
        'standard'    => [ 'module_name', 'path', 'args', 'module_type' ],
    };
    bless $self, $class;
    return $self;
}

##########################################################

=head1 AUTHOR

Sven Nierlein, 2009-2014, <sven@nierlein.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

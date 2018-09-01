use strict; use warnings;
package TestMLBridge;
use base 'TestML::Bridge';

use YAML::XS;
use Data::Dumper;

use Pegex::JSON;

sub loadfirst {
  my ($self, $str) = @_;
  my $arr = $self->load($str);
  print Dumper $arr;
  return $self->load($str)->[0];
}

# $Pegex::Parser::Debug = 1;
sub load {
  my ($self, $str) = @_;
  return Pegex::JSON->new->load($str);
}

sub yaml {
  my ($self, $str) = @_;
  my $yaml = YAML::XS::Dump($str);

  $yaml =~ s/^---\s+//;
  $yaml =~ s{!!perl/scalar:boolean }{};

  return $yaml;
}

1;

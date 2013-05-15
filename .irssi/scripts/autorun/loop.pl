#!/usr/bin/perl

use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.02";

%IRSSI = (
    authors     => 'd5-ro',
    contact     => '0din@vhalholl.info',
    name        => 'loop.pl',
    description => 'loop',
    license     => 'GNU General Public License',
    url         => 'http://code.vhalholl.info/irssi_test.txt',
    changed     => 'today?',
);

Irssi::theme_register([
	$IRSSI{name}.'_loaded', '%G>>%n %_Scriptinfo:%_ Loaded $0 version $1 by $2.'
]);

sub loop_handler(){
    my($data,$serv,$chan)=@_;

	if(!$serv||!$serv->{connected}){
		Irssi::print('You\'re not connected to a server dude ! -_-"');
		return(0);
	}
	elsif(!$chan||!$chan->{type} eq "CHANNEL"){
		Irssi::print('No active channel in this window, sorry.');
		return(0);
	}

	if(@_ lt "3"){
		Irssi::print('Usage: /loop <nick> <msg> {<count> <interval>}');
		return(0)}
	else{
        my $sh=shift(@_); 
		$chan->command("/msg $sh (L)");
		return(1);
	}
}

Irssi::command_bind('loop', 'loop_handler');
Irssi::printformat(MSGLEVEL_CLIENTCRAP, $IRSSI{name}.'_loaded', $IRSSI{name}, $VERSION, $IRSSI{authors});

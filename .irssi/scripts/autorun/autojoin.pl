#!/usr/bin/perl

use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.02";

%IRSSI = (
    authors     => 'd5-ro',
    contact     => '0din@vhalholl.no-ip.org',
    name        => 'autojoin.pl',
    description => 'Rejoin a channel after a kick.',
    license     => 'GNU General Public License',
    url         => 'http://vhalholl.no-ip.org/irssi_autojoin.txt',
    changed     => 'Tue Sep 10 01:00:11 CEST 2007',
);

Irssi::theme_register([
	'autojoin_loaded', '%G>>%n %_Scriptinfo:%_ Loaded $0 version $1 by $2.'
]);

sub kick_handler(){
	my($data,$serv,$chan)=@_;
	my $me=$data->{nick};
	@parts=split(" ",$serv);
	if($parts[1] eq $me){
		#Irssi::print("\00312You've been kicked to ".$parts[0]." by ".$chan." [".$parts[3]."] :( \003\n");
		$data->send_raw("JOIN $parts[0]");
		return(1);
	}
}
Irssi::signal_add('event kick', 'kick_handler');
Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'autojoin_loaded', $IRSSI{name}, $VERSION, $IRSSI{authors});

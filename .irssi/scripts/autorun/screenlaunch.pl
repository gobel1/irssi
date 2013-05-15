#screen

use strict;

use vars qw($VERSION %IRSSI);
$VERSION = "20110208";
%IRSSI = (
    authors     => "d5-ro",
    contact     => "0din\@vhalholl.info",
    name        => "ScreenLauncher",
    description => "Launch command whithin screen",
    license     => "GPLv2",
    url         => "http://scripts.irssi.org",
    changed     => "$VERSION",
    commands	=> "sc"
);

use Irssi 20020324;
use Irssi::TextUI;
use Irssi::UI;
use vars qw(@urls %urltypes $recent);

Irssi::theme_register([
	$IRSSI{name}.'_loaded', '%G>>%n %_Scriptinfo:%_ Loaded $0 version $1 by $2.'
]);

sub screen_handler () {
    my($arg,$serv,$witem)=@_;
    my $cmd="screen ".$arg;
    system($cmd);
    return(1);
}

Irssi::command_bind('screen', 'screen_handler');
Irssi::printformat(MSGLEVEL_CLIENTCRAP, $IRSSI{name}.'_loaded', $IRSSI{name}, $VERSION, $IRSSI{authors});

#!/usr/bin/perl

use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.02";

%IRSSI = (
    authors     => 'd5-ro',
    contact     => '0din@vhalholl.info',
    name        => 'dandd.pl',
    description => 'Slap a guy whith a random stuff D&D style.',
    license     => 'GNU General Public License',
    url         => 'http://vhalholl.no-ip.org/irssi_dandd.txt',
    changed     => 'Tue Sep 10 02:00:34 CEST 2007',
);

Irssi::theme_register([
	'dandd_loaded', '%G>>%n %_Scriptinfo:%_ Loaded $0 version $1 by $2.'
]);

sub dd_handler(){
	my($data,$serv,$chan)=@_;
	my $sh=shift(@_);
	my $x=int(rand(999)) +1;
	my $y=int(rand(10)) +1;
	my @z=(
		'd\'un coup de rien du tout',
		'd\'un coup de pied',
		'd\'un coup de poing',
		'd\'un coup de boule',
		'd\'un coup de genoux',
		'd\'un coup d\'épaule',
		'd\'un coup de couteau',
		'd\'un coup de batte de baseball',
		'd\'une droite',
		'd\'un crochet du gauche',
		'd\'un coup de katana'
	);

	if(!$serv||!$serv->{connected}){
		Irssi::print('You\'re not connected to a server dude ! -_-"');
		return(0);
	}
	elsif(!$chan||!$chan->{type} eq "CHANNEL"){
		Irssi::print('No active channel in this window, sorry.');
		return(0);}

	if ($sh eq "") {
		Irssi::print("Usage: /dd <nick>");}
	else{
		$chan->command("/me frappe $sh ".$z[$y].", $sh se prend $x points de dégàts !!!");}
	return(1);}

Irssi::command_bind('dd', 'dd_handler');
Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'dandd_loaded', $IRSSI{name}, $VERSION, $IRSSI{authors});

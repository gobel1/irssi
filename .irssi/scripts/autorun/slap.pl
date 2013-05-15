#!/usr/bin/perl

use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.02";

%IRSSI = (
    authors     => 'd5-ro',
    contact     => '0din@vhalholl.no-ip.org',
    name        => 'slap.pl',
    description => 'Slap a guy when you want whith a random stuff.',
    license     => 'GNU General Public License',
    url         => 'http://vhalholl.no-ip.org/irssi_slap.txt',
    changed     => 'Tue Sep 10 01:00:11 CEST 2007',
);

Irssi::theme_register([
	'slap_loaded', '%G>>%n %_Scriptinfo:%_ Loaded $0 version $1 by $2.'
]);

sub tab(){
	@do=(
		'slaps',
		'hits',
		'beats up',
		'bashes',
		'hurts',
		'kills',
		'tortures'
	);
	@size=(
		'a large',
		'a big',
		'an enormous',
		'a small',
		'a medium sized',
		'an extra large',
		'a questionable',
		'a suspicious',
		'a terrifying',
		'a scary',
		'a breath taking',
		'a horrifying'
	);

	@with=(
		'Windows<tm> ME user guide',
		'Undocumented Windows<tm> 3.0&3.1 cooking book',
		'brick',
		'non-functional AT power source',
		'functional ATX power source',
		'axe',
		'Pentium<tm> MMX CPU',
		'Pentium<tm> Overdrive CPU',
		'salmon',
		'Pentium<tm> CPU ',
		'iron bar',
		'lorie\'s CD',
		'Pentium<tm> 2 CPU', 
		'Pentium<tm> 3 CPU',
		'Pentium<tm> 4 CPU',
		'set of Windows<tm> 3.11 floppies',
		'truit',
		'christmas tree',
		'Compaq<tm> laptop',
		'picture of Bill Gates<tm>',
		'MagLite<tm> torch covered with vaseline',
		'Micro$oft<tm> IIS Server',
		'Pentium<tm> 486 SX CPU',
		'Pentium<tm> 486 DX CPU'
	);

	srand;
	$index=rand @do;
	$do=@do[$index];
	$index=rand @size;
	$size=@size[$index];
	$index=rand @with;
	$with=@with[$index];
}

sub slap_handler(){
	my($data,$serv,$chan)=@_;

	if(!$serv||!$serv->{connected}){
		Irssi::print('You\'re not connected to a server dude ! -_-"');
		return(0);
	}
	
	elsif(!$chan||!$chan->{type} eq "CHANNEL"){
		Irssi::print('No active channel in this window, sorry.');
		return(0);
	}
	tab;
	my $sh=shift(@_);
	if($sh eq ""){
		Irssi::print('Usage: /slap <nick>');
		return(0)}
	else{
		$chan->command("/me $do $sh whith $size $with");
		return(1);
	}
}
	
sub kslap_handler(){
	my($data,$serv,$chan)=@_;

	if(!$serv||!$serv->{connected}){
		Irssi::print('You\'re not connected to a server dude ! -_-"');
		return(0);
	}
	elsif(!$chan||!$chan->{type} eq "CHANNEL"){
		Irssi::print('No active channel in this window, sorry.');
		return(0);
	}
	tab;
	my $me=$serv->{nick};
	my $sh=shift(@_);
	if ($sh eq ""){
		Irssi::print('Usage: /kslap <nick>');
		return(0);
	}
	elsif(!$chan->{ownnick}{op}){
		Irssi::print('You\'re not a channel operator, don\'t mess whith me !');
		return(0);
	}
	else{
   		$chan->command("/kick $sh $me $do $sh with $size $with");
		return(1);
	}
}

Irssi::command_bind('slap', 'slap_handler');
Irssi::command_bind('kslap', 'kslap_handler');
Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'slap_loaded', $IRSSI{name}, $VERSION, $IRSSI{authors});

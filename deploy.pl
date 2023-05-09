#!/usr/bin/perl -w
# deploy.pl - Script for deploying shadow with docker

use strict;
use warnings;

my %OPTS;

$OPTS{IRC_NICK}       = "Shadow-Docker".int(rand(9)).int(rand(9));
$OPTS{IRC_NAME}       = "shadow";
$OPTS{IRC_HOST}       = "irc.ephasic.org";
$OPTS{IRC_PORT}       = 6667;
$OPTS{IRC_ADMINHOSTS} = "*!*\@owner.ephasic.org";
$OPTS{IRC_CHANS}      = "#lobby";
$OPTS{IRC_CMDCHAN}    = "#shadowcmd";
$OPTS{CONTAINERNAME}  = "shadow";
$OPTS{HTTP_PORT}      = 1337;

sub help {
	print "Usage: $0 [OPTS]\n";
	print "Deploys shadow with docker\n\n";
	
	print "Config Options:\n";
	print "\t--nick\t\t\t- IRC nick\n";
	print "\t--name\t\t\t- IRC name\n";
	print "\t--host\t\t\t- IRC server host\n";
	print "\t--port\t\t\t- IRC server port\n";
	print "\t--adminhosts\t\t- IRC admin hostnames (ex: *!*\@domain.tld,*!ab\@ex.co)\n";
	print "\t--chans\t\t\t- IRC channels (ex: #lobby,#bots,#shaow)\n";
	print "\t--cmdchan\t\t- IRC logging channel\n";
	print "\t--webadmin-port\t\t- Web Admin HTTP server port\n";
	print "\t--puburl\t\t- Web Admin public URL (ex http://hostname:port/)\n";
	print "\t--container-name\t- Docker container name\n\n";
	exit;
}

if (scalar(@ARGV) == 0) {
	help();
}

for (my $i = 0; $i < scalar(@ARGV); $i++) {
	my $arg = $ARGV[$i];

	if ($arg =~ /-[-]?(.*)/) {
		my $an = $1;
		my $av = $ARGV[$i+1];

		$OPTS{IRC_NICK} = $av if ($an =~ /^nick$/i);
		$OPTS{IRC_NAME} = $av if ($an =~ /^name$/i);
		$OPTS{IRC_HOST} = $av if ($an =~ /^host$/i);
		$OPTS{IRC_PORT} = $av if ($an =~ /^port$/i);
		$OPTS{IRC_ADMINHOSTS} = $av if ($an =~ /^adminhosts$/i);
		$OPTS{IRC_CHANS} = $av if ($an =~ /^chans$/i);
		$OPTS{IRC_CMDCHAN} = $av if ($an =~ /^cmdchan$/i);
		$OPTS{HTTP_PUBURL} = $av if ($an =~ /^puburl$/);
		$OPTS{CONTAINERNAME} = $av if ($an =~ /^container-name$/i);
		$OPTS{HTTP_PORT} = $av if ($an =~ /^webadmin-port$/i);
		help() if ($an =~ /^help$/i);

		$i++;
	}
}

if (!$OPTS{HTTP_PORT}) {
	$OPTS{HTTP_PORT} = "http://localhost:".$OPTS{HTTP_PORT}."/";
}

my $dexec = "docker run -d -p ".$OPTS{HTTP_PORT}.":".$OPTS{HTTP_PORT};

foreach my $k (keys %OPTS) {
	$dexec .= " -e $k=\"".$OPTS{$k}.'"';
}

$dexec .= " --name ".$OPTS{CONTAINERNAME}." ab3800/shadow:latest";


print "$dexec\n";
system $dexec;

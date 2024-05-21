#!/usr/bin/env bash

if [[ $(docker ps -q | wc -c) -gt 0 ]]; then
	docker ps --format '{{.Names}} {{.ID}} {{.Ports}}' |
		sed 's/,\ //g' |
		sed 's/0\.0\.0\.0://g' |
		awk '
{ $2 = substr($2,1,3)}
{print "%{B#6300a9}%{F#fff}"}
{print $2} 
{print "%{R}"}
{print $1} 
{print "%{T3}%{R}%{B#9d5993}"}
{print $3}
{print "%{T-}%{B-}%{F-}"}
{print "||"} 
' |
		tr '\n' ' ' |
		sed 's/\/tcp/\ /g' |
		sed 's/[[:space:]]\:\:\:[0-9]*->[0-9]*[[:space:]]/\ /g' |
		tr -s ' ' |
		sed 's/||[[:space:]]$//' \
		;
else
	echo "no container..."
fi

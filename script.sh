#!/usr/bin/env bash

GREEN="\033[32m"
RESET="\033[0m"

function print_usage() {
	cat <<EOF
Uso: $(basename "$0") <opcao> <args>...
Onde <opcao> pode ser:
  -c Roda 'flutter clean' em cada package
  -h Mostra este menu
  -p Roda 'flutter pub get' em cada package
  -t Roda 'flutter test' em cada package
  -x Roda um comando na raiz de cada package
EOF
}

function fail() {
	echo $1
	exit 1
}

function print_package() {
	echo -e "> $GREEN$1$RESET"
}

function for_each_package() {
	package=$1
	command=$2
	print_package $package
	eval $command
}

function run_on_each_package() {
	for package_path in $PWD/*; do
		pushd $package_path > /dev/null
		package=$(basename $package_path)
        
        for_each_package "$package" "$1"


        popd > /dev/null
	done
	# for_each_package $(basename "$PWD") "$1"
}

function assert_has_arg() {
	[ -n "$1" ] || fail "$2"
}

[ $# -eq 0 ] && print_usage && exit

case "$1" in
	-c)
		shift
		run_on_each_package "flutter clean";;
	-h)
		shift
		print_usage;;
	-p)
		shift
		run_on_each_package "flutter pub get";;
	-t)
		shift
		DEFAULT_JOBS_COUNT=4
		jobs=$(nproc 2> /dev/null)
		jobs=${jobs:=$DEFAULT_JOBS_COUNT}
		flutter test -j "$jobs" $PWD/*;;
	-x)
		shift
		command="$1"
		assert_has_arg "$command" "Faltou comando para opção -x" && shift
		run_on_each_package "$command";;
	*)
		fail "Opção inválida: $1";;
esac
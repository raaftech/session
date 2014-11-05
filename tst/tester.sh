#!/bin/bash

# Globals for the test runner.
test_conf="$HOME/.session/cfg/tester.conf"
test_tlog="$HOME/.session/log/tester.log"
test_defs="../doc/test-definitions.txt"
test_wset="$(cat "$test_defs" | grep -v '^#' | sed '/^$/d' | cut -d ':' -f 1 | tr '[A-Z]' '[a-z]')"

# Make sure log output directory exists.
mkdir -p "$(dirname $test_conf)" "$(dirname $test_tlog)" 

# Source test configuration, if existing, else create defaults.
if [ -e "$test_conf" ]; then
    while read line ; do
        if [ ! "$(echo $line | grep '#')" ]; then
            export $line > /dev/null
        fi         
    done < "$test_conf"
else
    printf %s "\
    # tester.conf - Various global settings for tester.
    test_discovery_hostname=fill.in.host.name.com
    test_discovery_ipaddress=1.2.3.4
    test_discovery_iprange=1.2.3.0/24
    test_reachable_host=some-reachable-host
    test_reachable_guest=some-reachable-guest
    test_reachable_service=some-reachable-service
    test_busy_host=some-busy-host
    test_busy_guest=some-busy-guest
    test_busy_service=some-busy-service
    test_nonexisting_host=non-existing-host
    test_nonexisting_guest=non-existing-guest
    test_nonexisting_service=non-existing-service
    test_stopped_host=some-stopped-host
    test_stopped_guest=some-stopped-guest
    test_stopped_service=some-stopped-service
    " | sed 's/^[[:space:]]*//' > "$test_conf"

    while read line ; do
        if [ ! "$(echo $line | grep '#')" ]; then
            export $line > /dev/null
        fi      
    done < "$test_conf"
fi

# testTemplate() - A test script template writer.
testTemplate() {
    mkdir -p "$test_name"
    echo "#!/bin/bash"                                                           > "$test_name/$test_name.sh"
    echo ""                                                                     >> "$test_name/$test_name.sh"
    echo "# $test_code: $test_desc"                                             >> "$test_name/$test_name.sh"
    echo "test_intr=0 # Is this test interactive (0=no, 1=yes)?"                >> "$test_name/$test_name.sh"
    if [[ "$test_desc" =~ "fail" ]]; then
        echo "test_exit=1 # For this test to pass, the exit code should be?"    >> "$test_name/$test_name.sh"
    else
        echo "test_exit=0 # For this test to pass, the exit code should be?"    >> "$test_name/$test_name.sh"
    fi
    echo ""                                                                     >> "$test_name/$test_name.sh"
    if [[ "$test_desc" =~ "fail" ]]; then
        echo "exit 0 # remove this and implement a real test!"                  >> "$test_name/$test_name.sh"
    else
        echo "exit 1 # remove this and implement a real test!"                  >> "$test_name/$test_name.sh"
    fi
    chmod +x "$test_name/$test_name.sh"
}

# testRunner() - The main test script invoker.
testRunner() {
	test_name="$(echo "$1" | tr '[A-Z]' '[a-z]')"
	test_code="$(echo "$1" | tr '[a-z]' '[A-Z]')"
    test_desc="$(cat "$test_defs" \
                    | grep "^$test_code" \
                    | cut -d ':' -f 2 \
                    | sed 's/^[ \t]*//;s/[ \t]*$//' \
                )"
    
    echo -n "$test_name: "
    if [ -x "$test_name/$test_name.sh" ]; then
    	cd "$test_name"
    	
    	# Check if the test script is interactive or not, defaults to 0.
    	test_intr="$(cat "$test_name.sh" \
                        | grep "^test_intr=" \
                        | cut -d '=' -f 2 \
                        | cut -d '#' -f 1 \
                        | cut -d ' ' -f 1 \
                        || echo 0 \
                    )"
        
        # Check what exit code would pass as a success condition, defaults to 0.
        test_exit="$(cat "$test_name.sh" \
                        | grep "^test_exit=" \
                        | cut -d '=' -f 2 \
                        | cut -d '#' -f 1 \
                        | cut -d ' ' -f 1 \
                        || echo 0 \
                    )"
        
        # Write a header for this test to the output log.
        echo "$test_code: $test_desc"                                           >> "$test_tlog"
        echo "$test_code: $test_name/$test_name.sh output:"                     >> "$test_tlog"
        
        # Check if the test is interactive or not.
        if [ "$test_intr" == "1" ]; then
            echo "`tput setaf 4`interactive`tput sgr0`"
            ./"$test_name.sh"                                                   2>&1 | tee -a "$test_tlog"
        else
            ./"$test_name.sh"                                                   >> "$test_tlog" 2>&1
        fi
        
        # Check the exit code of the test script.
        if [ "${PIPESTATUS[0]}" == "$test_exit" ]; then
            if [ "$test_intr" == "1" ]; then echo -n "$test_name: "; fi
            echo -e "\E[32mpassed\E[0m"
            echo -ne "\n\n"                                                     >> "$test_tlog"
        else
            if [ "$test_intr" == "1" ]; then echo -n "$test_name: "; fi
            echo -e "\E[31mfailed\E[0m ($test_desc)"
            echo -ne "\n\n"                                                     >> "$test_tlog"
        fi
        
        cd ..
    else
        echo -e "\E[33mundefined\E[0m"
    fi
}

case "$1" in
    all)
    for test in $test_wset; do
    	testRunner $test
    done
    ;;
    list)
    cat "$test_defs" | grep -v '^#' | sed '/^$/d'
    ;;
    *)
    if [ "$1" -a -z "$2" ]; then
        count="$(echo $1 | sed "s|^tst||g" | sed "s|^0||g" | sed "s|^0||g")"
        length=${#count}
        if [ $length = 1 ]; then
            test=tst00$count
        elif [ $length = 2 ]; then
            test=tst0$count
        elif [ $length = 3 ]; then
            test=tst$count
        fi
        testRunner $test
    elif [ "$1" -a "$2" ]; then
        first="$(echo $1 | sed "s|^tst||g" | sed "s|^0||g" | sed "s|^0||g")"
        last="$(echo $2 | sed "s|^tst||g" | sed "s|^0||g" | sed "s|^0||g")"
        
        for (( count=$first; count<=$last; count+=1 )); do
            length=${#count}
            if [ $length = 1 ]; then
                test=tst00$count
            elif [ $length = 2 ]; then
                test=tst0$count
            elif [ $length = 3 ]; then
                test=tst$count
            fi
            testRunner $test
            done
    else
        echo $"Usage: $0 {all|list|<name>|<from> <to>}" 
        exit 1
    fi
esac

/*
 * Malitious bash script detection
 * By: Lewis Evans
 * Github: https://www.github.com/awesomelewis2007/YARA-Rules
*/

import "magic"

rule is_bash {
    meta:
        name = "Detect bash files"
        author = "Lewis Evans"
        description = "Detects bash files"
        date = "2023-04-17"
        extension = ".bash .sh"
    strings:
        $bash = "#!/bin/bash"
        $bash2 = "#!/bin/sh"
    condition:
        $bash or $bash2
}

rule bash_wiper {
    meta:
        name = "Detect bash wiper"
        author = "Lewis Evans"
        description = "Bash wiper is a program that deletes all files on a computer"
        extension = ".bash .sh"
        date = "2023-04-17"
    strings:
        $wiper = "rm -rf /"
        $wiper = "rm -rf *"
    condition:
        is_bash and $wiper
}
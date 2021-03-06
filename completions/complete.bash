_prm()
{
    local cur prev words cword opts commands
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    com="${COMP_WORDS[1]}"
    opts="-h --help -v --version"
    commands="active add copy edit list remove rename start stop"

    case $com in
        edit|remove)
            COMPREPLY=( $(compgen -W "$(prm list)" -- ${cur}) )
            return 0
            ;;
    esac

    case $prev in
        copy|rename|start)
            COMPREPLY=( $(compgen -W "$(prm list)" -- ${cur}) )
            return 0
            ;;
        *)
            case $com in
                active|add|copy|list|rename|start|stop)
                    COMPREPLY=()
                    return 0
                    ;;
                *)
                    COMPREPLY=( $(compgen -W "${commands} ${opts}" -- ${cur}) )
                    return 0
                    ;;
            esac
    esac

} &&
complete -F _prm prm

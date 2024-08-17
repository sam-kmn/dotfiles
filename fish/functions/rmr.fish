function safe_rm
    set -l target $argv[1]

    # Check if no target is provided
    if test -z "$target"
        echo "Error: No target specified."
        return 1
    end

    # Define dangerous paths
    set -l dangerous_paths "/" "/bin" "/boot" "/dev" "/etc" "/home" "/lib" "/mnt" "/opt" "/proc" "/root" "/sbin" "/srv" "/sys" "/tmp" "/usr" "/var"

    # Check if the target is a dangerous path
    for path in $dangerous_paths
        if test "$target" = $path
            echo "Error: Attempting to delete a critical system directory ($path). Aborting."
            return 1
        end
    end

    # Confirm deletion
    echo "Are you sure you want to delete '$target'? [y/N]"
    read -l confirmation

    if test "$confirmation" != "y"
        echo "Deletion aborted."
        return 1
    end

    # Perform the removal
    rm -rdf $target

    # Check if the removal was successful
    if test $status -eq 0
        echo "'$target' has been removed successfully."
    else
        echo "Error: Failed to remove '$target'."
        return 1
    end
end

#!/bin/bash

# Define aliases here with ":" separator
ALIASES=(
"cm:checkout master"
"c:checkout"
"cn:checkout -b"
"rim:rebase -i master"
"rc:rebase --continue"
"ra:rebase --abort"
)

for ALIAS in "${ALIASES[@]}"; do
    IFS=":" read -r alias_key alias_value <<< "$ALIAS"
    
    EXISTING_ALIAS=$(git config --get alias.$alias_key)

    if [ -n "$EXISTING_ALIAS" ]; then
        if [ "$EXISTING_ALIAS" != "$alias_value" ]; then
            echo "Alias exist with value '$EXISTING_ALIAS'. Update alias to '$alias_value'? (y/n)"
            read -r REPLACE
            if [ "$REPLACE" == "y" ]; then
                git config --global alias.$alias_key "$alias_value"
                echo "Alias '$alias_key' updated."
            else
                echo "Alias '$alias_key' NOT updated."
            fi
        fi
    else
        git config --global alias.$alias_key "$alias_value"
        echo "Alias '$alias_key' successful added."
    fi
done

# show current aliases
    echo "____________________

ALIAS LIST:"
    git config --get-regexp alias

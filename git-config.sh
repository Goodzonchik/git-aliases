#!/bin/bash

get_user_name() {
    read -p "Write user name: " user_name
    if [[ -z "$user_name" ]]; then
        echo "Error: User name is empty"
        get_user_name
    fi
}

get_user_email() {
    read -p "Write user email: " user_email
    if [[ -z "$user_email" ]]; then
        echo "Error: User email is empty"
        get_user_email
    fi
}

get_user_name
get_user_email

git config --global user.name "$user_name"
git config --global user.email "$user_email"


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
            echo "Alias exist with value '$EXISTING_ALIAS'. Update alias to '$alias_value'? (confirm/n)"
            read -r REPLACE
            if [ "$REPLACE" == "confirm" ]; then
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


# show updated configuration
user_name=$(git config user.name)
user_mail=$(git config user.email)
    echo "_________ You configuration ___________

name: $user_name
email: $user_mail

ALIAS LIST:"
    git config --get-regexp alias

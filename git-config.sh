#!/bin/bash

current_user=$(git config user.name)

if [ -z "$current_user" ]; then
    echo "Git username is not set."
else
    echo "Current username is: $current_user"
fi

read -p "Do you want to change the git username? (confirm/n): " answer

if [ "$answer" == "confirm" ]; then
    read -p "Write new username: " new_user
    git config --global user.name "$new_user"
    echo "Git username successfully changed to: $new_user"
else
    echo "Git username remains unchanged."
fi

current_email=$(git config user.email)

if [ -z "$current_email" ]; then
    echo "Git email is not set."
else
    echo "Current email is: $current_email"
fi

read -p "Do you want to change the git email? (confirm/n): " answer_email

if [ "$answer_email" == "confirm" ]; then
    read -p "Write new email: " new_email
    git config --global user.email "$new_email"
    echo "Git email successfully changed to: $new_email"
else
    echo "Git email remains unchanged."
fi


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

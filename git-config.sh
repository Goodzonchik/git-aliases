#!/bin/bash

get_and_set_config() {
    local config_key=$1
    local prompt_message=$2
    local success_message=$3

    local current_value=$(git config $config_key)

    if [ -z "$current_value" ]; then
        echo "$prompt_message is not set."
    else
        echo "Current $prompt_message is: $current_value"
    fi

    read -p "Do you want to set or change the git $prompt_message? (confirm/n): " answer

    if [ "$answer" == "confirm" ]; then
        read -p "Write $prompt_message: " new_value
        git config --global $config_key "$new_value"
        echo "$success_message to: $new_value"
    else
        echo "Git $prompt_message remains unchanged."
    fi
}

get_and_set_config "user.name" "username" "Git username successfully set"
get_and_set_config "user.email" "email" "Git email successfully set"

ALIASES=(
"cm:checkout master"
"c:checkout"
"cn:checkout -b"
"rim:rebase -i master"
"rc:rebase --continue"
"ra:rebase --abort"
)

set_git_aliases() {
    local alias_key=$1
    local alias_value=$2

    local existing_alias=$(git config --get alias.$alias_key)

    if [ -n "$existing_alias" ]; then
        if [ "$existing_alias" != "$alias_value" ]; then
            echo "Alias '$alias_key' exists with value '$existing_alias'. Update alias to '$alias_value'? (confirm/n)"
            read -r replace
            if [ "$replace" == "confirm" ]; then
                git config --global alias.$alias_key "$alias_value"
                echo "Alias '$alias_key' updated."
            else
                echo "Alias '$alias_key' NOT updated."
            fi
        fi
    else
        git config --global alias.$alias_key "$alias_value"
        echo "Alias '$alias_key' successfully added."
    fi
}

for alias in "${ALIASES[@]}"; do
    IFS=":" read -r alias_key alias_value <<< "$alias"
    set_git_aliases "$alias_key" "$alias_value"
done

user_name=$(git config user.name)
user_mail=$(git config user.email)

echo "_________ Your configuration ___________

name: $user_name
email: $user_mail

ALIAS LIST:"
git config --get-regexp alias

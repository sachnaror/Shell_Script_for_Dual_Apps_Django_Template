#!/bin/bash

# Prompt the user to enter the project and app names
read -p "Project name: " project_name
read -p "First app name: " app_name1
read -p "Second app name: " app_name2

# Create the Django project
django-admin startproject "$project_name"

# Move into the project directory
cd "$project_name"

# Create the first Django app inside the project directory
python manage.py startapp "$app_name1"

# Create the second Django app inside the project directory
python manage.py startapp "$app_name2"

# Move the manage.py file outside the first project_name directory
mv manage.py ..

# Move back to the parent directory
cd ..

# Create .env, .gitignore, requirements.txt, and README.md files alongside manage.py
touch .env
echo "# Django" > .gitignore
echo -e "env/\n*.pyc\n__pycache__/\ndb.sqlite3\n/media/\n/static/\n.DS_Store\n*.log\n.vscode\n.idea\n*.swp\n*.swo\n*.swn\nvenv/\n.env" >> .gitignore
touch requirements.txt
echo "# $project_name" > README.md
echo -e "\n## Description\nA Django project with the apps $app_name1 and $app_name2." >> README.md

# Move the manage.py back to the project_name directory
mv manage.py "$project_name"

# Move the .env, .gitignore, requirements.txt, and README.md files to the project_name directory
mv .env .gitignore requirements.txt README.md "$project_name"

# Change directory to the project_name directory
cd "$project_name"

# Function to set up directories and files for a given app
setup_app() {
    local app_name=$1

    # Create directories for tests, static files, and templates inside the app directory
    mkdir -p "$app_name/tests"
    mkdir -p "$app_name/static/$app_name/css"
    mkdir -p "$app_name/static/$app_name/js"
    mkdir -p "$app_name/static/$app_name/images"
    mkdir -p "$app_name/static/$app_name/fonts"
    mkdir -p "$app_name/templates/$app_name"

    # Create files inside the app directories
    touch "$app_name/tests/__init__.py"
    touch "$app_name/tests/test_models.py"
    touch "$app_name/tests/test_views.py"

    # Create a sample static file and template
    touch "$app_name/static/$app_name/css/styles.css"
    touch "$app_name/static/$app_name/js/script.js"
    touch "$app_name/static/$app_name/images/logo.png"
    touch "$app_name/static/$app_name/fonts/font.ttf"
    touch "$app_name/templates/$app_name/index.html"

    # Create empty urls.py and serializers.py files in the app directory
    touch "$app_name/urls.py"
    touch "$app_name/serializers.py"
}

# Set up directories and files for both apps
setup_app "$app_name1"
setup_app "$app_name2"

# Display a message confirming the completion of the task
echo "Django project '$project_name' with apps '$app_name1' and '$app_name2' has been set up with manage.py and other necessary files."

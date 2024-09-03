# MAL Rank Finder

This script fetches anime names from the "MyAnimeList" website and searches for a specific anime based on user input. It uses `curl` to retrieve the webpage and `sed` to extract anime names. The script allows users to search for an anime name and prints its rank if found.

**Note:** This is a project I built while learning Bash scripting and is meant for educational purposes.

## Features

- Fetches anime names from "MyAnimeList" using pagination.
- Allows user to input an anime name for search.
- Displays the rank of the anime if found.

## Requirements

- Bash (4.0+)
- `curl` for fetching webpage content
- Internet connection

## Usage

1. **Clone the repository:**

    ```bash
    git clone https://github.com/notgman/mal-rank-finder.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd mal-rank-finder
    ```

3. **Make the script executable:**

    ```bash
    chmod +x script.sh
    ```

4. **Run the script:**

    ```bash
    ./script.sh
    ```

5. **Enter the anime name when prompted:**

    The script will ask you to enter the name of the anime you want to search for. Enter the name, and it will print the rank if found.

## Example

```bash
$ ./script.sh
Enter the anime name: Vinland
Rank 30 : Vinland Saga Season 2
Rank 44 : Vinland Saga
```

## Features

- [x] Fetch anime names from the "MyAnimeList" website.
- [x] Allow user input for anime name search.
- [ ] Display the rank of the anime if found.

#!/bin/bash

# Define your list of items here (one per line)
ITEMS=(
    "austeane"
    "chiphamm"
    "fimmtiu"
    "georgepeek-clio"
    "hydra008"
    "jessewmc"
    "karenlie"
    "karenzhang7717"
    "lawyaw-mad"
    "mokobrosli"
    "pheen"
    "wqxxzd"
)


DELAY=5

# Print header
echo "Github activity for each user:"
echo "-------------"

# Check if ITEMS array is empty
if [ ${#ITEMS[@]} -eq 0 ]; then
    echo "Error: ITEMS array is empty. Please add items at the top of the script."
    exit 1
fi

# Find the longest item for padding
max_length=0
for item in "${ITEMS[@]}"; do
    item_length=${#item}
    if [ $item_length -gt $max_length ]; then
        max_length=$item_length
    fi
done

# Add some extra space for padding
max_length=$((max_length + 20))

# Process each item
for item in "${ITEMS[@]}"; do
    # Use echo and wc to count characters
    authored=$(gh search prs --owner=clio --limit 300 -- "merged:2024-07-01..2024-12-31" "author:$item" | wc -l)
    reviewed=$(gh search prs --owner=clio --limit 300 -- "merged:2024-07-01..2024-12-31" "reviewed-by:$item" | wc -l)
    printf "%-${max_length}s %s\n" "$item authored prs:" "$authored"
    printf "%-${max_length}s %s\n" "$item reviewed prs:" "$reviewed"
 
    sleep $DELAY
done

echo "-------------"
echo "Total items processed: ${#ITEMS[@]}"

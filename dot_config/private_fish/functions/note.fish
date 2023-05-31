function note -d "add note to ~/notes.txt"
    echo "date: $(date '+%^a %d %+4Y')" >>~/notes.txt
    echo -e "$argv\n" >>~/notes.txt
end

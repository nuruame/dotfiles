function networkcopy -d "network copier" -a sourcefile -a destination
    rsync -P -e ssh $sourcefile $destination
end

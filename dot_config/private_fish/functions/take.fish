function take -d "create dir & then cd into it" -a "directory"
    command mkdir -p $directory
    cd $directory
end

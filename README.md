# Import-Folders
Script to import folder structure into git repo

Situation
You have a lot of export backups on your disk and you want to minimize the footprint.
The structure is like:

    \yyyy-mm-dd_HHMMss_Something\....
    \2002-01-02_223042_Something\....
    \2002-01-03_223112_Something\....

I think you got it by now. The date stamps is from when the export runs.

Since the export does every item in the database (or wherever the content get stored from the application),
there is a LOT of redundant data. Perfect victim for the capabilities of git, right?

The plan is to create a repo, paste each export in there one by one and commit it with the right datestamps
This can be done easily with a powershell script. If you are more familiar with other languages feel free to
fork and adpat on this idea.

I used this internally for migrating our zipped code-backups into git repositories.
But I often come across similar use cases where this script fits right in.

ToDO:  Day 2 operation to have a scheduled task scoop up the new arrivals and feed it to the repository.

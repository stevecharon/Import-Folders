# Import-Folders
Script to import folder structure into git repo

## Situation
You have a system which dumps out a daily dose of all the records up until then as a measure to get going when the DB crashes
So lots of export backups on your disk and you want to minimize the footprint.

The structure is like:

    \yyyy-mm-dd_HHMMss_Something\....
    \2002-01-02_223042_Something\....
    \2002-01-03_223112_Something\....

I think you got it by now. The date stamps is from when the export runs, not the actual data entry time

Since the export does every item in the database (or wherever the content get stored from the application),
there is a LOT of redundant data. Perfect victim for the capabilities of git, right?

The plan is to create a repo, paste each export in there one by one and commit it with the right datestamps
This can be done easily with a powershell script. If you are more familiar with other languages feel free to
fork and adpat on this idea.

I used this internally for migrating our zipped code-backups into git repositories.
But I often come across similar use cases where this script fits right in.
The footprint in git is way less troublesome without losing any data.
On another project I reduced the space consumption from 30GB to around 120MB. 
Right that is a 256th of the original space.
Even binaries fold quickly that way. Not on this magnitude. But still.

ToDO:  Day 2 operation to have a scheduled task scoop up the new arrivals and feed it to the repository.
Stay put for that

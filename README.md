## Continuous Versions
A utility for keeping track of new (Ruby) releases. 
It has been developed as a part of automating RVM binaries build process 
that needs to be triggered manually whenever a new version of interpreter 
is released.

### Installation and usage (tested only on macOS)

1. Download the code and place it in a directory.
2. Install ruby (Tested on `2.5.1`) and gem `bundle`.
3. Do `bundle install` within the directory.
4. To run an iteration of Continuous Versions, do `./bin/continuous-versions`.

### Intuition
The utility returns the difference between the interpreter releases from RSS feed and 
those stored in a list on RVM's github. As a result, it allows to quickly check which 
binaries need to be uploaded.

Currently the utility only supports JRuby flow, so if you run it, it will output the diff
between the list of binaries at RVM repo and those at JRuby's most recent RSS feed.

Later we will implement another part that submits the GitHub PR based on this diff.

For MRI the flow is slightly more complex, since after we have the versions diff, we need to 
trigger the server build to produce the binaries for every combination of new version and a
system supported by RVM. After this process is done, the server would report back to 
Continuous Versions with the status. If successful, the GitHub PR needs to be submitted.

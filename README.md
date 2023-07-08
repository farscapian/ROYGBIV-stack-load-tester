# ROYGBIV-stack-load-tester
A docker application that performs load testing against a remote ROYGBIV-stack. This is added as a submodule to ROYGBIV-stack for load testing purposes.

# How to use

All you need to do is run the following command:

```bash
./run.sh --connection-csv-path=/path/to/connections.csv
```

# connection.csv

connections.csv should looks something like the following:

```
https://app.clams.tech/connect?address=03713a63508f418066b7b5e660f22161350c2336f656d8357690472472aff6dd08@roygbiv.team:6000&type=direct&value=wss:&rune=h8BLzhYqschVKTeksgvJVfOeSdivm4sD0321g0uu2-g9MA==
https://app.clams.tech/connect?address=03348aa1fbfa6782f48928be1dde6b51b1e9f6d4c34014bc7c185651afee48731d@roygbiv.team:6001&type=direct&value=wss:&rune=5jwoDofl5JI1x62tO1Of8qUF4-qZQHsVkwZv5-f0gAU9MA==
https://app.clams.tech/connect?address=02c20ab2cfdfa28f1797e9938ff930dc763455285edda234e96bac1f0489b8bf9b@roygbiv.team:6002&type=direct&value=wss:&rune=AOOV20qsRe-TCk2-Si1C47nlux_fh1GKuxor9jLrwvo9MA==

```